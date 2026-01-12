extends CanvasLayer

signal start_game

@onready var start_button: Button = $StartButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_start_button_pressed() -> void:
	start_button.disabled = true
	visible = false
	animation_player.stop()
	start_game.emit()
