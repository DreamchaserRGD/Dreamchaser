extends Node2D

signal enter_door

export(int) var level_number
export(String) var door_name

var door_open = preload("res://Assets/Tiles/Tür_Offen.png")
var door_closed = preload("res://Assets/Tiles/Tür_Zu.png")

onready var DoorTexture = get_node("DoorTexture")
onready var area = $Area2D

func switch_texture(num):
	if  (num == 1):
		DoorTexture.set_texture(door_open)
	if  (num == 2):
		DoorTexture.set_texture(door_closed)

func _ready():
	pass

func _physics_process(delta):
	for body in area.get_overlapping_bodies():
		if body.name == "Player" and Input.is_action_just_pressed("interact"):
			G.next_level_door = door_name
			G.next_level_number = level_number
			G.real_or_dream = "real"
			emit_signal("enter_door")
		if body.name == "Player" and Input.is_action_just_pressed("ui_up"):
			switch_texture(1)
		if body.name == "Player" and Input.is_action_just_pressed("ui_down"):
			switch_texture(2)
