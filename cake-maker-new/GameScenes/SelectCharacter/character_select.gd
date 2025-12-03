extends Control

var selected = ""

@onready var confirm_btn = $ConfirmButton
@onready var female_button: TextureButton = $FemaleButton
@onready var male_button: TextureButton = $Male_Button

func _ready():
	confirm_btn.visible = false
	$Male_Button.pressed.connect(_select_male)
	$FemaleButton.pressed.connect(_select_female)
	$ConfirmButton.pressed.connect(_confirm)
	#$BackButton.pressed.connect(_back)
	
	$FadeTransition/AnimationPlayer.play("FadeOut")

func _select_male():
	selected = "male"
	confirm_btn.visible = true
	female_button.button_pressed = false
	SFX.Press()

func _select_female():
	selected = "female"
	confirm_btn.visible = true
	male_button.button_pressed = false
	
	SFX.Press()

func _confirm():
	print("Selected:", selected)
	get_tree().change_scene_to_file("res://GameScenes/MainGame/main_game.tscn")



func _on_back_button_pressed() -> void:
	print("Back button works!")
	get_tree().change_scene_to_file("res://GameScenes/MainMenu/Main_Menu.tscn")
	SFX.Press()
	 # Replace with function body.
