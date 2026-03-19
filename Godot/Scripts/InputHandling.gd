extends CharacterBody3D

var attack_held = false

var look_rotation : Vector2

var move_speed = 8
var look_speed = .2
var jump_velocity = 5
var collectedTrees = 0
var attack_velocity = 50

var mouse_captured : bool

@onready var head: Node3D = $Head

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
		
	var move := Input.get_vector("Move_Left", "Move_Right", "Move_Forward", "Move_Backward")
	var move_dir := (transform.basis * Vector3(move.x, 0, move.y)).normalized()
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump_velocity
		
	
	velocity.x = move_dir.x * move_speed
	velocity.z = move_dir.z * move_speed
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("Attack"):
		print("mr electric, SEND THIS FUCKER STRAIGHT TO HELL")
		velocity = (global_basis * Vector3.MODEL_REAR).normalized() * 150
	
	print(velocity)
	move_and_slide()
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture_mouse()
	
	if Input.is_key_pressed(KEY_ESCAPE):
		release_mouse()
		
	if mouse_captured and event is InputEventMouseMotion:
		rotate_look(event.relative)
	
func rotate_look(rot_input : Vector2):
	look_rotation.x -= rot_input.y * look_speed
	look_rotation.x = clamp(look_rotation.x, deg_to_rad(-85), deg_to_rad(85))
	look_rotation.y -= rot_input.x * look_speed
	transform.basis = Basis()
	rotate_y(look_rotation.y)
	head.transform.basis = Basis()
	head.rotate_x(look_rotation.x)
	
func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true
	
func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false


func _increment_tree_count():
	collectedTrees += 1
	print(collectedTrees)

func _get_collected_trees() -> int:
	return collectedTrees
