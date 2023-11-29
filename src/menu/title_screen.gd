extends Control


func _ready():
	$TextureButton.grab_focus()

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://level/level_1000.tscn")
