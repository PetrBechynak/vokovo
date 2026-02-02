extends BasePlayer

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
	if Input.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_death() -> void:
	printt("player_2: died")
	queue_free()
