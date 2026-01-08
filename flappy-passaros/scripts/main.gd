extends Node2D

@export var tree_scene : PackedScene

var score : int = 0

func _ready():
	$TreeTimer.start()

func _on_tree_timer_timeout() -> void:
	var tree = tree_scene.instantiate()
	tree.position = Vector2(700, randf_range(150, 180))
	tree.connect("bird_detected", _on_tree_bird_detected)
	add_child(tree)

func _on_tree_bird_detected():
	score += 1
	$ScoreLabel.text = str(score)
