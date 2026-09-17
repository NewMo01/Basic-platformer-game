extends Node

var gameOver := false
var gameWin := false
var activePowerUp := false
var health := 3
var coins := 0
var isInBossBattle := false
var defeatedBoss := false


func resetValues():
	gameOver = false
	gameWin = false
	activePowerUp = false
	health = 3
	coins = 0
	isInBossBattle = false
	defeatedBoss = false
	AudioServer.set_bus_mute(0,false)
