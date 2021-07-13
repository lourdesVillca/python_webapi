# python_webapi
PYTHON - REST API with Flask

## Steps to create the image:
- Clone the repository
- Build the docker image
```
docker build -t python_webapi:v0.1 .
```
- Run the container
```
docker run -d --restart always --name python_webapi -p 9191:9090 python_webapi:v0.1
```

