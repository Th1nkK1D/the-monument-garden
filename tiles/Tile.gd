extends Area

export var tile_model_name: String

var is_hovered := false
var tile_model

func _ready():
	tile_model = get_node("../" + tile_model_name)
	update_tile_material_from_plant()

func _on_Tile_mouse_entered():
	is_hovered = true
	set_tile_material("res://tiles/tile_highlight.material")
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		trigger_Plant_Spawn_Area()

func _on_Tile_mouse_exited():
	is_hovered = false
	update_tile_material_from_plant()

func _unhandled_input(event):
	if self.is_hovered and event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		trigger_Plant_Spawn_Area()

func trigger_Plant_Spawn_Area():
	if $PlantSpawnArea.current_plant != GameState.selected_plant:
		$PlantSpawnArea.spawn_plants()
	else:
		$PlantSpawnArea.clear_plants()
	
	update_tile_material_from_plant()
		
func update_tile_material_from_plant():
	if $PlantSpawnArea.current_plant != null:
		set_tile_material("res://tiles/tile_planted.material")
	else:
		set_tile_material("res://tiles/tile_unplanted.material")

func set_tile_material(material: String):
	tile_model.get_child(0).material_override = load(material)
