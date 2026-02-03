extends "res://scenes/player.gd"

@onready var floor: Node3D = $"../floor"
@onready var guy: Node3D = $"."
var animation_tree : AnimationTree

func _ready() -> void:
	label.text = str(health)
	animation_tree = guy.find_child("AnimationTree")

func _physics_process(delta):
	common_physics_process(delta, "foward", "back", "left", "right", "jump")
	if Input.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE	
	if velocity.length()>1:
		animation_tree["parameters/StateMachine/conditions/run"] = true
		animation_tree["parameters/StateMachine/conditions/idle"] = false
	else:
		animation_tree["parameters/StateMachine/conditions/run"] = false
		animation_tree["parameters/StateMachine/conditions/idle"] = true
	
func modifyHealth(addHealth: float) -> void:
	health += addHealth
	animation_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	if health < 0:
		#animation_tree["parameters/StateMachine/conditions/die"] = true
		pass
	label.text = str(health)
