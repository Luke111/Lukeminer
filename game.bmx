Import blitz3d.blitz3dsdk
SeedRnd MilliSecs()
Include "coretypes.bmx"
bbBeginBlitz3D()
bbGraphics3D 800,600,32,2
Include "cube.bmx"
Include "streams.bmx"
Include "loadershelp.bmx"
Include "loaders.bmx"
Include "mainfns.bmx"
Include "engine.bmx"
LoadBlocks()
doSplashMain()
Include "mod_mainworld.bmx"
cam = bbCreateCamera()
light = bbCreateLight()
skybox = bbCreateCube(cam)
bbScaleEntity skybox,512,512,512
skytex = bbLoadTexture("sky.jpg")
bbEntityFX skybox,1
bbEntityTexture skybox,skytex
bbFlipMesh skybox
bbPositionEntity light,64 / 2,64,64/2
bbPositionEntity cam,camx,camy,camz
bbEntityRadius cam,5
bbEntityType cam,typ_player
plane = bbCreatePlane()
bbEntityColor plane,0,0,0
bbEntityType plane,555
bbCollisions typ_player,555,2,1
Include "main.bmx"