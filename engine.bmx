Global selected:Int
selected = 1
Global selectedtype:Int
selectedtype = 1
Global surface
Function UpdatePlayer(cam)
	If bbCountCollisions(cam) > 0 Then
		camy = camy + 1
	EndIf
	Local kk
	If bbPickedEntity() Then
	If bbGetParent(bbPickedEntity()) Then
		kk = bbGetParent(bbPickedEntity())
	Else
		kk = bbPickedEntity()
	EndIf
	EndIf
	If bbPickedEntity() Then
		Local func_a:Int
		Local func_b:Int
		Local func_c:TSplitIntResult = New TSplitIntResult
		func_c = splitInt(Int(bbEntityName(kk)))
		func_a = func_c.t_a
		func_b = func_c.t_b
		Local ff:Int = array_blocks[func_a,func_b].tex
		bbPaintSurface bbPickedSurface(),surface
		bbEntityAlpha kk,array_blocks[func_a,func_b].t
	EndIf
	If bbCameraPick(cam,bbMouseX(),bbMouseY()) Then
		Local zz = bbGetParent(bbPickedEntity())
		If zz > 0 Then
			kk = bbGetParent(bbPickedEntity())
		Else
			kk = bbPickedEntity()
		EndIf
		surface = bbGetSurfaceBrush(bbPickedSurface())
		bbPaintSurface bbPickedSurface(),pickedtex
		bbEntityAlpha kk,1
		If bbMouseHit(1) Then
			bbHideEntity kk
			blockary[bbEntityX(kk)/6,bbEntityY(kk)/6,bbEntityZ(kk)/6] = 0
		ElseIf bbMouseHit(2) Then
			Local ccc
			Local ddd:TBlock = New TBlock
			If bbEntityZ(kk) - 6 = bbPickedZ() Then
				'front
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk),bbEntityY(kk),bbEntityZ(kk)-12
				bbShowEntity ccc
				blockary[bbEntityX(kk)/16,bbEntityY(kk)/16,(bbEntityZ(kk)-16)/16] = 1
			ElseIf bbEntityZ(kk) + 6 = bbPickedZ() Then
				'back
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk),bbEntityY(kk),bbEntityZ(kk)+12
				bbShowEntity ccc
				blockary[bbEntityX(kk)/16,bbEntityY(kk)/16,(bbEntityZ(kk)+16)/16] = 1
			ElseIf bbEntityX(kk) - 6 = bbPickedX() Then
				'left
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk) - 12,bbEntityY(kk),bbEntityZ(kk)
				bbShowEntity ccc
				blockary[(bbEntityX(kk)-16)/16,bbEntityY(kk)/16,bbEntityZ(kk)/16] = 1
			ElseIf bbEntityX(kk) + 6 = bbPickedX() Then
				'right
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk)+12,bbEntityY(kk),bbEntityZ(kk)
				bbShowEntity ccc
				blockary[(bbEntityX(kk)+16)/16,bbEntityY(kk)/16,bbEntityZ(kk)/16] = 1
			ElseIf bbEntityY(kk) - 6 = bbPickedY() Then
				'top
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk),bbEntityY(kk)-12,bbEntityZ(kk)
				bbShowEntity ccc
				blockary[bbEntityX(kk)/16,(bbEntityY(kk)-16)/16,bbEntityZ(kk)/16] = 1
			ElseIf bbEntityY(kk) + 6 = bbPickedY() Then
				'bottom
				ddd = deepCopyEntity(array_blocks[selectedtype,selected])
				ccc = ddd.entity
				bbPositionEntity ccc,bbEntityX(kk),bbEntityY(kk)+12,bbEntityZ(kk)
				bbShowEntity ccc
				blockary[bbEntityX(kk)/16,(bbEntityY(kk)+16)/16,(bbEntityZ(kk)+16)/16] = 1
			EndIf
		EndIf
	EndIf
	If bbKeyDown(W_KEY) And bbKeyDown(A_KEY) Then
		dif_x = -5
		dif_z = 5
	ElseIf bbKeyDown(S_KEY) And bbKeyDown(A_KEY) Then
		dif_x = -5
		dif_z = -5
	ElseIf bbKeyDown(W_KEY) And bbKeyDown(D_KEY) Then
		dif_x = 5
		dif_z = 5
	ElseIf bbKeyDown(D_KEY) And bbKeyDown(S_KEY) Then
		dif_x = 5
		dif_z = -5
	ElseIf bbKeyDown(W_KEY) Then
		dif_z = 5
		dif_x = 0
	ElseIf bbKeyDown(A_KEY) Then
		dif_z = 0
		dif_x = -5
	ElseIf bbKeyDown(S_KEY) Then
		dif_x = 0
		dif_z = -5
	ElseIf bbKeyDown(D_KEY) Then
		dif_x = 5
		dif_z = 0
	Else
		dif_x = 0
		dif_y = 0
	EndIf
	If bbKeyDown(J_KEY) And bbKeyDown(I_KEY) Then
		dif_pitch = -5
		dif_yaw = 5
	ElseIf bbKeyDown(J_KEY) And bbKeyDown(K_KEY) Then
		dif_pitch = 5
		dif_yaw = 5
	ElseIf bbKeyDown(L_KEY) And bbKeyDown(I_KEY) Then
		dif_pitch = -5
		dif_yaw = -5
	ElseIf bbKeyDown(L_KEY) And bbKeyDown(K_KEY) Then
		dif_pitch = 5
		dif_yaw = -5
	ElseIf bbKeyDown(J_KEY) Then
		dif_yaw = 5
		dif_pitch = 0
	ElseIf bbKeyDown(I_KEY) Then
		dif_pitch = -5
		dif_yaw = 0
	ElseIf bbKeyDown(K_KEY) Then
		dif_pitch = 5
		dif_yaw = 0
	ElseIf bbKeyDown(L_KEY) Then
		dif_pitch = 0
		dif_yaw = -5
	Else
		dif_pitch = 0
		dif_yaw = 0
	EndIf
	If bbKeyDown(UPARROW) Then
		dif_z = 5
		dif_x = 0
	ElseIf bbKeyDown(LFTARROW) Then
		dif_z = 0
		dif_x = -5
	ElseIf bbKeyDown(DOWNARROW) Then
		dif_x = 0
		dif_z = -5
	ElseIf bbKeyDown(RGHTARROW) Then
		dif_x = 5
		dif_z = 0
	EndIf
	'top of the screen
	If bbMouseX() >= 200 And bbMouseX() <= 400 And bbMouseY() >= 0 And bbMouseY() <= 50 Then
		dif_pitch = -2
	'bottom of the screen
	ElseIf bbMouseX() >= 200 And bbMouseX() <= 400 And bbMouseY() >= 550 And bbMouseY() <= 600 Then
		dif_pitch = 2
	'left of the screen
	ElseIf bbMouseX() >= 0 And bbMouseX() <= 50 And bbMouseY() >= 200 And bbMouseY() <= 400 Then
		dif_yaw = 2
	'right of the screen
	ElseIf bbMouseX() >= 750 And bbMouseX() <= 800 And bbMouseY() >= 200 And bbMouseY() <= 400 Then
		dif_yaw = -2
	EndIf
	If bbKeyHit(SPACEBAR) Then
		dif_y = 16-1
	Else
		dif_y = 0
	EndIf
	If bbKeyHit(LCTRL_KEY) Then
		If selected - 1 < 1 Then
			selected = 1
		Else
			selected = selected - 1
		EndIf
	ElseIf bbKeyHit(RCTRL_KEY) Then
		If selected + 1 > (numOfBlocks(selectedtype)) Then
			selected = (numOfBlocks(selectedtype))
		Else
			selected = selected + 1
		EndIf
	EndIf
	If bbKeyHit(LALT_KEY) Then
		selected = 1
		If selectedtype - 1 < 1 Then
			selectedtype = 1
		Else
			selectedtype :- 1
		EndIf
	ElseIf bbKeyHit(RALT_KEY) Then
		selected = 1
		If selectedtype + 1 > (numOfTypes()) Then
			selectedtype = (numOfTypes())
		Else
			selectedtype :+ 1
		EndIf
	EndIf
	bbTurnEntity cam,dif_pitch,dif_yaw,0
	bbMoveEntity cam,dif_x,dif_y,dif_z
	camy = camy + dif_y
	camx = camx + dif_x
	camz = camz + dif_z
