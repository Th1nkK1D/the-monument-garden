extends Spatial

var MATERIAL = {
	normal = load("res://tiles/tile_unplanted.material"),
	transparent = load("res://buildings/pillar_transparent.material")
}

var mouse_is_exited

func _on_Area_mouse_entered():
	$pillar/pillar1001.material_override = MATERIAL.transparent
	mouse_is_exited = false
	$Area.visible = false
	$MouseCheckTimer.start()

func _on_MouseCheckTimer_timeout():
	mouse_is_exited = true
	$MaterialChangeTimer.start()
	$Area.visible = true
	$MouseCheckTimer.stop()

func _on_MaterialChangeTimer_timeout():
	if mouse_is_exited:
		$pillar/pillar1001.material_override = MATERIAL.normal
		$MouseCheckTimer.stop()
