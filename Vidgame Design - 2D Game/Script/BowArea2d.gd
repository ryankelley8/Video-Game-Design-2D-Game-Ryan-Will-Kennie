extends Area2D

var projectile = preload("res://Scenes/fire_projectile.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	attack()
func attack():
	if Input.is_action_just_pressed("Attack"):
		projectile.instantiate()
		projectile.position = $Area2D/Marker2D.position
		add_child(projectile)
