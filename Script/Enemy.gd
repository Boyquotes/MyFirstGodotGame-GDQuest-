class_name Enemy
extends Character

var currentDirection: int = -1


func _physics_process(delta: float) -> void:
	SetCharacterVelocityX()
	ApplyGravity()
	move_and_slide()


func SetCharacterVelocityX() -> void:
	if !is_on_floor():
		SetVelocityXOnStop()
		return

	if is_on_wall():
		ChangeDirection()

	SetVelocityXByDirection()


func ChangeDirection() -> void:
	currentDirection *= -1


func SetVelocityXByDirection() -> void:
	velocity.x = moveSpeed * currentDirection


func SetVelocityXOnStop() -> void:
	velocity.x = 0

func Kill() -> void:
	queue_free()
