extends CanvasLayer

signal start_game

@onready var start_button: Button = $StartButton

func _on_start_button_pressed() -> void:
	start_button.disabled = true
	visible = false
	start_game.emit()
