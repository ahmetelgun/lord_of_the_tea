extends KinematicBody2D

var bus
var speed
onready var animated_sprite = $AnimatedSprite
func _physics_process(delta: float) -> void:
	look_at(bus.position)
	var velocity = Vector2(speed, 0).rotated(rotation)
	var info = move_and_collide(velocity*delta)
	if info and info.collider.get_name() == "Bus":
		get_tree().change_scene("res://src/Fail.tscn")
