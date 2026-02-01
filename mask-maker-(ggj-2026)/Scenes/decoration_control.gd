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
	STICKER,
	ERASER,
}
@export var mouse_mode : ToolType = ToolType.SELECT


func ToggleDrawTool() -> void:
	if mouse_mode == ToolType.DRAW:
				mouse_mode = ToolType.SELECT
				Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(0,0))
	elif mouse_mode != ToolType.DRAW:
		mouse_mode = ToolType.DRAW
		Input.set_custom_mouse_cursor(cursor_draw, Input.CURSOR_ARROW, Vector2(10,30))

func ToggleGlitterTool() -> void:
	if mouse_mode == ToolType.GLITTER:
				mouse_mode = ToolType.SELECT
				Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(0,0))
	elif mouse_mode != ToolType.GLITTER:
		mouse_mode = ToolType.GLITTER
		Input.set_custom_mouse_cursor(cursor_glitter, Input.CURSOR_ARROW, Vector2(10,30))

func ToggleStickerTool() -> void:
	if mouse_mode == ToolType.STICKER:
		mouse_mode = ToolType.SELECT
		Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(0,0))
	elif mouse_mode != ToolType.STICKER:
		mouse_mode = ToolType.STICKER
		$TempMask/StickerTool.ChangeSticker($TempMask/StickerTool.sticker)

func ToggleEraserTool() -> void:
	if mouse_mode == ToolType.ERASER:
				mouse_mode = ToolType.SELECT
				Input.set_custom_mouse_cursor(cursor_select, Input.CURSOR_ARROW, Vector2(0,0))
	elif mouse_mode != ToolType.ERASER:
		mouse_mode = ToolType.ERASER
		Input.set_custom_mouse_cursor(cursor_rubber, Input.CURSOR_ARROW, Vector2(10,30))

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
		
