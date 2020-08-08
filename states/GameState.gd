extends Node

enum PLANT {
	EMPTY,
	GRASS,
	FLOWER_PURPLE,
	SUN_FLOWER
}

const PLANT_ASSETS = {
	PLANT.GRASS: {
		path = "res://plants/grass.glb",
		amount = 100
	},
	PLANT.FLOWER_PURPLE: {
		path = "res://plants/flower_purple.glb",
		amount = 30
	},
	PLANT.SUN_FLOWER: {
		path = "res://plants/sunflower.glb",
		amount = 20
	}
}

var selected_plant = PLANT.GRASS

func select_plant(plant):
	selected_plant = plant
	
func get_selected_plant_asset():
	return PLANT_ASSETS[selected_plant]
