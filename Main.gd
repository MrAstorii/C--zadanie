extends Control

var rng = RandomNumberGenerator.new()
var mojTest = "Wiec jaki jest wynik zadania? Tak Ciebie pytam! Zobaczymy czym zajmujesz sie na lekcji!"
var proby = 8

func _ready():
	pass
	$VBoxContainer/tekstGlowny.text = mojTest

	rng.randomize()
	var my_random_number = rng.randi_range(1, 100)
	get_node("wynik_liczb").value = my_random_number
	print(my_random_number)
	get_node("VBoxContainer/prob_liczb").value = proby


func _on_odp_liczb_value_changed(proba):
	proby = proby - 0.5
	get_node("VBoxContainer/odp_liczb").value = 0
	get_node("VBoxContainer/prob_liczb").value = proby
	if proba == $wynik_liczb.value:
		get_tree().change_scene("res://Wygrana.tscn")
	if proba > $wynik_liczb.value:
		get_node("VBoxContainer/tekstGlowny").text = "Co? Liczba tak wysoka jak przestworza, w ktorych bujasz!"
	if proba < $wynik_liczb.value:
		get_node("VBoxContainer/tekstGlowny").text = "Co? Liczba tak niska jak moje oczekiwania wobec Ciebie!"
	if proby == 0:
		get_tree().change_scene("res://Przegrana.tscn")
	if $VBoxContainer/prob_liczb.value == 0 and proba == $wynik_liczb.value:
		get_tree().change_scene("res://Wygrana.tscn")
