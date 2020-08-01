extends Spatial


func _on_ArrowClockWise_is_clicked():
	$World.rotate_one_forth_anticlockwise()

func _on_ArrowAntiClockWise_is_clicked():
	$World.rotate_one_forth_clockwise()
