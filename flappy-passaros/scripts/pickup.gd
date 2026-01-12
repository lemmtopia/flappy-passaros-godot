extends Area2D

signal collect

@export var speed : float = 300

func _ready() -> void:
	var bird : CharacterBody2D = get_parent().get_node("Bird")
	bird.connect("hit", _on_bird_hit)

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < -40:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		emit_signal("collect")
		queue_free()

func _on_bird_hit():
	speed = 0
