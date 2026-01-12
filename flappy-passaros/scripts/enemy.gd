extends Node2D

@export var speed : float = 270

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -70:
		queue_free()
