extends Character
class_name Player

@export var jumpForce: float = 300

func _physics_process(delta):
	SetVelocityByInput()
	ApplyGravity()
	move_and_slide()


func SetVelocityByInput():
	var inputDirection: Vector2 = GetInputDirection()

	var speedX = inputDirection.x * moveSpeed
	SetVelocityX(speedX)
		
	if inputDirection.y != 0:
		AddModifyVeloctityY(inputDirection.y * jumpForce)


func GetInputDirection() -> Vector2:
	var directionX = (
		Input.get_action_strength(Constant.UserInputAction.MOVE_RIGHT)
		- Input.get_action_strength(Constant.UserInputAction.MOVE_LEFT)
	)

	var directionY = 0
	if is_on_floor() and Input.is_action_just_pressed(Constant.UserInputAction.JUMP):
		directionY = -1
	else:
		var cancelJumpMidAir = (
			Input.is_action_just_released(Constant.UserInputAction.JUMP) && velocity.y < 0
		)
		if cancelJumpMidAir:
			directionY = 0.3

	return Vector2(directionX, directionY)


func SetVelocityX(value: float):
	velocity.x = value


func AddModifyVeloctityY(value: float):
	velocity.y += value


func OnBodyEnterBody(body):
	queue_free()
	get_tree().reload_current_scene()
