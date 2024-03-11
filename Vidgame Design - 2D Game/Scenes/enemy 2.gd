extends Node2D
var player_position = Vector2()
var speed = 100
var player_scene = load("res://Player(Will).tscn")
var player_instance = player_scene.instance()
var main_character_node = player_instance.get_node("Main_Character")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_child(player_instance)
	main_character_node.global_position
	var direction = (player_position - global_position).normalized()
	global_position += direction * speed * delta
