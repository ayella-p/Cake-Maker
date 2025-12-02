extends Node

# stack
#add top (push), and remove top (pop)
var cake_stack = []
#game level
var current_level = 1
var character = "";

#push item
func push(item_name):
	cake_stack.push_back(item_name)
	print("PUSHED:", item_name, " | Stack:", cake_stack)

#pop item
func pop():
	if not cake_stack.is_empty():
		var removed = cake_stack.pop_back()
		print("POPPED:", removed, " | Stack:", cake_stack)
		return removed
	else:
		print("Stack Underflow! (Nothing to pop)")
		return null
#like switch statement
var level_data = {
	1: {
		"customer": "Reah",
		# array we want to build
		"target_stack": ["circle_base"], 
		"order_form_img": preload("res://Assets/Sprites/OrderForm/first_order.jpg") 
	},
	2: {
		"customer": "John",
		"target_stack": ["square_base"],
		"order_form_img": preload("res://Assets/Sprites/OrderForm/first_order.jpg")
	},
	3: {
		"customer": "Sarah",
		"target_stack": ["heart_base"], 
		"order_form_img": preload("res://Assets/Sprites/OrderForm/first_order.jpg")
	}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
