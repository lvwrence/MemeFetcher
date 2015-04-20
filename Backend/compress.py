# module for compressing images to apple watch display size (312 x 390)
# require Pillow module

import PIL
from PIL import Image
def compress(image_url, new_name): #eg 'full_image.jpg'
    basewidth = 300
    img = Image.open(image_url)
    wpercent = (basewidth / float(img.size[0]))
    hsize = int((float(img.size[1]) * float(wpercent)))
    img = img.resize((basewidth, hsize), PIL.Image.ANTIALIAS)
    img.save(new_name + '.jpg')

if __name__ == "__main__":
    compress("meme.jpeg", "new")
