extends Node2D

@onready var lines_set : Node2D = $Line2D
@onready var root : Node2D = $"../.."
@onready var texture = load("res://Assets/glitter_shine.png")

var is_pressed : bool = false
var current_line : Line2D = null


var pencil_color : Color = Color.BLACK
var glitter_colour : Color = Color.BLACK
var pencil_width : float = 5
var eraser_width : float = 5

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.DRAW:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if is_pressed:
				current_line = Line2D.new()
				current_line.default_color = pencil_color
				current_line.width = pencil_width
				lines_set.add_child(current_line)
				current_line.add_point(get_local_mouse_position())
	
	
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.GLITTER:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if is_pressed:
				current_line = Line2D.new()
				current_line.texture = texture
				current_line.texture_mode = Line2D.LINE_TEXTURE_TILE
				current_line.modulate = glitter_colour
				current_line.width = 20
				lines_set.add_child(current_line)
				current_line.add_point(get_local_mouse_position())
	
	
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.ERASER:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if is_pressed:
				current_line = Line2D.new()
				current_line.default_color = Color.WHITE
				current_line.width = eraser_width
				lines_set.add_child(current_line)
				current_line.add_point(get_local_mouse_position())
	
	elif event is InputEventMouseMotion and is_pressed:
		current_line.add_point(get_local_mouse_position())

func UpdateLineWidth(tool : int, width : float) -> void:
	if tool == 1:
		pencil_width = width
	elif tool == 4:
		eraser_width = width
		print(tool)
	else: 
		pass

func UpdateLineColor(tool : int, color : Color) -> void:
	if tool == 1:
		pencil_color = color
	else:
		glitter_colour = color
