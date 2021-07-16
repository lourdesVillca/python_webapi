import json
import pytest

from api.app import app


def test_get_container_info():
    response = app.test_client().get('/containerInfo');
    assert response.status_code == 200


def test_status_code_page_not_found():
    response = app.test_client().get('/containerInfo656');
    assert response.status_code == 404


def test_message_page_not_found():
    response = app.test_client().get('/containerInfo656');
    message = response.data.decode('utf8')
    assert message == "<h1>404</h1><p>The resource could not be found.</p>"
