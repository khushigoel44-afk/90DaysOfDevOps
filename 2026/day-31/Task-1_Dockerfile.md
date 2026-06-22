FROM ubuntu

WORKDIR /app

RUN echo "curl installing..."

RUN apt-get update && apt-get install curl -y

CMD ["echo","Hello from my custom image!"]