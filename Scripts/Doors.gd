extends Node2D

signal enter_door

export(int) var level_number
export(String) var door_name

onready var area = $Area2D

func _ready():
	pass

func _physics_process(delta):
	for body in area.get_overlapping_bodies():
		if body.name == "Player" and Input.is_action_just_pressed("ui_up"):
			G.next_level_door = door_name
			G.next_level_number = level_number
			G.real_or_dream = "real"
			emit_signal("enter_door")
