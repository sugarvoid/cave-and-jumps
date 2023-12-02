extends Node2D


@onready var door = $Door

# Called when the node enters the scene tree for the first time.
func _ready():
	self.door.connect("on_player_entered", self._go_to_next_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _place_door():
	pass

func open_door():
	self.door.open()

func _go_to_next_level():
	print("going to next level")
