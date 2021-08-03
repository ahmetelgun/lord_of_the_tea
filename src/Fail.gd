extends Control

func _ready():
	if Globals.is_infinity:
		get_node("Label2").text = "Score: %d" % Globals.score
		get_node("Player_name").visible = true
	else:
		get_node("Player_name").visible = false
	
	yield(SilentWolf.Scores.get_high_scores(200), "sw_scores_received")
	print("Scores: " + str(SilentWolf.Scores.scores))

func _on_Button_pressed():
	get_tree().change_scene("res://src/Main_Menu.tscn")


func _on_send_score_pressed():
	var player_name = get_node("Player_name").text
	var i = SilentWolf.Scores.persist_score(player_name, Globals.score)
	if i:
		get_node("Player_name/send_score").disabled = true
		get_node("Player_name").editable = false

func _on_Player_name_text_changed(new_text):
	if new_text.length() > 0:
		get_node("Player_name/send_score").disabled = false
	else:
		get_node("Player_name/send_score").disabled = true
	
