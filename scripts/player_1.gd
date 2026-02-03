extends Player

@onready var guy: Node3D = $"."
var animation_tree : AnimationTree

func _player_ready() -> void:
	animation_tree = guy.find_child("AnimationTree")

func _player_physics_process(delta: float) -> void:
	if velocity.length() > 1:
		animation_tree["parameters/StateMachine/conditions/run"] = true
		animation_tree["parameters/StateMachine/conditions/idle"] = false
	else:
		animation_tree["parameters/StateMachine/conditions/run"] = false
		animation_tree["parameters/StateMachine/conditions/idle"] = true

func _on_health_changed() -> void:
	animation_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
