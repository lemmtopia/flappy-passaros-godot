extends Node2D

@export var tree_scene : PackedScene
@export var enemy_scene : PackedScene

@onready var tree_timer : Timer = $TreeTimer
@onready var enemy_timer : Timer = $EnemyTimer
@onready var bird : CharacterBody2D = $Bird
@onready var score_label : Label = $ScoreLabel

var score : int = 0

func _ready():
	tree_timer.start()
	enemy_timer.start()
	bird.connect("hit", stop_level_timers)

func _on_tree_timer_timeout() -> void:
	var tree = tree_scene.instantiate()
	tree.position = Vector2(700, randf_range(150, 180))
	tree.connect("bird_detected", _on_tree_bird_detected)
	add_child(tree)

func stop_level_timers():
	tree_timer.stop()
	enemy_timer.stop()

func _on_tree_bird_detected():
	score += 1
	score_label.text = str(score)

func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position.x = 710
	enemy.position.y = randf_range(50, 120)
	add_child(enemy)
