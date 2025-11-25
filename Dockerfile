FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir rdflib==7.4.0 elasticsearch==9.2.0

COPY main.py .

CMD ["python", "main.py"]