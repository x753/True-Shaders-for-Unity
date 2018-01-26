# True-Shaders-for-Unity
A pack including several experimental Unity shaders that allow you to see objects through walls and more

Here are a couple experimental shaders I made, along with an effect prefab and example scenes.
This is my first time playing around with shaders, but I tried to leave some comments in the .shader files.

trueColor:
- Able to be seen through walls
- Tint Color can be changed
- Alpha can be changed

halfColor:
- CANNOT be seen through walls
- same as trueColor

trueLit:
- Able to be seen through walls
- Full brightness
- Able to apply textures
- Blocks trueColor shader

halfLit:
- CANNOT be seen through walls
- same as trueLit

trueSight:
- Ignores trueColor shader

trueImage:
- Able to be seen through walls
- Displays any image in an absolute position on the screen

trueScroll:
- Simple scrolling texture, adjustable X/Y speeds
- Supports transparency

These effects can be combined with other shaders, feel free to open up the files and experiment with the code.
