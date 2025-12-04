extends Node

# stack
#add top (push), and remove top (pop)
var cake_stack = []
var target_stack = []
#game level
var current_level = 1
var character = "";

#push item
func push(item_name):
	var currentsize = cake_stack.size()
	cake_stack.resize(currentsize + 1)
	cake_stack[currentsize] = item_name
	print("PUSHED:", item_name, " | Stack:", cake_stack)

#pop item
func pop():
	if not cake_stack.size() == 0:
		var top = cake_stack.size() - 1
		var removed = cake_stack[top]
		cake_stack.resize(top);
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
		"target_stack": ["heart_base", "Strawberry", "Vanilla", "Cherry"]
,
		"order_form_img": preload("res://Assets/Sprites/Orders/Order1.png") 
	},
	2: {
		"customer": "John",
		"target_stack": ["circle_base", "Choco", "Strawberry", "Sprinkles"],
		"order_form_img": preload("res://Assets/Sprites/Orders/Order2.png")
	},
	3: {
		"customer": "Sarah",
		"target_stack": ["square_base", "Vanilla", "Ube", "Drizzle"], 
		"order_form_img": preload("res://Assets/Sprites/Orders/Order3.png")
	}
}
func start_level(level_num):
	cake_stack = [] 
	
	if level_num < 4:
		target_stack = level_data[level_num]["target_stack"]
		print("Level ", level_num, " Started! Target: ", target_stack)

func check_win():
	print("Checking Win...")
	print("Player Stack: ", cake_stack)
	print("Target Stack: ", target_stack)
	
	if cake_stack == target_stack:
		print("WIN!")
		return true
	else:
		print("LOSE!")
		return false
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
