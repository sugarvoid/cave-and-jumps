extends Control


func _process(delta):
	if Input.is_action_just_pressed("jump")\
	or Input.is_action_just_pressed("ui_accept"):
		_back_to_title()

func _on_timer_restart_timeout():
	_back_to_title()

func _back_to_title():
	get_tree().change_scene_to_file("res://menu/title_screen.tscn")
