extends Control

@onready var description_label: Label = $Label

var descriptions := {
	"Button1": "This is the first description.",
	"Button2": "Details about the second button here.",
	"Button3": "Here’s some info about the third button."
}

func _ready() -> void:
	$Button1.connect("pressed", Callable(self, "_on_Button_pressed"), ["Button1"])
	$Button2.connect("pressed", Callable(self, "_on_Button_pressed"), ["Button2"])
	$Button3.connect("pressed", Callable(self, "_on_Button_pressed"), ["Button3"])
	_update_description("Button1")

func _on_Button_pressed(button_name: String) -> void:
	_update_description(button_name)

func _update_description(button_name: String) -> void:
	if descriptions.has(button_name):
		description_label.text = descriptions[button_name]
		_start_text_animation()

func _start_text_animation() -> void:
	# start centered
	var center := rect_size * 0.5
	description_label.rect_position = center - description_label.rect_size * 0.5

	# remove any existing Tween children
	for child in get_children():
		if child is Tween:
			child.queue_free()

	var tween := Tween.new()
	add_child(tween)
	# animate the label 300 px to the right over 2s
	var from := description_label.rect_position
	var to := from + Vector2(300, 0)
	tween.tween_property(description_label, "rect_position", to, 2.0).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.play()
