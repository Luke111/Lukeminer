Function ReadTexture:TReadTextureResult(stream:TStream,start:Int)
	StreamSeek(stream,start)
	Local toret:TReadTextureResult = New TReadTextureResult
	toret.toptex = ReadLine(stream)
	toret.sidetex = ReadLine(stream)
	toret.bottomtex = ReadLine(stream)
	toret.image = ReadLine(stream)
	Local tran:String = ReadLine(stream)
	If tran = "transparent" Then
		toret.transparent = 1
	Else
		toret.transparent = 0
	EndIf
	Return toret
End Function

Global array_textures[3+1,10+1,30+1]
Global array_teximages[10+1,30+1]
Global array_blocks:TBlock[,]
array_blocks:TBlock = New TBlock[10+1,60+1]

Global transimage = bbLoadImage("transparent.bmp")

Global pickedtex = bbCreateBrush()
bbBrushTexture pickedtex,bbLoadTexture("pickedbrick.bmp")

Global camx:Int = (64 * 12) / 2,camy:Int = 64,camz:Int = (64 * 12) / 2

Global blockary:Byte[351,351,351]
blockary = New Byte[351,351,351]

Function LoadBlocks()
	Local func_a:Short = 1
	Local func_b:Int = 0
	Local func_c:Short = 0
	Local func_d:TReadTextureResult
	Local func_e:TStream
	Local func_f:Int = 0
	Local func_h:Float = 1
	While FileType("blocks"+String.FromInt(func_a)+".dat") = 1 And func_a <= 10
		func_b = getNumberOfResults("blocks"+String.FromInt(func_a)+".dat")
		If func_b = -1 Then
			func_a :+ 1
			Continue
		EndIf
		func_e = ReadFile("blocks"+String.FromInt(func_a)+".dat")
		For func_c = 0 To func_b - 1 Step 1
			func_d = ReadTexture(func_e,func_c * numofresultrows)
			array_textures[1,func_a,func_c+1] = bbLoadBrush(func_d.toptex)
			array_textures[2,func_a,func_c+1] = bbLoadBrush(func_d.sidetex)
			array_textures[3,func_a,func_c+1] = bbLoadBrush(func_d.bottomtex)
			array_teximages[func_a,func_c+1] = bbLoadImage(func_d.image)
			If func_d.transparent = 1 Then
				func_h = 0.35
				array_blocks[func_a,(func_c + 1 + func_f)] = LoadBlock(Int(String.FromInt(func_a)+pad(String.FromInt(func_c+1+func_f))),array_textures[1,func_a,func_c + 1],array_textures[3,func_a,func_c + 1],array_textures[2,func_a,func_c + 1],((func_a & $ffff0000) | ((func_c + 1 + func_f) & $0000ffff)),func_h)
				func_h = 1
			Else
				array_blocks[func_a,(func_c + 1 + func_f)] = LoadBlock(Int(String.FromInt(func_a)+pad(String.FromInt(func_c+1+func_f))),array_textures[1,func_a,func_c + 1],array_textures[3,func_a,func_c + 1],array_textures[2,func_a,func_c + 1],((func_a & $ffff0000) | ((func_c + 1 + func_f) & $0000ffff)),func_h)
			EndIf
		Next
		func_a :+ 1
	Wend
End Function

Function LoadBlock:TBlock(index:Int,toptex,bottomtex,sidetex,texnumber:Int,transparent:Byte)
	Local toret:TBlock = New TBlock
	If transparent = 1 Then
		toret.t = 1
	Else
		toret.t = 0.35
	EndIf
	toret.entity = CreateCube6(0,sidetex,sidetex,sidetex,sidetex,toptex,bottomtex)
	toret.tex = texnumber
	bbScaleEntity toret.entity,6,6,6
	bbEntityAlpha toret.entity,toret.t
	bbNameEntity toret.entity,String.FromInt(index)
	bbEntityPickMode toret.entity,2
	
	bbHideEntity toret.entity
	Return toret
End Function

Function pad:String(i:String)
	If Len(i) < 4 Then
		Local x:Byte = 1
		For x = Len(i) To 4 Step 1
			i = "0"+i
		Next
	EndIf
	Return i
End Function