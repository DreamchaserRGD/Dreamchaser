extends Node

func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Dream1")
		get_tree().change_scene_to(load('res://Levels/Tutorial_Dream_1.tscn'))
