extends Node
# initializes and throws out signals for health change

export(int) var max_health = 4
var health = max_health setget set_health

signal no_health
signal health_changed(value)

func set_health(value):
	health = value
	
	if health <= 0:
		emit_signal("no_health")
	else:
		emit_signal("health_changed", health)

func _ready():
	self.health = max_health
