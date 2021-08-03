extends KinematicBody2D


var velocity
var mouse_position
var explosion = preload("res://src/Explosion.tscn")

func _ready():
	if Globals.is_kacak:
		get_node("tea").visible = false
		get_node("mahmood").visible = true
	else:
		get_node("tea").visible = true
		get_node("mahmood").visible = false

func _physics_process(delta: float) -> void:
	rotation += 10*delta
	var info = move_and_collide(velocity*delta)
	if info:
		var explosion_instance = explosion.instance()
		explosion_instance.position = position
		get_parent().add_child(explosion_instance)
		get_parent().update_score()
		info.collider.queue_free()
		queue_free()
	
