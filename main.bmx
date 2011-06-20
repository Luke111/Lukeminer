Repeat
	While Not bbKeyHit(1)
		bbRenderWorld()
		bbUpdateWorld()
		UpdatePlayer(cam)
		displayHUD()
		bbFlip
	Wend
	End
Forever