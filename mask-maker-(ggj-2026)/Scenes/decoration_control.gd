extends Node2D

enum ToolType {
	SELECT,
	DRAW,
	GLITTER,
}
@export var mouse_mode : ToolType = ToolType.SELECT

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_F:
			if mouse_mode == ToolType.DRAW:
				mouse_mode = ToolType.SELECT
			elif mouse_mode != ToolType.DRAW:
				mouse_mode = ToolType.DRAW
		elif event.is_pressed() and event.keycode == KEY_G:
			if mouse_mode == ToolType.GLITTER:
				mouse_mode = ToolType.SELECT
			elif mouse_mode != ToolType.GLITTER:
				mouse_mode = ToolType.GLITTER
