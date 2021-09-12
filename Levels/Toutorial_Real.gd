extends Area2D



func enterTrigger(body):
	if body.get_name() == "Player":
		print("Starte Level Tutorial Dream2")
		get_tree().change_scene_to(load('res://Levels/Tutorial_Real_1.tscn'))
