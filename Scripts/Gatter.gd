extends Node2D

export(int) var lever_number
var Door_Open = preload("res://Scenes/Gatter_offen.tscn")
var door_Open
var world

func _ready():
	if lever_number == 1:
		if G.lever_pulled_Gatter1:
			door_Open = Door_Open.instance()
			world = get_tree().current_scene
			world.add_child(door_Open)
			door_Open.global_position = self.global_position
			queue_free()
	elif lever_number == 2:
		if G.lever_pulled_Gatter2:
			door_Open = Door_Open.instance()
			world = get_tree().current_scene
			world.add_child(door_Open)
			door_Open.global_position = self.global_position
			queue_free()
	elif lever_number == 3:
		if G.lever_pulled_Gatter3:
			door_Open = Door_Open.instance()
			world = get_tree().current_scene
			world.add_child(door_Open)
			door_Open.global_position = self.global_position
			queue_free()
