extends Spatial

var min_x: float
var max_x: float
var upper_y_m: float
var upper_y_c: float
var lower_y_m: float
var lower_y_c: float
var rand = RandomNumberGenerator.new()

func _ready():
	min_x = $A.transform.origin.x
	max_x = $B.transform.origin.x
	
	upper_y_m = get_slope($A, $B)
	upper_y_c = get_y_at_x0($A, upper_y_m)
	
	lower_y_m = get_slope($C, $D)
	lower_y_c = get_y_at_x0($C, lower_y_m)
	
	spawn_plants()
	
func spawn_plants():
	var Plant = load("res://plants/grass.glb")
	
	for i in range(10):
		var plant = Plant.instance()
		plant.transform.origin = random_position()
		add_child(plant)
	
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
