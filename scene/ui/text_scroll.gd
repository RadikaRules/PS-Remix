extends Control

@export var scroll_path := NodePath("ScrollContainer")
@export var label_path := NodePath("ScrollContainer/Label")

var scroll: ScrollContainer
var lbl: Label
var buttons := []

var original_text: String

func _ready() -> void:
	scroll = get_node(scroll_path) as ScrollContainer
	lbl = get_node(label_path) as Label
	buttons = $VBoxContainer.get_children()
	original_text = lbl.text
	scroll.h_scroll_enabled = true
	for i in buttons.size():
		var btn = buttons[i]
		if btn is Button:
			btn.mouse_entered.connect(Callable(self, "_on_button_hover").bind(i))
			btn.mouse_exited.connect(Callable(self, "_on_button_exit").bind(i))

func _on_button_hover(index: int) -> void:
	var btn = $VBoxContainer.get_child(index)
	if btn:
		lbl.text = btn.text
		_scroll_to_label_center()

func _on_button_exit(index: int) -> void:
	lbl.text = original_text

func _scroll_to_label_center() -> void:
	# center label horizontally in ScrollContainer
	var lbl_global = lbl.get_global_position()
	var scroll_global = scroll.get_global_position()
	var rel_x = lbl_global.x - scroll_global.x
	var target_center = rel_x + lbl.rect_size.x * 0.5
	var viewport_w = scroll.rect_size.x
	var new_scroll = target_center - viewport_w * 0.5
	new_scroll = clamp(new_scroll, 0.0, scroll.get_h_scrollbar().max_value)
	scroll.scroll_horizontal = new_scroll
