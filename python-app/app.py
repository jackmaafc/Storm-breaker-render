import sys
import time
from datetime import datetime
from flask import Flask, jsonify

app = Flask(__name__)
start_time = time.time()

@app.route('/')
def home():
    return jsonify({
        "status": "online",
        "language": "Python",
        "version": sys.version.split()[0],
        "framework": "Flask",
        "uptime_seconds": int(time.time() - start_time),
        "timestamp": datetime.utcnow().isoformat() + "Z"
    })

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)
