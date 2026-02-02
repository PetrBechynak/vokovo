extends Node3D
@onready var player_2: Node3D = $"."
@onready var player_1: Node3D = $"."
@onready var camera: Node3D = $"."



func _physics_process(delta: float) -> void:
	var pos_x = player_1.position.x + player_2.position.x
	var pos_z = player_1.position.z + player_2.position.z
	camera.position.x = pos_x
	camera.position.z = pos_z
