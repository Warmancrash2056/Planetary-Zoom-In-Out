extends Camera3D

@export var ZoomLevel: int

var StopZoomIn = false
var StopZoomOut = false
# Called when the node enters the scene tree for the first time.
func _ready():
	fov = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("Zoom In") and StopZoomIn == false:
		print("Zoom In")
		fov -= 0.3
		StopZoomOut = false
		if fov <= 20:
			StopZoomIn = true
			print("Stop Zoom In")
	if Input.is_action_pressed("Zoom Out") and StopZoomOut == false:
		print("Zoom Out")
		fov += 0.3
		StopZoomIn = false
		print(fov)
		if fov >= 50:
			StopZoomOut = true
			fov = 50
			print("Stop Zoom Out")
			print(fov)
