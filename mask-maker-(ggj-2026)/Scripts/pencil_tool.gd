extends Node2D

@onready var lines_set : Node2D = $Line2D
@onready var root : Node2D = $"../.."

var is_pressed : bool = false
var current_line : Line2D = null

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.DRAW:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if is_pressed:
				current_line = Line2D.new()
				current_line.default_color = Color.BLACK
				current_line.width = 5
				lines_set.add_child(current_line)
				current_line.add_point(event.position)
	elif event is InputEventMouseMotion and is_pressed:
		current_line.add_point(event.position)
