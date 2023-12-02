extends Node2D

signal item_picked_up

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		i.connect("on_pickup", self._on_item_pickup)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_pickup(item):
	print(str(item.name))
	self.emit_signal("item_picked_up", item)
