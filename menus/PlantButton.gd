extends TextureButton

export(GameState.PLANT) var plant_type

func _pressed():
	for sibling in get_parent().get_children():
		if sibling.name != name and sibling.pressed:
			sibling.pressed = false

	if !pressed:
		pressed = true
	else:
		GameState.select_plant(plant_type)
	
