extends Node2D

const sticker_smiley : Texture = preload("res://Assets/smiley.png")
const sticker_star : Texture = preload("res://Assets/star.png")
const sticker_heart : Texture = preload("res://Assets/heart.png")
const sticker_tear : Texture = preload("res://Assets/tear.png")
const sticker_bmoji : Texture = preload("res://Assets/bmoji.png")

@onready var root : Node2D = $"../.."
var is_pressed : bool = false

enum STICKER {
	SMILEY,
	STAR,
	HEART,
	TEAR,
	BMOJI,
}
var sticker : STICKER = STICKER.SMILEY

func ChangeSticker(new : STICKER) -> void:
	match new:
		STICKER.SMILEY:
			sticker = STICKER.SMILEY
			Input.set_custom_mouse_cursor(load("res://Assets/smiley_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))
		STICKER.STAR:
			sticker = STICKER.STAR
			Input.set_custom_mouse_cursor(load("res://Assets/star_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))
		STICKER.HEART:
			sticker = STICKER.HEART
			Input.set_custom_mouse_cursor(load("res://Assets/heart_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))
		STICKER.TEAR:
			sticker = STICKER.TEAR
			Input.set_custom_mouse_cursor(load("res://Assets/tear_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))
		STICKER.BMOJI:
			sticker = STICKER.BMOJI
			Input.set_custom_mouse_cursor(load("res://Assets/bmoji_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))
		_:
			sticker = STICKER.SMILEY
			Input.set_custom_mouse_cursor(load("res://Assets/smiley_cursor.png"), Input.CURSOR_ARROW, Vector2(24,24))

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and root.mouse_mode == root.ToolType.STICKER:
		if event.button_index == MOUSE_BUTTON_LEFT:
			is_pressed = event.pressed
			
			if event.pressed:
				var sprite2d = Sprite2D.new()
				
				match sticker:
					STICKER.SMILEY:
						sprite2d.texture = sticker_smiley
					STICKER.STAR:
						sprite2d.texture = sticker_star
					STICKER.HEART:
						sprite2d.texture = sticker_heart
					STICKER.TEAR:
						sprite2d.texture = sticker_tear
					STICKER.BMOJI:
						sprite2d.texture = sticker_bmoji
				
				sprite2d.position = get_local_mouse_position()
				$".".add_child(sprite2d)
