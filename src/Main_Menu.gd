extends Control

func _ready():
	pass # Replace with function body.

func _on_Easy_Button_pressed():
	Globals.score = 11
	get_tree().change_scene("res://src/Level1.tscn")

func _on_Medium_Button_pressed():
	Globals.score = 21
	get_tree().change_scene("res://src/Level1.tscn")

func _on_Hard_Button_pressed():
	Globals.score = 31
	get_tree().change_scene("res://src/Level1.tscn")

func _on_Infinity_pressed():
	Globals.score = -1
	Globals.is_infinity = true
	get_tree().change_scene("res://src/Level1.tscn")


func _on_CheckBox_toggled(button_pressed):
	if button_pressed:
		Globals.is_kacak = true
	else:
		Globals.is_kacak = false
