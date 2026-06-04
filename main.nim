import raylib, rlgl
import raygui
import naygui/styles/[amber, ashes, bluish, candy, cherry, cyber, dark, enefete, jungle, genesis,
  lavanda, rltech, sunny, terminal]
import drawProc
const
  screenWidth = 1024
  screenHeight = 800
proc main =
  setConfigFlags(flags(VsyncHint, WindowResizable))
  initWindow(screenWidth, screenHeight, "NTFS DRIVE FIXER")
  #[let font = loadFont("data/Roboto-Regular.ttf", 15, 0)
  guiSetFont(font)]#
  guiLoadStyleJungle()
  setTraceLogLevel(TraceLogLevel.Warning)
  setTargetFPS(60)
  echo "Raylib version: ", getVersion()
  while not windowShouldClose(): # Detect window close button or ESC key
    beginDrawing()
    drawProc()
    clearBackground(Gray)
    endDrawing()
  closeWindow() # Close window and OpenGL context
main()
