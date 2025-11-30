extends CanvasLayer


@onready var small_order = $SmallOrder
@onready var big_order = $BigOrder

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	big_order.pivot_offset = big_order.size / 2
	# Start with big order open
	var level_data = Global.level_data[Global.current_level]
	big_order.texture_normal = level_data["order_form_img"]
	show_big_order()
	
	# clicking the small paper opens the big one
	small_order.pressed.connect(_on_small_order_clicked)
	
	# clicking the BIG paper closes itself (puts it away)
	big_order.pressed.connect(_on_big_order_closed)
	 # Replace with function body.
func show_small_order():
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	# shrink to size 0 over 0.3 seconds
	tween.tween_property(big_order, "scale", Vector2.ZERO, 0.3)
	
	# animation
	tween.finished.connect(func(): 
		big_order.visible = false
		small_order.visible = true
	)

func show_big_order():
	small_order.visible = false
	big_order.visible = true
	big_order.scale = Vector2.ZERO # Start invisible (size 0)
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(big_order, "scale", Vector2.ONE, 0.4)
	
func _on_small_order_clicked():
	show_big_order()

func _on_big_order_closed():
	show_small_order()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
