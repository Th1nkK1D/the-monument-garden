extends Area

var is_hovered := false

func _on_Tile_mouse_entered():
	print('HOVERED')
	self.is_hovered = true

func _on_Tile_mouse_exited():
	print('LEFT')
	self.is_hovered = false

func _unhandled_input(event):
	if self.is_hovered and event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		print(event.pressed)
