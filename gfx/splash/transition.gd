extends CanvasLayer

# fade in/fade out
func fade(target: String) -> void:
	$AnimationPlayer.play('fade')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('fade')
# fade 
func fadeout(target: String) -> void:
	$AnimationPlayer.play('fade')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)

# Screenshot screen, slide up
func wipe_y(target: String) -> void:
	get_tree().change_scene_to_file(target)

# Screen transition (no load)

func noload(target: String) -> void:
	get_tree().change_scene_to_file(target)
