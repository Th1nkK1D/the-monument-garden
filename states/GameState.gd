extends Node

enum PLANT {
	GRASS,
	FLOWER_PURPLE
}

const PLANT_ASSETS = {
	PLANT.GRASS: {
		path = "res://plants/grass.glb",
		amount = 100
	},
	PLANT.FLOWER_PURPLE: {
		path = "res://plants/flower_purple.glb",
		amount = 30
	}
}

var selected_plant = PLANT.GRASS

func select_plant(plant):
	selected_plant = plant
	
func get_selected_plant_asset():
	return PLANT_ASSETS[selected_plant]
