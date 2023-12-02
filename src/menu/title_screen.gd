extends Control


func _ready():
	$TextureButton.grab_focus()


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		_on_texture_button_pressed()


func _on_texture_button_pressed():
	get_tree().change_scene_to_file(Game.current_level_address)
