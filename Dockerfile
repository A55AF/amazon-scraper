FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

RUN mkdir app
WORKDIR /app
COPY . /app

ENV DEFAULT_COUNTRY=EG
EXPOSE 8000

# No browser needed — the scraper talks to Amazon over plain HTTP.
CMD ["python", "run.py"]
