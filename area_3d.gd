extends Area3D


func _on_body_entered(body: Node3D) -> void:
	get_parent().queue_free()

func _on_area_entered(area: Area3D) -> void:
	print("sebrano shotgun")
