extends Node2D

const Scene_Real2 = preload("res://Levels/Scene/Tutorial/Tutorial_Real_2.tscn")
const Scene_Dream = preload("res://Levels/Scene/Tutorial/Tutorial_Dream.tscn")
const Scene_Level2 = preload("res://Levels/Scene/Level_2/Leve_2_Real_1.tscn")

var real_1 = false;
var real_2 = false;
var dream = false;

var childName

var leverPulled = false;
var transitionScreen
var root

func _ready():
	setObjects()

func leverGetPulled():
	leverPulled = true;

func setObjects():
	transitionScreen = get_node("/root/Tutorial/TransitionScreen")
	root = get_tree().get_root().get_node("Tutorial")

func transition_to_Real():
	setObjects()
	dream = false;
	if leverPulled:
		#real_1 = false;
		real_2 = true;
		transitionScreen.transition()
	#else:
		#real_1 = true;
		#real_2 = false;
		#transitionScreen.transition()

func transition_to_Dream():
	setObjects()
	#real_1 = false;
	real_2 = false;
	dream = true;
	transitionScreen.transition()

func _on_TransitionScreen_transitioned():
	#if real_1:
	#	var Scene_Real1 = preload(res://Levels/Scene/Tutorial/Tutorial_Real_1.tscn)
	#	root.get_child(1).queue_free()
	#	root.add_child(Scene_Real1.instance())
	if real_2:
		root.get_child(1).queue_free()
		root.add_child(Scene_Real2.instance())
	elif dream:
		root.get_child(1).queue_free()
		root.add_child(Scene_Dream.instance())
	else:
		print("Fehler: Level nicht gefunden!");
