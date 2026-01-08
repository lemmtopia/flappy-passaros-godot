extends CharacterBody2D

@export var gravity : float = 500
@export var flap_speed : float = -200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = flap_speed
	
	move_and_slide()

func game_over():
	get_tree().call_deferred("reload_current_scene")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("trees"):
		game_over()
