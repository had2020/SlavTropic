extends Camera2D

var zooming_speed = 1.05

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Movement kets
	if Input.is_action_pressed("foward"):
		self.position.y = self.position.y - 5
	elif Input.is_action_pressed("backward"):
		self.position.y = self.position.y + 5
	elif Input.is_action_pressed("left"):
		self.position.x = self.position.x - 5
	elif Input.is_action_pressed("right"):
		self.position.x = self.position.x + 5

func _input(event):
	# Scrolling
	if event is InputEventPanGesture:
		if event.delta.y > 0:
			self.zoom = self.zoom * zooming_speed
		elif event.delta.y < 0:
			self.zoom = self.zoom / -zooming_speed
	elif event.is_action("wheel_down"):
		self.zoom = self.zoom * zooming_speed
	elif event.is_action("wheel_up"):
		self.zoom = self.zoom / -zooming_speed
	elif event.is_action("esc"):
			#get_tree().reload_current_scene() #reset
			get_tree().quit() #quit
