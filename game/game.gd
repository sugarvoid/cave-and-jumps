extends Node2D

const title_screen: String = "res://game/menu/title_screen.tscn"
const end_screen: String = "res://game/menu/end_screen.tscn"

const LAST_LEVEL: int = 0


@onready var item_manager = get_node("ItemManager")
@onready var level_manager = get_node("LevelManager")

@onready var player: Player = get_node("Player")


var current_level_num: int  = -1
var current_level: Level


func _ready():
	self.item_manager.connect("item_picked_up", self.on_item_picked_up)


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
			go_to_title_screen()
	
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
	var next_level = curr_level + 1
	var next_level_path: String = str("res://level/level_", curr_level, ".tscn")
	# Place door
	# Place key
	# Place player
	
	if ResourceLoader.exists(next_level_path):
		get_tree().call_deferred("change_scene_to_file", next_level_path)
	else:
		print("level not there")


func go_to_title_screen():
	get_tree().call_deferred("change_scene_to_file", title_screen)
	

func on_item_picked_up(item):
	if item.name == "Key":
		self.level_manager.open_door()
