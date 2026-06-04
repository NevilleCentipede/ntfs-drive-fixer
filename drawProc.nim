import raylib
import osproc
import raygui
var textInput* = newString(32)
proc drawProc*()=
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
    ifTextInput: bool = true
    
  let UselessString = ""
  drawText(getFpsA, 1, 1, 50, BLACK)
  if ifTextInput:
    discard textInputBox(Rectangle(
      x: (getCurrentScreenWidthFloat-textBoxWidth)/2, 
      y: (getCurrentScreenHeightFloat-textBoxHeight)/2, 
      width: textBoxWidth, 
      height: textBoxHeight),
  "", "Fixer", "this does nothing", textInput)
  #[if textBox(Rectangle(x: 200, y: 200, width: 400, height: 50), textInput, true):
    echo("a")]#
  if button(Rectangle(
  x: (getCurrentScreenWidthFloat-buttonWidth)/2,
  y: ((getCurrentScreenHeightFloat-buttonHeight)/4), 
  width:buttonWidth, 
  height:buttonHeight), "FIX"):
    let pkexecLaunch = startProcess("pkexec", args=["/usr/bin/ntfsfix","-d", textInput], options={poUsePath, poStdErrToStdOut})
