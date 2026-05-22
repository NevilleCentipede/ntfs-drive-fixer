import std/osproc
import raylib, rlgl
import raygui
import naygui/styles/[amber, ashes, bluish, candy, cherry, cyber, dark, enefete, jungle, genesis,
  lavanda, rltech, sunny, terminal]
const
  screenWidth = 1024
  screenHeight = 800
proc main =
  setConfigFlags(flags(VsyncHint, WindowResizable))
  initWindow(screenWidth, screenHeight, "NTFS DRIVE FIXER")
  #[let font = loadFont("data/Roboto-Regular.ttf", 15, 0)
  guiSetFont(font)]#
  guiLoadStyleCyber()
  setTraceLogLevel(TraceLogLevel.Warning)
  var 
    ifTextInput: bool = true
    textInput = newString(32)
  setTargetFPS(60)
  echo "Raylib version: ", getVersion()
  while not windowShouldClose(): # Detect window close button or ESC key
    var 
      getFpsA = $getFPS()
      getCurrentScreenWidth = getScreenWidth()
      getCurrentScreenHeight = getScreenHeight()
      getCurrentScreenWidthFloat = getCurrentScreenWidth.float32
      getCurrentScreenHeightFloat = getCurrentScreenHeight.float32
      buttonWidth = getCurrentScreenWidthFloat * 0.25f
      buttonHeight = getCurrentScreenHeightFloat * 0.20f
      textBoxWidth = getCurrentScreenWidthFloat * 0.2f
      textBoxHeight = getCurrentScreenHeightFloat * 0.2f
    beginDrawing()
    clearBackground(Gray)
    drawText(getFpsA, 1, 1, 50, BLACK)
    if ifTextInput:
      discard textInputBox(Rectangle(x: (getCurrentScreenWidthFloat-textBoxWidth)/2, y: (getCurrentScreenHeightFloat-textBoxHeight)/2, width: textBoxWidth, height: textBoxHeight),
    "", "Fixer", "this does nothing", textInput)

    if button(Rectangle(x: (getCurrentScreenWidthFloat-buttonWidth)/2,
    
    y: ((getCurrentScreenHeightFloat-buttonHeight)/2)+200, 
    width:buttonWidth, 
    height:buttonHeight), "FIX"):
      let pkexecLaunch = startProcess("pkexec", args=["/usr/bin/ntfsfix","-d", textInput], options={poUsePath, poStdErrToStdOut})
    endDrawing()
  closeWindow() # Close window and OpenGL context
main()
