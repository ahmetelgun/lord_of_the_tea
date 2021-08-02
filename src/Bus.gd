extends KinematicBody2D

export var delay = .4
var current_delay = 0.0
func _physics_process(delta: float) -> void:
	if current_delay > 0:
		current_delay -= delta

	if Input.is_action_just_pressed("new"):
		fire()
func fire():
	if current_delay <= 0:
		var tea = preload("res://src/Tea.tscn")
		var tea_instance = tea.instance()
		tea_instance.position = position - Vector2(0, 100)
		tea_instance.look_at(get_global_mouse_position())
		tea_instance.velocity = Vector2(200, 0).rotated(tea_instance.rotation)
		get_parent().add_child(tea_instance)
		current_delay = delay

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			fire()
