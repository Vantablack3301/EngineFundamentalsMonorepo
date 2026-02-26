extends Node3D

@export var rotObj: Node3D
@export var colliderObj: Area3D

@export var rotationSpeed = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	colliderObj.body_entered.connect(_on_body_entered) #i almost did an entirely separate script for this shit


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotObj.rotate(Vector3(0, 1, 0), rotationSpeed * delta)
	#rotObj.position.y = sin(delta / 50) * 400 #since we cant do timeline animations in godot i tried to do a manual sine wave anim
	#problem is idk how sine waves work, and also i was almost definitely doing this incorrectly.

func _on_body_entered(body: Node) -> void:
	print("object has entered")
	if not body.is_in_group("Player"):
		print("object of invalid type, skipping")
		return
	if body.has_method("_increment_tree_count"):
		body._increment_tree_count()
	else:
		print("necessary function missing, skipping")
		return
	
	print("Tree-coin Collected!")
	queue_free()
