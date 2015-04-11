from flask import Flask, send_from_directory
from os import listdir
from random import choice

app = Flask(__name__)
app.debug = True

@app.route("/")
def meme():
    
    # randomly select URL from URLs.
    target_meme = choice(get_memes())
    
    # serve image.
    return send_from_directory('memes', target_meme)

@app.route("/submit")
def submitURL():
    return "Hello World!"

def get_memes():
    return listdir("./memes")

if __name__ == "__main__":
    app.run()
