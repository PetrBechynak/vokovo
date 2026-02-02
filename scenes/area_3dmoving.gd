extends Area3D

var speed :=2
var direction:=1

func _physics_process(delta: float) -> void:
	position.z += speed * direction * delta
	print(position.z)
	if position.z > -2:
		direction = -1
	if position.z < -10:
		direction = 1
	
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player1or2"):
		var player = get_tree().get_first_node_in_group("player1or2")
		player.modifyHealth(-3)
		print("naraz do zdi")
