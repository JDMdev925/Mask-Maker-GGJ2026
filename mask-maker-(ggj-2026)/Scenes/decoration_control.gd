extends Node2D

@onready var mask_hapi : Texture = load("res://Assets/mask_hapi.png")
@onready var mask_sad : Texture = load("res://Assets/mask_sad.png")
@onready var mask_angry : Texture = load("res://Assets/mask_angy.png")
@onready var mask_wah : Texture = load("res://Assets/mask_wah.png")

@onready var cursor_select : Texture = load("res://Assets/mouse.png")
@onready var cursor_draw : Texture = load("res://Assets/pencil.png")
@onready var cursor_glitter : Texture = load("res://Assets/glitters.png")
@onready var cursor_rubber : Texture = load("res://Assets/rubber.png")


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
				Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(10,10))
			elif mouse_mode != ToolType.DRAW:
				mouse_mode = ToolType.DRAW
				Input.set_custom_mouse_cursor(cursor_draw, Input.CURSOR_ARROW, Vector2(10,30))
		elif event.is_pressed() and event.keycode == KEY_G:
			if mouse_mode == ToolType.GLITTER:
				mouse_mode = ToolType.SELECT
				Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(10,10))
			elif mouse_mode != ToolType.GLITTER:
				mouse_mode = ToolType.GLITTER
				Input.set_custom_mouse_cursor(cursor_glitter, Input.CURSOR_ARROW, Vector2(10,30))

func ChangeMask(face_value : int) -> void:
	match face_value:
		1:
			$TempMask.texture = mask_hapi
		2:
			$TempMask.texture = mask_sad
		3:
			$TempMask.texture = mask_angry
		4:
			$TempMask.texture = mask_wah
		_:
			$TempMask.texture = mask_hapi
		
