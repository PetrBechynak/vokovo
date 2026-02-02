extends Node3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player1or2"):
		var gun = body.get_node("Gun")
		if gun != null:
			gun.allowweapontype3 = true
			queue_free()
