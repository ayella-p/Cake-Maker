extends Control

@onready var main_button: VBoxContainer = $MainButton
@onready var options: Panel = $Options
@onready var start_button = $MainButton/START

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(_on_start_pressed)
	main_button.visible = true
	options.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	#get_tree().change_scene_to_file("")


func _on_setting_2_pressed() -> void:
	print("Setting")
	main_button.visible = false
	options.visible = true


func _on_quit_3_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main_button.visible = true
	options.visible = false


func _on_start_pressed() -> void:
	print("Start")# Replace with function body.
	get_tree().change_scene_to_file("res://SelectCharacter/CharacterSelect.tscn")
