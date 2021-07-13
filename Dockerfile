FROM python:3.8-slim-buster

WORKDIR /home/ubuntu/python_webapi
ENV VIRTUAL_ENV=venv_webapi
ENV FLASK_APP=/home/ubuntu/python_webapi/api/app.py
RUN python3 -m venv $VIRTUAL_ENV
ENV PYTHONPATH "${PYTHONPATH}:/home/ubuntu/python_webapi"

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 9090
#WORKDIR /home/ubuntu/python_webapi/api
#ENTRYPOINT [ "flask" ]
CMD [ "flask", "run", "--port=9090", "--host=0.0.0.0" ]
