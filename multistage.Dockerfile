FROM python:3.8-slim AS compile-image
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc
WORKDIR /python_webapi
ENV VIRTUAL_ENV=venv_webapi
RUN python3 -m venv $VIRTUAL_ENV
ENV PYTHONPATH "${PYTHONPATH}:/python_webapi"
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .


FROM python:3.7-slim AS build-image
COPY --from=compile-image /venv_webapi /venv_webapi

# Make sure we use the virtualenv:
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
EXPOSE 9090
CMD [ "flask", "run", "--port=9090", "--host=0.0.0.0" ]