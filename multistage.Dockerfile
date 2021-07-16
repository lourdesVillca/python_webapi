FROM python:3.8-slim AS run_test
WORKDIR /test

ENV VIRTUAL_ENV=venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PYTHONPATH "${PYTHONPATH}:/test"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN "pytest"


FROM python:3.7-slim
COPY --from=run_test /test /src
WORKDIR /src
ENV FLASK_APP=/src/api/app.py
ENV VIRTUAL_ENV=venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PYTHONPATH "${PYTHONPATH}:/src"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 9090
CMD [ "flask", "run", "--port=9090", "--host=0.0.0.0" ]
