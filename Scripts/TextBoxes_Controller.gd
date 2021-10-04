extends Node

#TextBoxen Prefabs
var textBox_Locked = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_DoorLocked.tscn")
var textBox_Other = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_OtherWorld.tscn")
var textBox_Lever = preload("res://Textboxes/TextBox_Objects/Level1/DialogBox_Lever.tscn")
var textBox_Enemy = preload("res://Textboxes/TextBox_Objects/Level2/DialogBox_Enemy.tscn")
var textBox_Kraben = preload("res://Textboxes/TextBox_Objects/Level4/DialogBox_Krabe.tscn")
var textBox_Stacheln = preload("res://Textboxes/TextBox_Objects/Level5/DialogBox_Stacheln.tscn")
var textBox_Kisten = preload("res://Textboxes/TextBox_Objects/Level10/DialogBox_Kisten.tscn")
var textBox_Ende = preload("res://Textboxes/TextBox_Objects/Level11/DialogBox_Ende.tscn")

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


func _on_Door_Enemy_triggerPoint():
	TextBox = textBox_Enemy.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_Kraben_triggerPoint():
	TextBox = textBox_Kraben.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_Stacheln_triggerPoint():
	TextBox = textBox_Stacheln.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_Ende_triggerPoint():
	TextBox = textBox_Ende.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)


func _on_Door_Kisten_triggerPoint():
	TextBox = textBox_Kisten.instance()
	level = get_tree().get_root()
	level.add_child(TextBox)
