extends Node2D

const Scene_Real2 = preload("res://Levels/Scene/Tutorial/Tutorial_Real_2.tscn")
const Scene_Dream = preload("res://Levels/Scene/Tutorial/Tutorial_Dream.tscn")
const Scene_Level2 = preload("res://Levels/Scene/Level_3/Level_3_Real_1.tscn")

enum {
	Level1_Real, 
	Level1_Dream, 
	Level2, Level3
}

var state = Level1_Real;

var childName

var leverPulled = false;
var transitionScreen
var root

func _ready():
	setObjects()

func leverGetPulled():
	leverPulled = true;

func setObjects():
	transitionScreen = get_node("/root/SceneManager/TransitionScreen")
	root = get_tree().get_root().get_node("SceneManager")

func transition_to_Real():
	setObjects()
	if leverPulled:
		state = Level1_Real
		transitionScreen.transition()

func transition_to_Dream():
	setObjects()
	state = Level1_Dream
	transitionScreen.transition()

func transition_to_Level2_Dream():
	setObjects()
	transitionScreen.transition()

func transition_to_Level2_Real():
	setObjects()
	state = Level2
	transitionScreen.transition()

func _on_TransitionScreen_transitioned():
	match state:
		Level1_Real:
			root.get_child(1).queue_free()
			root.add_child(Scene_Real2.instance())
		Level1_Dream:
			root.get_child(1).queue_free()
			root.add_child(Scene_Dream.instance())
		Level2:
			root.add_child(Scene_Level2.instance())
			root.get_child(1).queue_free()

