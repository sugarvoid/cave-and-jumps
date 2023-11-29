extends Node

const level_adderess_begining = "res://level/level_"
const level_adderess_end = ".tscn"
const first_level_adderess = "res://level/level_1000.tscn"

var level_number = 1000


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().current_scene.name != "TitleScreen":
			get_tree().change_scene_to_file("res://menu/title_screen.tscn")
		else:
			get_tree().quit()
	
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(Vector2i(1280, 720))
			DisplayServer.window_set_position(Vector2i(320, 180))


func go_to_next_level():
	# build level address
	var next_level_number = level_number + 1
	var next_level_adderess = level_adderess_begining + str(next_level_number) + level_adderess_end
	# check if level exists and change to it or go back to level 0
	if ResourceLoader.exists(next_level_adderess):
		get_tree().change_scene_to_file(next_level_adderess)
		level_number = int(next_level_adderess)
	else:
		get_tree().change_scene_to_file(first_level_adderess)
		level_number = 1000
