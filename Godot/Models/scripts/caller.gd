extends Node3D

class_name Caller

@export var refObj: Reciever

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello reciever!")
	print(refObj.OnCalled())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
