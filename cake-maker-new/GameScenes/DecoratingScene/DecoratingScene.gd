extends Node2D

@export var n = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_select_toppings(name):
	var index_remove = -1

	for i in range(Global.cake_stack.size()):
		if Global.cake_stack[i] == name:
			index_remove = i
			break
	
	if(index_remove != -1):
		for i in range(index_remove, Global.cake_stack.size() - 1):
			Global.cake_stack[i] = Global.cake_stack[i + 1]
	
	
		print("Removed:", name, " | Stack:", Global.cake_stack)
		Global.cake_stack.resize(Global.cake_stack.size() - 1)
	
	if Global.cake_stack.size() >= 4:
		Global.pop()
	
	Global.push(name)
	
func _on_toppings_1_pressed() -> void:
	_on_select_toppings("sprinkles")

func _on_topping_2_pressed() -> void:
	
	_on_select_toppings("cherry")

func _on_topping_3_pressed() -> void:

	_on_select_toppings("choco sprinkles")

func _on_topping_4_pressed() -> void:
	
	_on_select_toppings("m&ms")


func _on_next_button_pressed() -> void:
	print("next")

#after the next button is pressed the toppings_button will hide and the flavor buttons will apear

func _on_flavor_1_pressed() -> void:
	print("flavor1")


func _on_flavor_2_pressed() -> void:
	print("flavor2")


func _on_flavor_3_pressed() -> void:
	print("flavor3")


func _on_flavor_4_pressed() -> void:
	print("flavor4")
