extends Node2D



@onready var oven_buttons = $OvenButtons 
@onready var flavor_buttons = $FlavorButtons

@onready var circle_button: TextureButton = $OvenButtons/CircleButton
@onready var square_button: TextureButton = $OvenButtons/SquareButton
@onready var heart_button: TextureButton = $OvenButtons/HeartButton

@onready var chocolate_flavor: TextureButton = $FlavorButtons/ChocolateFlavor
@onready var vanilla_flavor: TextureButton = $FlavorButtons/VanillaFlavor
@onready var strawberry_flavor: TextureButton = $FlavorButtons/StrawberryFlavor


@onready var next_btn = $Display/NextButton 
@onready var table_cake = $TableCake 




var phase = 0

var color_vanilla = Color(1, 1, 1)        # White
var color_choco = Color(0.5, 0.3, 0.1)# Brown
var color_berry = Color(1, 0.71, 0.75)    # Pink


var circle_texture = preload("res://Assets/Sprites/Icon/circle_cake.png")
var square_texture = preload("res://Assets/Sprites/Icon/square.png")
var heart_texture = preload("res://Assets/Sprites/Icon/heart_cake.png")

func _ready():
	phase = 0
	
	oven_buttons.visible = true  
	flavor_buttons.visible = false 
	next_btn.visible = false
	
	circle_button.pressed.connect(_on_circle_clicked)
	square_button.pressed.connect(_on_square_clicked)
	heart_button.pressed.connect(_on_heart_clicked)
	
	vanilla_flavor.pressed.connect(_on_vanilla_clicked)
	chocolate_flavor.pressed.connect(_on_choco_clicked)
	strawberry_flavor.pressed.connect(_on_berry_clicked)
	
	#connect button
	next_btn.pressed.connect(_on_next_pressed)



func _on_circle_clicked():
	if not Global.cake_stack.is_empty():
		Global.pop()
		
	Global.push("circle_base")
	table_cake.texture = circle_texture
	next_btn.visible = true

func _on_square_clicked():
	if not Global.cake_stack.is_empty():
		Global.pop()
		
	Global.push("square_base")
	table_cake.texture = square_texture
	next_btn.visible = true

func _on_heart_clicked(): 
	if not Global.cake_stack.is_empty():
		Global.pop()
		
	Global.push("heart_base")
	table_cake.texture = heart_texture
	next_btn.visible = true


func _on_vanilla_clicked():
	_select_flavor("vanilla", color_vanilla)

func _on_choco_clicked():
	print("Clicked ang choco")
	_select_flavor("chocolate", color_choco)

func _on_berry_clicked():
	_select_flavor("strawberry", color_berry)

func _select_flavor(flavor_name, color):
	# if already have a flavor, pop
	if Global.cake_stack.size() > 1:
		Global.pop()
		
	Global.push(flavor_name)
	
	#color cake
	table_cake.modulate = color
	next_btn.visible = true

func _on_next_pressed():
	if phase == 0:
		print("Phase 1 Complete. Moving to Flavors.")
		
		oven_buttons.visible = false
		flavor_buttons.visible = true
		
		next_btn.visible = false
		
		phase = 1
		
	elif phase == 1:
		print("Current Stack: ", Global.cake_stack)
		get_tree().change_scene_to_file("res://GameScenes/Filling_PipingScene/FillingPipingScene.tscn")
