class_name Character
extends CharacterBody2D

@export var gravity: int = 400
@export var moveSpeed: int = 200


func ApplyGravity():
	var gravityForce = gravity * get_process_delta_time()
	velocity.y += gravityForce
