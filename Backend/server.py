from flask import Flask, send_from_directory
app = Flask(__name__)
app.debug = True
URLs = []

@app.route("/")
def meme():
    # randomly select URL from URLs.
    # load associated image.
    
    # serves image.
    return send_from_directory('memes','a.jpg')

@app.route("/submit")
def submitURL():
    return "Hello World!"

if __name__ == "__main__":
    app.run()

