extends Camera3D

@onready var camera: Node3D = $"."
@onready var player: CharacterBody3D = $"../Player"
@onready var player_2: CharacterBody3D = $"../Player2"

func _physics_process(_delta: float) -> void:
	if player == null and player_2 == null:
		pass
	elif player_2 == null:
		global_position.x = player.global_position.x
		global_position.z = player.global_position.z +12
	elif player == null:
		global_position.x = player_2.global_position.x
		global_position.z = player_2.global_position.z+12
	else:
		var pos_x = (player.global_position.x + player_2.global_position.x) / 2.0
		var pos_z = (player.global_position.z + player_2.global_position.z) / 2.0
		camera.global_position.x = pos_x
		camera.global_position.z = pos_z + 8.0
		camera.global_position.y = 10.0
