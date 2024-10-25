extends Camera2D

var zooming_speed = 1.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	# Scrolling
	if event is InputEventPanGesture:
		if event.delta.y > 0:
			self.zoom = self.zoom * zooming_speed
		elif event.delta.y < 0:
			self.zoom = self.zoom / -zooming_speed
	elif event.is_action("esc"):
			#get_tree().reload_current_scene() #reset
			get_tree().quit() #quit
	# Movement Keys
	elif event.is_action_pressed("foward"):
		self.position.y = self.position.y - 5
