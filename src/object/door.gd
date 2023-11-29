extends Area2D


func _on_body_entered(body):
	if body is Character:
		Game.go_to_next_level()
