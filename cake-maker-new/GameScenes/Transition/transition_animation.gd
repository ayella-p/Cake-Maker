extends CanvasLayer

@onready var animation_transition: AnimationPlayer = $AnimationTransition

func _ready() -> void:
	pass
	
func fadeOut() -> void:
	animation_transition.play("FadeOut")
	
	
func fadeIn(scene : String) -> void:
	animation_transition.play("FadeIn")
	await animation_transition.animation_finished
	get_tree().change_scene_to_file(scene)
