extends CharacterBody2D
class_name Player

signal hit

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var gravity : float = 500
@export var flap_speed : float = -200

var can_control : bool = true

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap") and can_control:
		velocity.y = flap_speed
	
	if position.y < -32 or position.y > 360 + 32:
		game_over()
	
	move_and_slide()

func game_over():
	can_control = false
	call_deferred("defeated_behaviour")
	emit_signal("hit")

func defeated_behaviour():
	collision_shape_2d.disabled = true
	animated_sprite_2d.stop()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("trees"):
		game_over()
