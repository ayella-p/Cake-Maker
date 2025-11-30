extends Node

const BABY_GORILLAS = preload("uid://sn36bvwxxfi8")

func playMusic():
	$Bgm.stream = BABY_GORILLAS
	$Bgm.play()
