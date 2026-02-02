extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player1or2"):
		var player = get_tree().get_first_node_in_group("player1or2")
		player.modifyHealth(-3)
		print("naraz do zdi")
	
