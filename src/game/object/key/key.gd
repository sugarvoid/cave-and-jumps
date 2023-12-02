extends Area2D

var picked_up = false

@onready var collision = $CollisionShape2D


func _on_body_entered(body):
	if body is Character and not picked_up:
		picked_up = true
		collision.set_deferred("disabled", true)
		self.call_deferred("queue_free")
