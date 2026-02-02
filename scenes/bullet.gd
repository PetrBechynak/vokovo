extends Node3D

var direction: Vector3
var speed: float = 8

func _ready() -> void:
	printt("start bullet pos:", position)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player") and body.has_method("modifyHealth"):
		body.modifyHealth(-3)
	queue_free()

func _physics_process(delta: float) -> void:
	position.z += delta*speed * direction.z
	position.x += delta*speed * direction.x
