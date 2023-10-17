extends Node


var playerHP = 10
var Gold = 0
var Cherry = 0

func reset_stats():
	playerHP = 10
	Gold = 0
	Cherry = 0
	Utils.saveGame()
