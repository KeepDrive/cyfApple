from os import listdir, remove, rmdir
from PIL import Image, ImageDraw
import math

inFolder = "pngapple/"
outFolder = "Sprites/"
frames = sorted(listdir(inFolder))
screenSize = (640, 480)

bg = Image.new("RGBA", (screenSize[0] + 2, screenSize[1] + 2))
borderDrawer = ImageDraw.Draw(bg)
borderDrawer.line(((0, 0),(0, screenSize[1] + 1), (screenSize[0] + 1, screenSize[1] + 1), (screenSize[0] + 1, 0), (0, 0)), fill = (255, 255, 255, 255), width = 1)

deleteTempFrames = input("Would you like to delete temporary extracted frames?(y/n, say y if unsure): ") == 'y'

for i in range(math.ceil(len(frames)/4)):
    frame1 = Image.open(inFolder + frames[i * 4])
    frame2 = Image.open(inFolder + frames[i * 4 + 1])
    frame3 = Image.open(inFolder + frames[i * 4 + 2])
    frame4 = Image.open(inFolder + frames[i * 4 + 3])
    mergedFrame = Image.merge("RGBA", (frame1, frame2, frame3, frame4))
    endFrame = bg.copy()
    endFrame.paste(mergedFrame, (1, 1))
    endFrame.save(outFolder + str(i) + ".png")
    if deleteTempFrames:
        remove(inFolder + frames[i * 4])
        remove(inFolder + frames[i * 4 + 1])
        remove(inFolder + frames[i * 4 + 2])
        remove(inFolder + frames[i * 4 + 3])
    print("\rFrames %d-%d combined"%(i * 4, i * 4 + 3), end='')
if deleteTempFrames:
    rmdir(inFolder)
print()
