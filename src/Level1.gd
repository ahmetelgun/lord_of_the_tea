extends Node2D

export var zombie_speed = 200
export var spawn_frequent = 1.0
var next_zombie_time = 1.0
var rng = RandomNumberGenerator.new()
var zombie = preload("res://src/Zombie1.tscn")
var score = Globals.score

func _ready():
	update_score()

func _physics_process(delta: float) -> void:
	if next_zombie_time <= 0:
		spawn_zombie()
		spawn_zombie()
		spawn_frequent -= 0.01
		zombie_speed += 5
		next_zombie_time = spawn_frequent
	else:
		next_zombie_time -= delta

func spawn_zombie():
	var screen_width = get_viewport().get_visible_rect().size.x
	var zombie_instance = zombie.instance()
	rng.randomize()
	var zombie_x = rand_range(0, screen_width)
	zombie_instance.position = Vector2(zombie_x, 0)
	zombie_instance.bus = get_node("Bus")
	zombie_instance.speed = zombie_speed
	add_child(zombie_instance)

func update_score():
	score -= 1
	if score == 0:
		get_tree().change_scene("res://src/Win.tscn")
	get_node("Label").text = "Kalan: %d" % score
