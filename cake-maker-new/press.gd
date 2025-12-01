extends Node

var press_sfx: AudioStream = preload("res://Assets/Music/SoundEffects/Button/button_fx_low_003_cc0_avr.wav")
var player := AudioStreamPlayer2D.new()

func _enter_tree():
	add_child(player)

func Press():
	player.stream = press_sfx
	player.play()
