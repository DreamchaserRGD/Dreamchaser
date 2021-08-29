extends Sprite


# Declare member variables here. Examples:
var inArea = true;
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact") and inArea:
		queue_free()
		#doSomething()


func _on_Hurtbox_area_entered(area):
	inArea = true;
	
	


func _on_Hurtbox_area_exited(area):
	inArea = false;
