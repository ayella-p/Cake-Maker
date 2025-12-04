extends Node2D

@onready var oven_buttons = $OvenButtons
@onready var flavor_buttons = $FlavorButtons
@onready var piping_buttons = $PipingButtons
@onready var topping_buttons = $ToppingButtons
@onready var next_btn = $Display/NextButton 

@onready var visual_base = $CakeBase
@onready var visual_frosting = $CakeFrosting
@onready var visual_piping = $CakePiping
@onready var visual_topping = $CakeTopping

@onready var order_1: Sprite2D = $Orders/Order1
@onready var order_2: Sprite2D = $Orders/Order2
@onready var order_3: Sprite2D = $Orders/Order3

var phase = 0  #state
var selected_shape = ""    
var selected_flavor = ""   
var selected_piping = ""   
var selected_topping = ""  

func _ready():
	if Global.current_level == 1:
		Global.start_level(1)
	
	if Global.current_level == 1:
		order_1.visible = true
		
	elif Global.current_level == 2:
		order_2.visible = true
		
	elif Global.current_level == 3:
		order_3.visible = true;
		
	elif  Global.current_level == 4:
		get_tree().change_scene_to_file("res://GameScenes/MainMenu/Main_Menu.tscn")
		
	_reset_game()
	_connect_signals()

func _reset_game():
	phase = 0
	
	oven_buttons.visible = true
	flavor_buttons.visible = false
	piping_buttons.visible = false
	topping_buttons.visible = false
	next_btn.visible = false
	
	visual_base.visible = true
	visual_frosting.visible = true
	visual_piping.visible = true
	visual_topping.visible = true
	
	_hide_all_children(visual_base)
	_hide_all_children(visual_frosting)
	_hide_all_children(visual_piping)
	_hide_all_children(visual_topping)

func _connect_signals():
	# phase 0 shapes
	$OvenButtons/CircleButton.pressed.connect(func(): _on_shape_selected("Circle"))
	$OvenButtons/SquareButton.pressed.connect(func(): _on_shape_selected("Square"))
	$OvenButtons/HeartButton.pressed.connect(func(): _on_shape_selected("Heart"))

	#phase 1 frosting
	$FlavorButtons/ChocolateFlavor.pressed.connect(func(): _on_flavor_selected("Choco"))
	$FlavorButtons/VanillaFlavor.pressed.connect(func(): _on_flavor_selected("Vanilla"))
	$FlavorButtons/StrawberryFlavor.pressed.connect(func(): _on_flavor_selected("Strawberry"))

	#phase 2 piping
	$PipingButtons/VanillaPiping.pressed.connect(func(): _on_piping_selected("Vanilla"))
	$PipingButtons/ChocolatePiping.pressed.connect(func(): _on_piping_selected("Chocolate"))
	$PipingButtons/StrawberryPiping.pressed.connect(func(): _on_piping_selected("Strawberry"))
	$PipingButtons/UbePiping.pressed.connect(func(): _on_piping_selected("Ube"))

	#phase 3 toppings
	$ToppingButtons/CandleButton.pressed.connect(func(): _on_topping_selected("Candle"))
	$ToppingButtons/CherryButton.pressed.connect(func(): _on_topping_selected("Cherry"))
	$ToppingButtons/ChocoSprinkleButton.pressed.connect(func(): _on_topping_selected("Drizzle"))
	$ToppingButtons/SprinkleButton.pressed.connect(func(): _on_topping_selected("Sprinkles"))
	
	next_btn.pressed.connect(_on_next_pressed)

#phase 0
func _on_shape_selected(shape_name):
	selected_shape = shape_name
	SFX.Press()
	
	if not Global.cake_stack.is_empty(): Global.pop()
	Global.push(shape_name.to_lower() + "_base")
	#hide children node
	_hide_all_children(visual_base)
	
	visual_base.visible = true
	match shape_name:
		"Circle":
			$CakeBase/Circle.visible = true
		"Square":
			$CakeBase/Square.visible = true
		"Heart":
			$CakeBase/Heart.visible = true
	
	next_btn.visible = true

#phase 1
func _on_flavor_selected(flavor_name):
	
	selected_flavor = flavor_name
	if Global.cake_stack.size() > 1:
		Global.pop()
	Global.push(flavor_name)
	SFX.Press()
	
	_hide_all_children(visual_frosting)
	
	var flavor_node = visual_frosting.get_node_or_null(flavor_name)
	if flavor_node:
		var sprite_name = "Frosting" + flavor_name + selected_shape
		var sprite = flavor_node.get_node_or_null(sprite_name)
		
		if sprite:
			flavor_node.visible = true
			sprite.visible = true
			visual_base.visible = false
	
	next_btn.visible = true

#phase 2 piping
func _on_piping_selected(piping_type):
	SFX.Press()
	
	if Global.cake_stack.size() > 2:
		Global.pop()
	Global.push(piping_type)
	selected_piping = piping_type
	
	_hide_all_children(visual_piping)
	
	var shape_node = visual_piping.get_node_or_null(selected_shape)
	if shape_node:
		var sprite_name = selected_shape + piping_type
		var sprite = shape_node.get_node_or_null(sprite_name)
		
		if sprite:
			shape_node.visible = true
			sprite.visible = true
			
	next_btn.visible = true

#phase 3 topping
func _on_topping_selected(topping_type):
	SFX.Press()
	
	if Global.cake_stack.size() > 3:
		Global.pop()
	Global.push(topping_type)
	selected_topping = topping_type
	_hide_all_children(visual_topping)
	
	var shape_node = visual_topping.get_node_or_null(selected_shape)
	if shape_node:
		var sprite_name = selected_shape + topping_type
		var sprite = shape_node.get_node_or_null(sprite_name)
		
		if sprite:
			shape_node.visible = true
			sprite.visible = true
			
	next_btn.visible = true

#game flow
func _on_next_pressed():
	next_btn.visible = false 
	SFX.Press()
	
	if phase == 0:
		oven_buttons.visible = false
		flavor_buttons.visible = true
		phase = 1
		
	elif phase == 1:
		order_1.visible = false
		order_2.visible = false
		order_3.visible = false
		
		flavor_buttons.visible = false
		piping_buttons.visible = true
		phase = 2
		
	elif phase == 2:
		piping_buttons.visible = false
		topping_buttons.visible = true
		phase = 3
		
	elif phase == 3:
		print("Finished Stack: ", Global.cake_stack)
		
		if(Global.check_win()):
			get_tree().change_scene_to_file("res://GameScenes/WindOrLoseScenes/win_scene.tscn")
		else:
			
			get_tree().change_scene_to_file("res://GameScenes/WindOrLoseScenes/LoseScene.tscn")
func _hide_all_children(node):
	for child in node.get_children():
		child.visible = false
		if child.get_child_count() > 0:
			_hide_all_children(child)
