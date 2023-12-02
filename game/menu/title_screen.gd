extends Control


func _ready():
	$Button.grab_focus()


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		_start_game()
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()



func _start_game() -> void:
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_button_pressed():
	_start_game()
