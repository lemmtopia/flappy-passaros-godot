extends ParallaxBackground

@export var layer_speed : float

func _ready() -> void:
	var bird : CharacterBody2D = get_parent().get_node("Bird")
	bird.connect("hit", stop_scroll)

func _process(delta: float) -> void:
	scroll_offset.x -= layer_speed * delta

func stop_scroll():
	layer_speed = 0
