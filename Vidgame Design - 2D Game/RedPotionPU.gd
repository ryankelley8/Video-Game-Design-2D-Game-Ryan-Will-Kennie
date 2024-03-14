extends Node2D
func _on_PowerUp_body_entered(body: Node) -> void:
	if body.name == "Main_Character":
		hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Area2D/AnimatedSprite2D.play('Idol')
