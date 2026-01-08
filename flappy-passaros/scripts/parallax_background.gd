extends ParallaxBackground

@export var layer_speed : float

func _process(delta: float) -> void:
	scroll_offset.x -= layer_speed * delta
