extends KinematicBody2D

const FRICTION = 900
const ACCELERATION = 960
const MAX_SPEED = 100
const GRAVITY = 700
const JUMP_FORCE = 250

var velocity = Vector2.ZERO
var stats = PlayerStats

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationPlayer/AnimationTree
onready var animationState = animationTree.get("parameters/playback")


func _ready():
	animationTree.active = true
	stats.connect("no_health", self, "resetAfterDeath")

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	var input_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			velocity.y -= JUMP_FORCE
		
	if input_x < 0:
		input_x = -1
	elif input_x > 0:
		input_x = 1
		
	var orig_y = velocity.y
	if input_x != 0:
		set_blend_position(input_x)
		if is_on_floor():
			animationState.travel("Movement")
		else:
			if orig_y < 0:
				animationState.travel("JumpLoop")
			else:
				animationState.travel("FallLoop")
		velocity = velocity.move_toward(Vector2(input_x, 0) * MAX_SPEED, ACCELERATION * delta)
		
	else:
		if is_on_floor():
			animationState.travel("Idle")
		else:
			if orig_y < 0:
				animationState.travel("JumpLoop")
			else:
				animationState.travel("FallLoop")
		velocity = velocity.move_toward(Vector2(0, 0), FRICTION * delta)

	velocity.y = orig_y
	velocity.y = clamp(velocity.y, -350, 350)
	velocity = move_and_slide(velocity, Vector2.UP)
	
func set_blend_position(input_x: int) -> void:
	animationTree.set("parameters/Idle/blend_position", input_x)
	animationTree.set("parameters/Movement/blend_position", input_x)
	animationTree.set("parameters/Jump/blend_position", input_x)
	animationTree.set("parameters/JumpLoop/blend_position", input_x)
	animationTree.set("parameters/Fall/blend_position", input_x)
	animationTree.set("parameters/FallLoop/blend_position", input_x)

# On Player gets damage
func _on_Hurtbox_area_entered(area):
	stats.health -= 1
	# Change Scene to current Scene
	var door = get_tree().find_node(G.next_level_door)
	var player = get_tree().find_node("Player")
	player.position = door.position

# On Death
func resetAfterDeath():
	stats.health = 4
	# Change Scene to beginning of Level
	get_tree().change_scene_to(load('res://Scenes/levels/Menu.tscn'))
