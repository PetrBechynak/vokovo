extends Area3D

@onready var animation_player: AnimationPlayer = $Sketchfab_Scene/AnimationPlayer
@onready var animation_player_2: AnimationPlayer = $Sketchfab_Scene/AnimationPlayer2
@onready var player: CharacterBody3D = $Player
@onready var player_2: CharacterBody3D = $Player2


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player_1"):
		var player = get_tree().get_first_node_in_group("player_1")
		print(player)
		player.modifyHealth(+2)
		print("sebrano")
		queue_free()
	if body.is_in_group("player_2"):
		var player_2 = get_tree().get_first_node_in_group("player_2")
		print(player_2)
		player_2.modifyHealth(+2)
		print("sebrano")
		queue_free()
	
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	animation_player.play("upanddown")
	animation_player_2.play("rot")
	
