extends Node2D

@onready var serve_button = $Control/NextButton
@onready var cont = $CONTINUE;
@onready var win = $Win
@onready var lose = $Lose
@onready var ret = $RETURN;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	serve_button.visible = true
	cont.visible = false
	win.visible = false
	ret.visible = false
	lose.visible = false
	cont.pressed.connect(_win_progress)
	serve_button.pressed.connect(_select_serve)
	ret.pressed.connect(_on_return_pressed)
	
	 # Replace with function body.

func _win_progress():
	var val = Global.current_level + 1;
	Global.start_level(val)
	print("Loading Level: ", val)
	get_tree().change_scene_to_file("res://GameScenes/MainGame/main_game.tscn")

func _on_return_pressed():
	Global.start_level(Global.current_level)
	
	print("Retrying Level: ", Global.current_level)
	get_tree().change_scene_to_file("res://GameScenes/MainGame/main_game.tscn")
func _select_serve():
	serve_button.visible = false
	if Global.check_win():
		$Win.visible = true
		cont.visible = true;
		
	else:
		$Lose.visible = true;
		$RETURN.visible = true;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_next_button_pressed() -> void:
	print("next")

#after the next button is pressed the toppings_button will hide and the flavor buttons will apear
