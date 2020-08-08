extends CanvasLayer

func _on_Grass_pressed():
	GameState.select_plant(GameState.PLANT.GRASS)

func _on_PurpleFlower_pressed():
	GameState.select_plant(GameState.PLANT.FLOWER_PURPLE)

func _on_Sunflower_pressed():
	GameState.select_plant(GameState.PLANT.SUN_FLOWER)

func _on_Clear_pressed():
	GameState.select_plant(GameState.PLANT.EMPTY)
