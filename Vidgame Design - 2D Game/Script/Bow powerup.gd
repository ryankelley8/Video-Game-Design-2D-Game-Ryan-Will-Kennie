extends Node2D

const projectile = preload("res://Tiny Swords (Update 010)/Effects/Fire/Fire.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	attack()


func _on_area_2d_body_entered(body):
	print(body)
	reparent(body)
func attack():
	if Input.is_action_just_pressed("Attack"):
		projectile.instantiate()
		projectile.position = $Area2D/Marker2D.position
		add_child(new_arrow)
