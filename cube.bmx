Function CreateCube6(parent:Int=0,fronttex,backtex,lefttex,righttex,toptex,bottomtex)
	m=bbCreateMesh()
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,-1,1,-1,0,0
	bbAddVertex sfc,1,1,-1,1,0
	bbAddVertex sfc,1,-1,-1,1,1
	bbAddVertex sfc,-1,-1,-1,0,1
	bbVertexNormal sfc,0,0,0,-1
	bbVertexNormal sfc,1,0,0,-1
	bbVertexNormal sfc,2,0,0,-1
	bbVertexNormal sfc,3,0,0,-1
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
	
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,-1,1,-1,0,0
	bbAddVertex sfc,-1,1,1,1,0
	bbAddVertex sfc,1,1,1,1,1
	bbAddVertex sfc,1,1,-1,0,1
	bbVertexNormal sfc,0,0,1,0
	bbVertexNormal sfc,1,0,1,0
	bbVertexNormal sfc,2,0,1,0
	bbVertexNormal sfc,3,0,1,0
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
		
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,-1,1,1,0,0
	bbAddVertex sfc,-1,-1,1,1,0
	bbAddVertex sfc,1,-1,1,1,1
	bbAddVertex sfc,1,1,1,0,1
	bbVertexNormal sfc,0,0,0,1
	bbVertexNormal sfc,1,0,0,1
	bbVertexNormal sfc,2,0,0,1
	bbVertexNormal sfc,3,0,0,1
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
	
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,-1,-1,-1,0,0
	bbAddVertex sfc,1,-1,-1,1,0
	bbAddVertex sfc,1,-1,1,1,1
	bbAddVertex sfc,-1,-1,1,0,1
	bbVertexNormal sfc,0,0,-1,0
	bbVertexNormal sfc,1,0,-1,0
	bbVertexNormal sfc,2,0,-1,0
	bbVertexNormal sfc,3,0,-1,0
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
	
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,-1,1,1,0,0
	bbAddVertex sfc,-1,1,-1,1,0
	bbAddVertex sfc,-1,-1,-1,1,1
	bbAddVertex sfc,-1,-1,1,0,1
	bbVertexNormal sfc,0,-1,0,0
	bbVertexNormal sfc,1,-1,0,0
	bbVertexNormal sfc,2,-1,0,0
	bbVertexNormal sfc,3,-1,0,0
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
		
	sfc=bbCreateSurface(m)
	bbAddVertex sfc,1,1,-1,0,0
	bbAddVertex sfc,1,1,1,1,0
	bbAddVertex sfc,1,-1,1,1,1
	bbAddVertex sfc,1,-1,-1,0,1
	bbVertexNormal sfc,0,1,0,0
	bbVertexNormal sfc,1,1,0,0
	bbVertexNormal sfc,2,1,0,0
	bbVertexNormal sfc,3,1,0,0
	bbAddTriangle sfc,0,1,2
	bbAddTriangle sfc,2,3,0
	
	bbPaintSurface bbGetSurface(m,1),fronttex
	bbPaintSurface bbGetSurface(m,2),toptex
	bbPaintSurface bbGetSurface(m,3),backtex
	bbPaintSurface bbGetSurface(m,4),bottomtex
	bbPaintSurface bbGetSurface(m,5),lefttex
	bbPaintSurface bbGetSurface(m,6),righttex
	
	bbEntityParent m,parent
	Return m
End Function