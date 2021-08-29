extends Area2D


func trapEnter( area ):
	if area.get_name() == "Player":
		print("FakeDoor getriggert!");
		yield(get_tree().create_timer(2), "timeout")
		var Loch = preload("res://Fallen/Loch.tscn")
		var loch = Loch.instance()
		var world = get_tree().current_scene
		world.add_child(loch)
		loch.global_position = global_position
		queue_free()
