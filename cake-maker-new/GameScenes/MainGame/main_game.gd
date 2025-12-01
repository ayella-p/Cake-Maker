extends Node2D

@onready var circle_btn = $CircleButton
@onready var square_btn = $SquareButton
@onready var heart_btn = $HeartButton
@onready var next_btn = $'Display/NextButton'
@onready var table_cake = $TableCake #tablecake

#loading image
var circle_texture = preload("res://Assets/Sprites/Icon/circle_cake.png")
var square_texture = preload("res://Assets/Sprites/Icon/square_cake.png")
var heart_texture = preload("res://Assets/Sprites/Icon/heart_cake.png")

func _ready():
	next_btn.visible = false
	circle_btn.pressed.connect(_on_circle_clicked)
	square_btn.pressed.connect(_on_square_clicked)
	heart_btn.pressed.connect(_on_heart_clicked)


func _on_circle_clicked():
	Global.cake_stack.push_back("circle_base")
	table_cake.texture = circle_texture
	next_btn.visible = true
	print("Stack:", Global.cake_stack)
	

func _on_square_clicked():
	Global.cake_stack.push_back("square_base")
	table_cake.texture = square_texture
	next_btn.visible = true
	print("Stack:", Global.cake_stack)

func _on_heart_clicked(): 
	Global.cake_stack.push_back("heart_base")
	table_cake.texture = heart_texture
	next_btn.visible = true
	print("Added Heart. Stack:", Global.cake_stack)

func _on_next_pressed():
	print("It is clicked")
	get_tree().change_scene_to_file("res://GameScenes/DecoratingScene.tscn")
