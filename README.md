# API para detección de anomalías
Dado el modelo en scikit-learn en formato `joblib` junto con el valor de threshold, la API se encarga de reibir un
POST request con un conjunto de valores de [TEMPERATURA, HUMEDAD, LUMINOSIDAD] y decidir si es o no un valor fuera de lo
común, lo cual puede indicar una falla en los sensores.

## Correr en local
```
$ pip install -r requirements.txt
$ uvicorn main:app --host=0.0.0.0 --port=8000
```

## Correr en Docker
```
$ docker build -t anomaly_api .
$ docker run -p 8000:8000 --name anomaly_api anomaly_api
```

## Uso
Puede verse una documentación detallada en la ruta `/docs` (`localhost:8000/docs`)
se envia un POST request:
```
POST http://localhost:8000/api/predict
Content-Type: application/json

{
  "temp": 20,
  "hum": 45.6,
  "lum": 80
}
```
y se recibe una respuesta:
```
{
  "anomalia": false,
  "score": -3.6267431126844114
}
```
Si `anomalia == true` debería darse una alarma.