extends CharacterBody2D

@export var gravity : float = 500
@export var flap_speed : float = -200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = flap_speed
	
	move_and_slide()
