from flask import Flask, send_from_directory, render_template, request 
from os import listdir
from random import choice
import urllib
from string import ascii_lowercase

app = Flask(__name__)
app.debug = True

@app.route("/")
def meme():
    
    # randomly select URL from URLs.
    target_meme = choice(get_memes())
    
    # serve image.
    return send_from_directory('memes', target_meme)

@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/submit", methods=["POST"])
def submit():
    if request.form["pass"] == "me2x":
        memeURL = request.form["url"]
        randname = "./memes/" + randomword(8) + ".jpeg"
        urllib.request.urlretrieve(memeURL, randname) 
        return "Meme submitted as: " + randname[8:]
    else:
        return "Setting Invalid, did you mean 'meme'?"

def get_memes():
    return listdir("./memes")

def randomword(length):
   return ''.join(choice(ascii_lowercase) for i in range(length))

if __name__ == "__main__":
    app.run()
