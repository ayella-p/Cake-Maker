extends Node

# stack
#add top (push), and remove top (pop)
var cake_stack = []
#game level
var current_level = 1

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