End Function
Function displayHUD()
	'draw selectedtypes image shifted 2
	If selected - 2 >= 1 Then
		bbDrawImageRect array_teximages[selectedtype,selected - 2],280,570,0,0,25,25
	EndIf
	'draw selectedtypes next one left
	If selected - 1 >= 1 Then
		bbDrawImageRect array_teximages[selectedtype,selected - 1],310,560,0,0,35,35
	EndIf
	'draw selectedtypes selected
	bbDrawImageRect array_teximages[selectedtype,selected],350,545,0,0,50,50
	'transparent flag
	If array_blocks[selectedtype,selected].t < 1 Then
		bbDrawImageRect transimage,350,545,0,0,15,15
	EndIf
	'draw selectedtypes next one right
	If selected + 1 <= numOfBlocks(selectedtype) Then
		bbDrawImageRect array_teximages[selectedtype,selected + 1],405,560,0,0,35,35
	EndIf
	'draw selectedtypes 2 to the right
	If selected + 2 <= numOfBlocks(selectedtype) Then
		bbDrawImageRect array_teximages[selectedtype,selected + 2],445,570,0,0,25,25
	EndIf
	'draw selectedtypes + 1 #1 image
	If selectedtype + 1 <= numOfTypes() Then
		bbDrawImageRect array_teximages[selectedtype + 1,1],325,520,0,0,25,25
	EndIf
	'draw selectedtypes - 1 #1 image
	If selectedtype - 1 >= 1 Then
		bbDrawImageRect array_teximages[selectedtype - 1,1],325,597,0,0,25,3
	EndIf
End Function
Function deepCopyEntity:TBlock(entity:TBlock)
	Local func_a:Int
	Local func_b:Int
	Local func_c:TSplitIntResult = New TSplitIntResult
	func_c = splitInt(Int(bbEntityName(entity.entity)))
	func_a = func_c.t_a
	func_b = func_c.t_b
	Local toret:TBlock = New TBlock
	toret.entity = bbCopyMesh(entity.entity)
	toret.t = entity.t
	toret.tex = entity.tex
	bbScaleEntity toret.entity,6,6,6
	bbEntityAlpha toret.entity,array_blocks[func_a,func_b].t
	bbNameEntity toret.entity,bbEntityName(entity.entity)
	bbEntityPickMode toret.entity,2
	Return toret
End Function