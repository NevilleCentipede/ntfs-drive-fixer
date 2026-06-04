# ntfs-drive-fixer
a raygui program made in nim for fixing ntfs drives.
dependencies:
raygui, raylib, nim compiler
# how to compile :
1. do "nimble install https://github.com/planetis-m/naygui.git"
2. just run nim c main.nim
<img width="1016" height="815" alt="image" src="https://github.com/user-attachments/assets/ae3f43e2-684f-4daf-8610-a6818501ba78" />

what it really does : it is extremely simple. It runs pkexec /usr/bin/ntfsfix -d [YOUR INPUT]
