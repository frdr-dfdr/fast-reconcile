FROM python:3.7
WORKDIR /code

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libxslt-dev

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .

CMD ["gunicorn", "--bind","0.0.0.0:5000","wsgi:app"]
