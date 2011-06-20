Function getNumberOfResults:Int(filename:String)
	If FileType(filename) <> 1 Then
		Return -1
	EndIf
	Local func_file = ReadFile(filename)	
	Local func_a:Int = 0
	While Not Eof(func_file)
		func_a :+ 1
		ReadLine(func_file)
	Wend
	CloseFile func_file
	Return func_a / numofresultrows
End Function

Function StreamSeek(stream:TStream Var,pos:Int)
	Local garbage:String
	SeekStream(stream,0)
	For pos = pos To 1 Step -1
		garbage = ReadLine(stream)
	Next
End Function