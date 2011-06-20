Thank you for choosing Lukeminer.
The license for this project and it's source code can be viewed in LICENSE.txt.
--------------------------------------
Keyboard Shortcuts:
WASD/Arrows - move around the map.

IJKL/Mouse over the top,left,botom, and right of the screen - rotate/turn the camera.

SPACE/LEFT CLICK - Delete the block the mouse is over.

RIGHT CLICK - Add a block of the currently selected type to the location your mouse is pointing to.

ESCAPE - Quit.

Left CTRL and Right CTRL - switch between block types

Left ALT and Right ALT - switch between block sets
--------------------------------------
This project and all of it's source code are licensed under the GNU GPLv2 License.

Lukeminer v0xxx - "Alpha"

Thanks and have fun!
-Luke

--------------------------------------




DEVELOPERS ONLY




--------------------------------------
To change the tileset, make a new 50x50 texure, and a 50x50 image to represent the texture.
Open blocks(and the number of the blockset).dat in your favorite text editor, and append to it a newline & the path/filename to the texture for the top,
newline & the path/filename to the texture for the sides,
newline & path/filename to the texture for the bottom,
then a newline & the path/filename to the image to represent the texture.
You also must place 'transparent' (all lower case, no quotes) for the block to be transparent, or 'not' for it to not be transparent.
Either transparent or not must reside after the block defn. unless you want a Memory Access Violation error.

The splash screen can be changed by modifying splash.jpg.
Also, to change the background, modify sky.jpg keeping the original image dimensions.