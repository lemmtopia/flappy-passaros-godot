extends Node2D

@export var speed : float = 270

var bird : CharacterBody2D

func _ready() -> void:
	bird = get_parent().get_node("Bird")
	bird.connect("hit", stop_moving)

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -70:
		queue_free()

func stop_moving():
	speed = 0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.game_over()
