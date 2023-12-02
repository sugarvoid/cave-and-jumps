extends Area2D

signal on_pickup



@onready var collision = $CollisionShape2D


func _on_body_entered(body):
	if body is Player:
		self.emit_signal("on_pickup", self)
		collision.set_deferred("disabled", true)
		self.call_deferred("queue_free")
