extends Area

signal is_clicked

var is_hovered

var MATERIAL = {
	normal = load("res://menus/arrow.material"),
	hovered = load("res://menus/arrow_hovered.material")
}

func _ready():
	update_material(MATERIAL.normal)

func _on_Arrow_mouse_entered():
	is_hovered = true
	update_material(MATERIAL.hovered)

func _on_Arrow_mouse_exited():
	is_hovered = false
	update_material(MATERIAL.normal)

func _unhandled_input(event):
	if self.is_hovered and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("is_clicked")

func update_material(material: Material):
	$arrow/arrow.material_override = material
