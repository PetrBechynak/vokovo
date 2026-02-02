extends Node3D

@export var speed := 5.0
@export var distance := 5.0

var start_z : float
var direction := 1.0

func _ready():
	start_z = position.z

func _physics_process(delta):
	position.z += speed * direction * delta

	if position.z > start_z + distance:
		direction = -1
	elif position.z < start_z - distance:
		direction = 1
