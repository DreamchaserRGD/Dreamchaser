extends Node2D

onready var in_game = $InGame
onready var camera = $Camera2D

var player = null

var level = null

func _ready():
	add_level()
	connect_to_doors()
	check_for_door()
	put_camera_on_player()
	pass

func add_level():
	level = load(str("res://Scenes/levels/level", G.next_level_number, "_" , G.real_or_dream, ".tscn")).instance()
	in_game.add_child(level)
	
	player = level.find_node("Player")

func put_camera_on_player():
	remove_child(camera)
	player.add_child(camera)

func connect_to_doors():
	for child in level.find_node("Objects").get_children():
		if child.name.begins_with("Door"):
			child.connect("enter_door", self, "_on_enter_something")
		elif child.name.begins_with("Bed"):
			child.connect("enter_bed", self, "_on_enter_something")

func _on_enter_something():
	get_tree().reload_current_scene()

func check_for_door():
	print("check doors")
	if G.next_level_door != null:
		var door = level.find_node(G.next_level_door)
		player.position = door.position
		G.next_level_door = null
	elif G.next_level_bed != null:
		print("check hoes")
		var bed = level.find_node(G.next_level_bed)
		player.position = bed.position
		G.next_level_bed = null
