extends Node


func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Real2")
		get_tree().change_scene_to(load('res://Levels/Tutorial_Real_2.tscn'))
