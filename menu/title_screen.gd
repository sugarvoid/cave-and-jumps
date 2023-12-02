extends Control


func _ready():
	$Button.grab_focus()


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		_start_game()



func _start_game() -> void:
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_button_pressed():
	_start_game()