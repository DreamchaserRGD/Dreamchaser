extends Node


func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level2 Real")
		get_tree().change_scene_to(load('res://Levels/Level2_Real.tscn'))
