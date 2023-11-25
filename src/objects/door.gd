extends Area2D


func _finish_level():
	get_tree().reload_current_scene()


func _on_body_entered(body):
	if body is Character:
		_finish_level()
