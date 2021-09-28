extends Node


func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene_to(load('res://Scenes/levels/Game.tscn'))

#func _on_OptionButton_pressed():
	#Options Menu einfuegen

func _on_QuitButton_pressed():
	get_tree().quit()
