extends Node2D

@onready var back_menu = $MenuButton
@onready var retry = $RetryButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_menu.pressed.connect(func(): _back_menu())
	retry.pressed.connect(func(): _return(Global.current_level))
	pass # Replace with function body.

func _back_menu():
	get_tree().change_scene_to_file("res://GameScenes/MainMenu/Main_Menu.tscn")

func _return(level):
	Global.start_level(level)
	get_tree().change_scene_to_file("res://GameScenes/MainGame/main_game.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
