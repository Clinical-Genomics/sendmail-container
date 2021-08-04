FROM python:3.9-slim

LABEL base_image="python:3.9-slim"
LABEL about.home="https://github.com/Clinical-Genomics/sendmail-container"


ENV GUNICORN_WORKERS=1
ENV GUNICORN_THREADS=1
ENV GUNICORN_BIND="0.0.0.0:8000"
ENV GUNICORN_TIMEOUT=400

ENV EMAIL_HOST="localhost"
ENV EMAIL_HOST_URI="127.0.0.1"


WORKDIR /home/app
COPY . /home/app

# Install app requirements
RUN pip install -r requirements.txt

# Install app
RUN pip install -e .

CMD gunicorn \
    --workers=$GUNICORN_WORKERS \
    --bind=$GUNICORN_BIND  \
    --threads=$GUNICORN_THREADS \
    --timeout=$GUNICORN_TIMEOUT \
    --log-syslog \
    --access-logfile - \
    --log-level="debug" \
    --worker-class=uvicorn.workers.UvicornWorker \
    app:app