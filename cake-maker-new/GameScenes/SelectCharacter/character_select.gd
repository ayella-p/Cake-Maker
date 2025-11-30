extends Control

var selected = ""

@onready var confirm_btn = $ConfirmButton

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

func _select_female():
	selected = "female"
	confirm_btn.visible = true

func _confirm():
	print("Selected:", selected)



func _on_back_button_pressed() -> void:
	print("Back button works!")
	get_tree().change_scene_to_file("res://src/Main_menu.tscn")
	 # Replace with function body.
