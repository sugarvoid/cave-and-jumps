extends Area2D

var picked_up = false

@onready var collision = $CollisionShape2D

func _bit_picked_up():
	picked_up = true
	collision.set_deferred("disabled", true)
	queue_free()

func _on_body_entered(body):
	if body is Character:
		_bit_picked_up()
