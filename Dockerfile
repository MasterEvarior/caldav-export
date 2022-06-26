FROM python:3.10
WORKDIR /app
COPY requirements.txt .
COPY export.py .
RUN pip install -r requirements.txt

RUN apt-get update
RUN apt-get -y install cron
RUN crontab -l | { cat; echo "0 * * * * python /app/export.py"; } | crontab -
