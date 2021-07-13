import flask
from flask import jsonify
from objects.container_info import ContainerInfo

app = flask.Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return "<h1>Python Docker Web API</h1><p>Endpoint: /containerInfo</p>"

@app.route('/containerInfo', methods=['GET'])
def api_get_info():
    container_info = ContainerInfo()
    return jsonify(container_info.__dict__)

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404

app.run()