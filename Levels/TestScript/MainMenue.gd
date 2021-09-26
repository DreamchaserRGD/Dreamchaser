extends Node


func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene_to(load('res://Levels/Scene/Tutorial/Tutorial_Real_1.tscn'))

#func _on_OptionButton_pressed():
	#Options Menu einfuegen

func _on_QuitButton_pressed():
	get_tree().quit()
