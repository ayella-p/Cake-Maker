extends Node2D

@export var n = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_select_toppings(name):
	if Global.cake_stack.has(name):
		Global.cake_stack.erase(name)
		print("Removed: ", name, " | Stack: ", Global.cake_stack)
		
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
