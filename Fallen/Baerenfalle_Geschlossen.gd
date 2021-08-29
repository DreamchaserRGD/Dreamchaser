extends Node




# Called when the node enters the scene tree for the first time.
func _ready():
	var time = 2
	yield(get_tree().create_timer(time), "timeout")
	#animation "Baerenfalle zerstoert starten"
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
