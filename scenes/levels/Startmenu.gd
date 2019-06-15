extends Control



func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/levels/start.tscn")
	print("HI")


func _on_QuitButton_pressed():
	print("QUIRT")
	get_tree().quit();
