extends CharacterBody2D

@onready var joystick = $UiLayer/JoyStick

const SPEED = 15000.0

func _physics_process(delta):
	if is_multiplayer_authority():
		var direction = joystick.get_joystick_direction()
		velocity = direction * SPEED * delta
	move_and_slide()

func _enter_tree():
	set_multiplayer_authority(name.to_int())
