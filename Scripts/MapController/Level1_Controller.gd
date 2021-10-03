extends Node

#TextBoxen Prefabs
var textBox_Locked = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_DoorLocked.tscn")
var textBox_Other = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_OtherWorld.tscn")
var textBox_Lever = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_Lever.tscn")

#TextBoxen Instance
var TextBox
var level

func _on_Door_Locked_triggerPoint():
	TextBox = textBox_Locked.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_Lever_triggerPoint():
	TextBox = textBox_Lever.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_OtherWorld_triggerPoint():
	TextBox = textBox_Other.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)
