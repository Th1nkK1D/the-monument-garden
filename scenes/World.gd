extends Spatial

const rotate_velocity = 5
const stop_range = 0.1

var rotate_speed
var target_rotation = 0

func _process(delta):
	if rotation.y != target_rotation:
		rotation.y += rotate_speed * delta
		
		if abs(rotation.y - target_rotation) < stop_range:
			rotation.y = target_rotation

func rotate_one_forth_clockwise():
	target_rotation -= PI/2
	rotate_speed = -rotate_velocity
	
func rotate_one_forth_anticlockwise():
	target_rotation += PI/2
	rotate_speed = rotate_velocity
