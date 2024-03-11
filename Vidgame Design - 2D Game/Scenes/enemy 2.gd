extends Node2D
var player_position = Vector2()
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_position = $"Main Character".global_position
	var direction = (player_position - global_position).normalized()
	global_position += direction * speed * delta
