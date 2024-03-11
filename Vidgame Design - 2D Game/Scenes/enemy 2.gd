extends Node2D
var player_position = Vector2()
var speed = 100
var player_scene = load("res://Player(Will).tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (player_position - global_position).normalized()
	global_position += direction * speed * delta
