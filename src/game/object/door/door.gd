extends Area2D

signal on_player_entered

var is_open = false
var _frame: int = 2

const spr_open = 1
const spr_close = 2

@onready var sprite_2d = $Sprite2D


func _ready():
	self.sprite_2d.frame = spr_close

func open():
	self.is_open = true
	self.sprite_2d.frame = spr_open


func _on_body_entered(body: Node2D):
	if body is Player and self.is_open:
		emit_signal("on_player_entered")
