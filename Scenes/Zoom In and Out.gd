extends Node3D

@onready var CameraZoom = $Camera3D
@onready var PlanetSaturn = $Saturn
@onready var Spotlight = $SpotLight3D
@onready var Description = $Control/Description
@onready var Distance = $Control/Distance

var Miles = 430
var StopZoomIn = false
var StopZoomOut = false

func _ready():
	CameraZoom.fov = 120	

func _process(delta):
	if Input.is_action_pressed("Zoom In") and StopZoomIn == false:
		print("Zoom In")
		CameraZoom.fov -= 0.3
		StopZoomOut = false
		print(CameraZoom.fov)
		Miles -= 1
		if CameraZoom.fov <= 20:
			Miles = 96
			StopZoomIn = true
			CameraZoom.fov = 20
			print("Stop Zoom In")
	if Input.is_action_pressed("Zoom Out") and StopZoomOut == false:
		print("Zoom Out")
		CameraZoom.fov += 1
		StopZoomIn = false
		print(CameraZoom.fov)
		Miles += 2
		if CameraZoom.fov >= 120:
			Miles = 430
			StopZoomOut = true
			CameraZoom.fov = 120
			print("Stop Zoom Out")
			print(CameraZoom.fov)

func _physics_process(delta):
	if CameraZoom.fov <= 20:
		Description.visible = true
	else:
		Description.visible = false
		
	PlanetSaturn.rotation.y -= 0.03

	Distance.set_text(str("Distance ", Miles, " Million Miles from the sun" ))
