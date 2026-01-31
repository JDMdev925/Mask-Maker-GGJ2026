extends Node2D

@onready var lines_set : Node2D = $Line2D
@onready var root : Node2D = $"../.."
@onready var texture = load("res://Assets/glitter_shine.png")

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
				current_line.add_point(get_local_mouse_position())
				
				
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.GLITTER:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if is_pressed:
				current_line = Line2D.new()
				current_line.texture = texture
				current_line.texture_mode = Line2D.LINE_TEXTURE_TILE
				current_line.modulate = Color(0.643, 0.148, 0.846, 1.0)
				current_line.width = 20
				lines_set.add_child(current_line)
				current_line.add_point(get_local_mouse_position())
				
				
	elif event is InputEventMouseMotion and is_pressed:
		current_line.add_point(get_local_mouse_position())

func UpdateLineWidth(width : float) -> void:
	current_line.width = width

func UpdateLineColor(color : Color) -> void:
	current_line.default_color = color
