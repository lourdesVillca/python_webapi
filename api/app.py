import flask
from flask import jsonify
from objects.container_info import ContainerInfo

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return "<h1>Python Docker Web API</h1><p>Endpoint: /containerInfo</p>"

@app.route('/containerInfo', methods=['GET'])
def get_container_info():
    container_information = ContainerInfo()
    return jsonify(container_information.__dict__), 200

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404

if __name__ == '__main__':
    app.run(host="0.0.0.0")
