extends Node3D

@export var speed := 5.0
@export var distance := 5.0

var start_y : float
var direction := 1.0

func _ready():
	start_y = position.y

func _physics_process(delta):
	position.y += speed * direction * delta

	if position.y > start_y + distance:
		direction = -1
	elif position.y < start_y - distance:
		direction = 1
