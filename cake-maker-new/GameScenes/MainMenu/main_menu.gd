extends Node2D

var Bgm_bus = AudioServer.get_bus_index("Bgm_bus")

var button_type = null

func _ready() -> void:
	MusicPlayer.playMusic()

func pressButton() -> void:
	SFX.Press()

func _on_start_pressed() -> void:
	button_type = "start"
	print("Start")
	$FadeTransition.show()
	$FadeTransition/FadeTimer.start()
	$FadeTransition/AnimationPlayer.play("FadeIn")
	SFX.Press()


func _on_quit_pressed() -> void:
	get_tree().quit()
	SFX.Press()


func _on_mute_bgm_pressed() -> void:
	AudioServer.set_bus_mute(Bgm_bus, not AudioServer.is_bus_mute(Bgm_bus))
	SFX.Press()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://GameScenes/SelectCharacter/CharacterSelect.tscn")
