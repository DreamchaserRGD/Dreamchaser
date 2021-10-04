extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4

onready var clock4 = $"Clock 4"
onready var clock3 = $"Clock 3"
onready var clock2 = $"Clock 2"
onready var clock1 = $"Clock 1"

# initializes current Health in the beginning of a Scene
# as well as connections between PlayerStats and Helth reduction
func _ready():
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	if(PlayerStats.health == 4):
		clock4.visible = true
	elif (PlayerStats.health == 3):
		clock3.visible = true
	elif (PlayerStats.health == 2):
		clock2.visible = true
	elif (PlayerStats.health == 1):
		clock1.visible = true
	else:
		print("error while trying to load Scene: Healtbar Error")

# change Halthbar on damage
func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	
	if(PlayerStats.health == 4):
		print("")
	elif (PlayerStats.health == 3):
		clock4.queue_free()
		clock3.visible = true
		print("3 lifes left")
	elif (PlayerStats.health == 2):
		clock3.queue_free()
		clock2.visible = true
		print("2 lifes left")
	elif (PlayerStats.health == 1):
		clock2.queue_free()
		clock1.visible = true
		print("1 life left")
	elif (PlayerStats.health == 0):
		clock1.queue_free()
		print("0 life left")
	else:
		print("error while trying to reduce healthbar")


