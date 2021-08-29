extends Area2D

func trapEnter( area ):
	if area.get_name() == "Player":
		print("Trapped!");
		var GBaerenfalle = preload("res://Fallen/Fallen_Prefab/Baerenfalle_Geschlossen.tscn")
		var gBaerenFalle = GBaerenfalle.instance()
		var world = get_tree().current_scene
		world.add_child(gBaerenFalle)
		gBaerenFalle.global_position = area.global_position
		queue_free()
