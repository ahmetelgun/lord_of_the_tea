extends AnimatedSprite
var is_sound_played = false
func _physics_process(delta):
	if is_sound_played == false:
		get_node("Sound").play()
		is_sound_played = true
	if frame == 11:
		queue_free()
