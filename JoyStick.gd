extends TouchScreenButton

@onready var knob = $Knob
@onready var maxDistance = shape.radius

var stick_center: Vector2 = texture_normal.get_size() / 2
var touched: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			set_process(true)
		elif not event.pressed:
			set_process(false)
			knob.position = stick_center
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	knob.global_position = get_global_mouse_position()
	knob.position = stick_center + (knob.position - stick_center).limit_length(maxDistance)
	
func get_joystick_direction() -> Vector2:
	var directtion = knob.position - stick_center
	return directtion.normalized()
