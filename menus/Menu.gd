extends CanvasLayer

func _on_Grass_pressed():
	GameState.select_plant(GameState.PLANT.GRASS)

func _on_PurpleFlower_pressed():
	GameState.select_plant(GameState.PLANT.FLOWER_PURPLE)
