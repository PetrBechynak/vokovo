extends Area3D

@export var wall_13: Node3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player1or2"):
		var wall13 = get_tree().get_first_node_in_group("wall13")
		get_tree().get_first_node_in_group("wall13").position.x += 100
	


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player1or2"):
		get_tree().get_first_node_in_group("wall13").position.x -= 100
	
