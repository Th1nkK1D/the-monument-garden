extends Area

export var tile_model_name: String

var is_hovered := false
var is_planted := false
var tile_model

func _ready():
	tile_model = get_node("../" + tile_model_name)
	set_tile_material("res://tiles/tile_unplanted.material")

func _on_Tile_mouse_entered():
	is_hovered = true

func _on_Tile_mouse_exited():
	is_hovered = false

func _unhandled_input(event):
	if self.is_hovered and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		if is_planted:
			$PlantSpawnArea.clear_plants()
			set_tile_material("res://tiles/tile_unplanted.material")
			is_planted = false
		else:
			set_tile_material("res://tiles/tile_planted.material")
			$PlantSpawnArea.spawn_plants()
			is_planted = true

func set_tile_material(material: String):
	tile_model.get_child(0).material_override = load(material)
