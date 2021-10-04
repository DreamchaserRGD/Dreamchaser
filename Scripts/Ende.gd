extends Area2D




func enterTrigger(body):
	if body.get_name() == "Player":
		get_tree().change_scene_to(load('res://Scenes/levels/Menu.tscn'))
