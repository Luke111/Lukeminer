Const numofresultrows:Int = 5
Type TReadTextureResult
	Field toptex:String
	Field bottomtex:String
	Field sidetex:String
	Field image:String
	Field transparent:Byte
	Method Create:TReadTextureResult()
		Return New TReadTextureResult
	End Method
End Type

Type TSplitIntResult
	Field t_a
	Field t_b
	Method Create:TSplitIntResult()
		Return New TSplitIntResult
	End Method
End Type

Function splitInt:TSplitIntResult(i:Int)
	Local func_a:Int
	Local func_b:Int
	Local func_c:TSplitIntResult = New TSplitIntResult
	func_a = Int(ReverseString(Left(String.FromInt(i),4)))
	func_b = Int(ReverseString(Mid(ReverseString(String.FromInt(i)),1,4)))
	func_c.t_a = func_a
	func_c.t_b = func_b
	Return func_c
End Function

Function numOfBlocks:Int(index:Int)
	Local func_a:Int = 1
	While array_textures[1,index,func_a] <> 0
		func_a :+ 1
	Wend
	Return func_a - 1
End Function

Function numOfTypes:Int()
	Local func_a:Int = 1
	While array_textures[1,func_a,1] <> 0
		func_a :+ 1
	Wend
	Return func_a - 1
End Function

Function ReverseString:String(s:String)
	Local x:Int
	Local toret:String
	For x = Len(s) To 1 Step -1
		toret :+ Mid(s,x,1)
	Next
	Return toret
End Function