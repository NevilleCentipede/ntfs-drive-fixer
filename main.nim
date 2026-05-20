import std/osproc
import raylib, rlgl
import raygui
import naygui/styles/[amber, ashes, bluish, candy, cherry, cyber, dark, enefete, jungle, genesis,
  lavanda, rltech, sunny, terminal]
const
  screenWidth = 800
  screenHeight = 450
proc main =
  initWindow(screenWidth, screenHeight, "NTFS DRIVE FIXER")
  guiLoadStyleDark()
  setTraceLogLevel(TraceLogLevel.Warning)
  var 
    ifTextInput: bool = true
    textInput = newString(32)
  setTargetFPS(60)
  echo "Raylib version: ", getVersion()
  while not windowShouldClose(): # Detect window close button or ESC key
    var getFpsA = $getFPS()
    beginDrawing()
    clearBackground(Gray)
    drawText(getFpsA, 1, 1, 50, BLACK)
    if ifTextInput:
      discard textInputBox(Rectangle(x: 150, y: 100, width: 500, height: 200), "", "Fixer", "this does nothing", textInput)
    if button(Rectangle(x: 150, y: 50, width:500, height:50), "FIX"):
      let pkexecLaunch = execProcess("pkexec", args=["/usr/bin/ntfsfix","-d", textInput], options={poUsePath, poStdErrToStdOut})
    endDrawing()
  closeWindow() # Close window and OpenGL context
main()
