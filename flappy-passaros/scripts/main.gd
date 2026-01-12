extends Node2D

signal start_game

@export var tree_scene : PackedScene
@export var enemy_scene : PackedScene
@export var game_over_layer_scene : PackedScene

@onready var tree_timer : Timer = $TreeTimer
@onready var enemy_timer : Timer = $EnemyTimer
@onready var bird : CharacterBody2D = $Bird
@onready var score_label : Label = $ScoreLabel

var score : int = 0

var is_game_over : bool = false
var is_start_game : bool = false

func _ready():
	bird.connect("hit", game_over)

func _on_tree_timer_timeout() -> void:
	var tree = tree_scene.instantiate()
	tree.position = Vector2(700, randf_range(150, 180))
	tree.connect("bird_detected", _on_tree_bird_detected)
	add_child(tree)

func game_over():
	if is_game_over:
		return
	
	tree_timer.stop()
	enemy_timer.stop()
	
	var game_over_layer = game_over_layer_scene.instantiate()
	game_over_layer.connect("restart_game", _on_game_over_layer_restart_game)
	add_child(game_over_layer)
	
	is_game_over = true

func _on_tree_bird_detected():
	score += 1
	score_label.text = str(score)

func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.position.x = 710
	enemy.position.y = randf_range(50, 120)
	add_child(enemy)

func _on_game_over_layer_restart_game():
	get_tree().call_deferred("reload_current_scene")

func _on_start_game():
	tree_timer.start()
	enemy_timer.start()
	
	is_start_game = true

func _on_start_menu_layer_start_game() -> void:
	start_game.emit()
