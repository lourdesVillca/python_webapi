FROM python:3.8-slim-buster

WORKDIR /home/ubuntu/python_webapi
ENV VIRTUAL_ENV=venv_webapi
RUN python3 -m venv $VIRTUAL_ENV
ENV PYTHONPATH "${PYTHONPATH}:/home/ubuntu/python_webapi"

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 9090
ENTRYPOINT [ "flask" ]
CMD [ "run", "--port=9090", "--host=0.0.0.0" ]
