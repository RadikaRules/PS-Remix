# language: gdscript
extends Control

@export_node_path NodePath var scroll_path: NodePath = NodePath("Scroll")
@export_node_path NodePath var hbox_path: NodePath = NodePath("Scroll/HBox")
@export var scroll_speed := 200.0  # pixels per second when arrow pressed

onready var scroll : ScrollContainer = get_node(scroll_path)
onready var hbox : HBoxContainer = get_node(hbox_path)
onready var buttons := $Buttons.get_children()

func _ready():
	# connect hover signals for buttons
	for i in buttons.size():
		var btn = buttons[i]
		if btn is Button:
			btn.connect("mouse_entered", Callable(self, "_on_button_hover").bind(i))
			btn.connect("mouse_exited", Callable(self, "_on_button_exit").bind(i))

func _process(delta):
	# optional: keyboard arrows to pan horizontally
	if Input.is_action_pressed("ui_right"):
		scroll.scroll_horizontal = clamp(scroll.scroll_horizontal + scroll_speed * delta, 0, scroll.get_h_scrollbar().max_value)
	elif Input.is_action_pressed("ui_left"):
		scroll.scroll_horizontal = clamp(scroll.scroll_horizontal - scroll_speed * delta, 0, scroll.get_h_scrollbar().max_value)

func _on_button_hover(index:int) -> void:
	# change visible text for corresponding label(s)
	# assume same index mapping: Btn1 -> Item1, etc.
	if index < hbox.get_child_count():
		var lbl:Label = hbox.get_child(index) as Label
		lbl.text = "Hovered: %s" % $Buttons.get_child(index).text
		# optionally ensure the hovered label is visible by scrolling to it
		_scroll_to_control(lbl)

func _on_button_exit(index:int) -> void:
	if index < hbox.get_child_count():
		var lbl:Label = hbox.get_child(index) as Label
		# restore default text (you could store originals; here we use button text)
		lbl.text = $Buttons.get_child(index).text

func _scroll_to_control(target:Control) -> void:
	# center target in ScrollContainer horizontally
	var target_global = target.get_global_position()
	var scroll_global = scroll.get_global_position()
	var rel_x = target_global.x - scroll_global.x
	var target_center = rel_x + target.rect_size.x * 0.5
	var viewport_w = scroll.rect_size.x
	var new_scroll = target_center - viewport_w * 0.5
	new_scroll = clamp(new_scroll, 0, scroll.get_h_scrollbar().max_value)
	scroll.scroll_horizontal = new_scroll
