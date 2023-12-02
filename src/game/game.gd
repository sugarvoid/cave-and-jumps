extends Node2D

const title_screen = "res://menu/title_screen.tscn"
const end_screen = "res://menu/end_screen.tscn"


var current_level_num = -1
var current_level: Level


func _process(delta):
	# Quit
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().current_scene.name != "TitleScreen":
			go_to_title_screen()
		else:
			get_tree().quit()
	# Fullscreen
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(Vector2i(1280, 720))
			DisplayServer.window_set_position(Vector2i(320, 180))


func start_game():
	get_tree().change_scene_to_file(title_screen)



func go_to_next_level(curr_level: int):
	# build level address
	var next_level = curr_level + 1
	var next_level_path: String = str("res://level/level_", curr_level, ".tscn")
	
	# check if scene exists and change scene or go to end screen
	if ResourceLoader.exists(next_level_path):
		get_tree().call_deferred("change_scene_to_file", next_level_path)
	else:
		print("level not there")


func go_to_title_screen():
	get_tree().call_deferred("change_scene_to_file", title_screen)
