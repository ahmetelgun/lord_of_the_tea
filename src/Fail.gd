extends Control

func _ready():
	get_node("Label2").text = "Score: %d" % Globals.score

func _on_Button_pressed():
	get_tree().change_scene("res://src/Main_Menu.tscn")


