extends Area

var is_hovered := false
signal is_clicked

func _on_Tile_mouse_entered():
	self.is_hovered = true

func _on_Tile_mouse_exited():
	self.is_hovered = false

func _unhandled_input(event):
	if self.is_hovered and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("is_clicked")
