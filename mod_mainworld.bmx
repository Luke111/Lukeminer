For xx:Int = 1 To 64
	yy = 1
		For zz:Int = 1 To 64
			blockary[xx,yy,zz] = 1
			Local jjj:TBlock = New TBlock
			jjj = deepCopyEntity(array_blocks[1,10])
			xxx = jjj.entity
			bbEntityParent xxx,0
			bbPositionEntity xxx,xx*12,yy*12,zz*12
			bbShowEntity xxx
		Next
Next