FROM python:3.10-slim-buster
WORKDIR /app
COPY requirements.txt .
COPY main.py .
COPY model/condiciones_ambientales_gmm.joblib model/condiciones_ambientales_gmm.joblib
ENV PYTHONDONTWRITEBYTECODE 1
RUN pip install --upgrade pip \
    && pip install -r requirements.txt
ENTRYPOINT ["uvicorn"]
CMD ["main:app", "--host=0.0.0.0"]