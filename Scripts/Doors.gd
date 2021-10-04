extends Node2D

signal enter_door

export(int) var level_number
export(String) var door_name
export(String) var is_always_open

var locked = true;

var door_open = preload("res://Assets/Tiles/Tür_Offen.png")
var door_closed = preload("res://Assets/Tiles/Tür_Zu.png")

onready var DoorTexture = get_node("DoorTexture")
onready var area = $Area2D

func switch_texture():
	if is_always_open != "yes":
		if  (G.lever_pulled):
			DoorTexture.set_texture(door_open)
			locked = false;
		else:
			DoorTexture.set_texture(door_closed)
			locked = true;
	else:
		DoorTexture.set_texture(door_open)
		locked = false;

func _ready():
	switch_texture()

func _physics_process(delta):
	for body in area.get_overlapping_bodies():
		if body.name == "Player" and Input.is_action_just_pressed("interact"):
			if !locked:
				G.next_level_door = door_name
				G.next_level_number = level_number
				G.real_or_dream = "real"
				G.lever_pulled = false;
				G.lever_pulled_Gatter1 = false;
				G.lever_pulled_Gatter2 = false;
				G.lever_pulled_Gatter3 = false;
				emit_signal("enter_door")
