class_name Level
extends Node2D

@onready var lbl_title: Label = get_node("LblTitle")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func set_title_text(text: String) -> void:
	self.lbl_title.text = text
