FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/* && apt-get update && apt-get install -y libglib2.0-0 && apt-get update && apt-get install -y libsm6 libxext6 && apt-get update && apt-get install -y libxrender-dev 

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
