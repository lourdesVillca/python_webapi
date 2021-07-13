FROM python:3.8-slim-buster
WORKDIR /home/ubuntu/app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 9000
ENTRYPOINT["python"]
CMD ["/api/web_api.py"]