extends Spatial

const rotation_y_range = PI
const rotation_x_range = 0.2
const scale_range = 0.2

var min_x: float
var max_x: float
var upper_y_m: float
var upper_y_c: float
var lower_y_m: float
var lower_y_c: float
var current_plant = null

var rand = RandomNumberGenerator.new()

func _ready():
	min_x = $A.transform.origin.x
	max_x = $B.transform.origin.x
	
	upper_y_m = get_slope($A, $B)
	upper_y_c = get_y_at_x0($A, upper_y_m)
	
	lower_y_m = get_slope($C, $D)
	lower_y_c = get_y_at_x0($C, lower_y_m)
	
func spawn_plants():
	if current_plant != null:
		clear_plants()
		
	var plant_asset = GameState.get_selected_plant_asset()
	var Plant = load(plant_asset.path)
	
	for i in range(plant_asset.amount):
		var plant = Plant.instance()
		plant.transform.origin = random_position()
		plant.rotation = random_rotation()
		plant.scale = random_scale()
		$Plants.add_child(plant)
	
	current_plant = GameState.selected_plant

func clear_plants():
	for plant in $Plants.get_children():
		plant.queue_free()
	
	current_plant = null
	
func get_slope(A: Position3D, B: Position3D):
	return (B.transform.origin.z - A.transform.origin.z) / (B.transform.origin.x - A.transform.origin.x)
	
func get_y_at_x0(A: Position3D, m: float):
	return A.transform.origin.z - m * A.transform.origin.x

func get_y_from_linear_eq(m: float, x: float, c: float):
	return m*x + c
	
func random_position():
	var x = rand.randf_range(min_x, max_x)
	var min_y = get_y_from_linear_eq(lower_y_m, x, lower_y_c)
	var max_y = get_y_from_linear_eq(upper_y_m, x, upper_y_c)
	var y = rand.randf_range(min_y, max_y)
	
	return Vector3(x, 0, y)
	
func random_rotation():
	var rotation_y = rand.randf_range(-rotation_y_range, rotation_y_range)
	var rotation_x = rand.randf_range(-rotation_x_range, rotation_x_range)
	
	return Vector3(rotation_x, rotation_y, 0)
	
func random_scale():
	var scale = rand.randf_range(1-scale_range, 1+scale_range)
	
	return Vector3(scale, scale, scale)
