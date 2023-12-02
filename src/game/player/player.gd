extends CharacterBody2D
class_name Character

const SPEED = 60.0
const DEFAULT_GRAVITY = 240.0
const JUMP_VELOCITY = -80.0
const COYOTE_TIME = 0.1
const JUMP_REDUCTION = 0.4
const GROUND_ACCEL = 0.5
const GROUND_DECEL = 0.4
const AIR_ACCEL = 0.1
const AIR_DECEL = 0.02

var gravity = DEFAULT_GRAVITY
var air_timer = 0.0
var input_direction = 0.0
var direction_facing = Vector2.RIGHT

var can_jump = true
var can_reduce_jump = true
var can_turn = true
var can_move = true

var anim = "idle"

@onready var PrejumpTimer = $PrejumpTimer


func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):	
	
	
	if self.direction_facing == Vector2.LEFT:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	var new_anim = ""
	if self.is_on_floor():
		if abs(self.velocity.x) < 1:
			new_anim = "idle"
		else:
			new_anim = "run"
	else:
		if self.velocity.y < 0:
			new_anim = "jump"
		else:
			new_anim = "fall"
	
	if new_anim != anim:
		anim = new_anim
		$AnimatedSprite2D.play(anim)
	
	
	
	
	
	
	input_direction = Input.get_axis("left", "right")
	
	if not is_on_floor():
		air_timer += delta
		if velocity.y > 0:
			velocity.y += gravity * delta
		else:
			velocity.y += gravity *1.1 * delta
	else:
		air_timer = 0.0
	
	if can_jump:
		if Input.is_action_just_pressed("jump"):
			PrejumpTimer.start()
		if not PrejumpTimer.is_stopped() and air_timer < COYOTE_TIME:
			if Input.is_action_pressed("jump"):
				velocity.y = JUMP_VELOCITY
			else:
				velocity.y = JUMP_VELOCITY * JUMP_REDUCTION
			PrejumpTimer.stop()
	
	if can_reduce_jump:
		if velocity.y < 0 and Input.is_action_just_released("jump"):
			velocity.y *= JUMP_REDUCTION
	
	if can_turn:
		if input_direction > 0:
			direction_facing = Vector2.RIGHT
		elif input_direction < 0:
			direction_facing = Vector2.LEFT
	
	if can_move:
		if input_direction:
			if is_on_floor():
				velocity.x = lerp(velocity.x, input_direction * SPEED, GROUND_ACCEL)
			else:
				velocity.x = lerp(velocity.x, input_direction * SPEED, AIR_ACCEL)
		else:
			if is_on_floor():
				velocity.x = lerp(velocity.x, input_direction * SPEED, GROUND_DECEL)
			else:
				velocity.x = lerp(velocity.x, 0.0, AIR_DECEL)
	
	
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited():
	get_tree().reload_current_scene()
