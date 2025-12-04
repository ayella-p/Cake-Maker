extends Node2D

@onready var next_level = $HeartButton
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_level += 1
	next_level.pressed.connect(func(): _on_next_level(Global.current_level))
	pass # Replace with function body.


func _on_next_level(level):
	print("Level ", level)
	Global.start_level(level)
	if(level < 4):
		get_tree().change_scene_to_file("res://GameScenes/MainGame/main_game.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
