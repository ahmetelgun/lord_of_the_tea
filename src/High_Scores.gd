extends Node

func _ready():
	yield(SilentWolf.Scores.get_high_scores(0), "sw_scores_received")
	for i in SilentWolf.Scores.scores:
		var new_score = get_node("ScrollContainer/ScoreContainer/1").duplicate()
		new_score.text = "{name} - {score}".format({"name": i.player_name, "score": str(int(i.score))})
		new_score.visible = true
		get_node("ScrollContainer/ScoreContainer").add_child(new_score)


func _on_Button_pressed():
	get_tree().change_scene("res://src/Main_Menu.tscn")
