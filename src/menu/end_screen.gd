extends Control


func _process(delta):
	if Input.is_action_just_pressed("jump")\
	or Input.is_action_just_pressed("ui_accept"):
		Game.go_to_title_screen()

func _on_timer_restart_timeout():
	Game.go_to_title_screen()
