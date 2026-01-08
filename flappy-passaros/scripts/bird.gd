extends CharacterBody2D

signal hit

@export var gravity : float = 500
@export var flap_speed : float = -200

var can_control : bool = true

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("flap") and can_control:
		velocity.y = flap_speed
	
	move_and_slide()

func game_over():
	can_control = false
	$RestartTimer.start()
	emit_signal("hit")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("trees"):
		game_over()

func _on_restart_timer_timeout() -> void:
	get_tree().call_deferred("reload_current_scene")
