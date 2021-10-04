extends Node2D

onready var in_game = $InGame

var player = null

var level = null
var transitionSys

func _ready():
	transitionSys = in_game.get_parent().get_child(2)
	add_level()
	connect_to_doors()
	check_for_door()
	pass

func add_level():
	level = load(str("res://Scenes/levels/level", G.next_level_number, "_" , G.real_or_dream, ".tscn")).instance()
	in_game.add_child(level)
	
	player = level.find_node("Player")

func connect_to_doors():
	player.connect("enter_bed", self, "_on_enter_something")
	for child in level.find_node("Objects").get_children():
		if child.name.begins_with("Door"):
			child.connect("enter_door", self, "_on_enter_something")
		elif child.name.begins_with("Bed"):
			child.connect("enter_bed", self, "_on_enter_something")

func _on_enter_something():
	transitionSys.transition()

func check_for_door():
	if G.next_level_door != null:
		var door = level.find_node(G.next_level_door)
		player.position = door.position
		G.next_level_door = null
	elif G.next_level_bed != null:
		var bed = level.find_node(G.next_level_bed)
		player.position = bed.position
		if G.real_or_dream == "real":
			G.next_level_bed = null


func _on_CanvasLayer_transitioned():
	get_tree().reload_current_scene()
