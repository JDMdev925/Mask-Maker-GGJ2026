extends Control

enum PANEL {
	NONE = 0,
	DRAW = 1,
	GLITTER = 2,
	STICKER = 3,
	ERASER = 4
}
var panel : PANEL = PANEL.NONE



func _on_hapi_mask_pressed() -> void:
	$"..".ChangeMask(1)

func _on_sad_mask_pressed() -> void:
	$"..".ChangeMask(2)

func _on_angy_mask_pressed() -> void:
	$"..".ChangeMask(3)

func _on_wah_mask_pressed() -> void:
	$"..".ChangeMask(4)

func _on_btn_draw_pressed() -> void:
	$"..".ToggleDrawTool()
	ToggleDrawPanel()

func _on_btn_glitter_pressed() -> void:
	$"..".ToggleGlitterTool()
	ToggleGlitterPanel()

func _on_btn_sticker_pressed() -> void:
	$"..".ToggleStickerTool()
	ToggleStickerPanel()


func _on_btn_eraser_pressed() -> void:
	$"..".ToggleEraserTool()
	ToggleEraserPanel()

func ClosePanels() -> void:
	match panel:
		PANEL.DRAW:
			ToggleDrawPanel()
		PANEL.GLITTER:
			ToggleGlitterPanel()
		PANEL.STICKER:
			ToggleStickerPanel()
		PANEL.ERASER:
			ToggleEraserPanel()
	panel = PANEL.NONE

func ToggleDrawPanel() -> void:
	if panel == PANEL.DRAW:
		$"Draw Panel".position = Vector2(1500, 73)
		panel = PANEL.NONE
	else:
		if panel != PANEL.NONE:
			ClosePanels()
		$"Draw Panel".position = Vector2(868, 73)
		panel = PANEL.DRAW
		$"../TempMask/DrawTool".UpdateLineWidth(panel, $"Draw Panel/VBoxContainer/HSlider".value)

func ToggleGlitterPanel() -> void:
	if panel == PANEL.GLITTER:
		$"Glitter Panel".position = Vector2(1500, 73)
		panel = PANEL.NONE
	else:
		if panel != PANEL.NONE:
			ClosePanels()
		$"Glitter Panel".position = Vector2(868, 73)
		panel = PANEL.GLITTER

func ToggleStickerPanel() -> void:
	if panel == PANEL.STICKER:
		$"Sticker Panel".position = Vector2(1500, 73)
		panel = PANEL.NONE
	else:
		if panel != PANEL.NONE:
			ClosePanels()
		$"Sticker Panel".position = Vector2(868, 73)
		panel = PANEL.STICKER

func ToggleEraserPanel() -> void:
	if panel == PANEL.ERASER:
		$"Eraser Panel".position = Vector2(1500, 73)
		panel = PANEL.NONE
	else:
		if panel != PANEL.NONE:
			ClosePanels()
		$"Eraser Panel".position = Vector2(868, 73)
		panel = PANEL.ERASER
		$"../TempMask/DrawTool".UpdateLineWidth(panel, $"Eraser Panel/VBoxContainer/ESlider".value)




func _on_c_1_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color.BLACK)

func _on_c_2_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("0038beff"))

func _on_c_3_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("00bf00ff"))

func _on_c_4_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("ff0000ff"))

func _on_c_5_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("e400beff"))

func _on_c_6_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("7400ffff"))

func _on_c_7_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("ff7c24ff"))

func _on_c_8_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("00a9d8ff"))

func _on_c_9_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("007f1dff"))

func _on_c_10_pressed() -> void:
	$"../TempMask/DrawTool".UpdateLineColor(panel, Color("e0be00ff"))

func _on_h_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		$"../TempMask/DrawTool".UpdateLineWidth(panel, $"Draw Panel/VBoxContainer/HSlider".value)

func _on_e_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		$"../TempMask/DrawTool".UpdateLineWidth(panel, $"Eraser Panel/VBoxContainer/ESlider".value)


func _on_s_1_pressed() -> void:
	$"../TempMask/StickerTool".ChangeSticker($"../TempMask/StickerTool".STICKER.SMILEY)


func _on_s_2_pressed() -> void:
	$"../TempMask/StickerTool".ChangeSticker($"../TempMask/StickerTool".STICKER.STAR)


func _on_s_3_pressed() -> void:
	$"../TempMask/StickerTool".ChangeSticker($"../TempMask/StickerTool".STICKER.HEART)


func _on_s_4_pressed() -> void:
	$"../TempMask/StickerTool".ChangeSticker($"../TempMask/StickerTool".STICKER.TEAR)


func _on_s_5_pressed() -> void:
	$"../TempMask/StickerTool".ChangeSticker($"../TempMask/StickerTool".STICKER.BMOJI)
