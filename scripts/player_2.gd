extends Player

func _player_ready() -> void:
	if has_node("guy/AnimationTree"):
		var animation_tree = get_node("guy/AnimationTree")
		animation_tree["parameters/StateMachine/conditions/idle"] = true
		animation_tree["parameters/StateMachine/conditions/run"] = false

func _player_physics_process(delta: float) -> void:
	if has_node("guy/AnimationTree"):
		var animation_tree = get_node("guy/AnimationTree")
		if velocity.length() > 1:
			animation_tree["parameters/StateMachine/conditions/run"] = true
			animation_tree["parameters/StateMachine/conditions/idle"] = false
		else:
			animation_tree["parameters/StateMachine/conditions/run"] = false
			animation_tree["parameters/StateMachine/conditions/idle"] = true

func _get_forward_action() -> String:
	return "foward2"

func _get_back_action() -> String:
	return "back2"

func _get_left_action() -> String:
	return "left2"

func _get_right_action() -> String:
	return "right2"

func _get_jump_action() -> String:
	return "jump2"

func _player_physics_process(delta: float) -> void:
	if has_node("guy/AnimationTree"):
		var animation_tree = get_node("guy/AnimationTree")
		if velocity.length() > 1:
			animation_tree["parameters/StateMachine/conditions/run"] = true
			animation_tree["parameters/StateMachine/conditions/idle"] = false
		else:
			animation_tree["parameters/StateMachine/conditions/run"] = false
			animation_tree["parameters/StateMachine/conditions/idle"] = true
	
	if Input.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_death() -> void:
	printt("player_2: died")
	queue_free()
