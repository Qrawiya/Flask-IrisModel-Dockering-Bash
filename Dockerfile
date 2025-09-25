# Usamos una imagen base oficial de Python 3.10 slim para una imagen ligera
FROM python:3.10-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo requirements.txt al contenedor
COPY requirements.txt .

# Instalamos las dependencias definidas en requirements.txt sin usar caché para ahorrar espacio
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código fuente al contenedor
COPY app.py .
COPY modelo.py .

# Ejecutamos el script para entrenar y guardar el modelo (model.pkl se generará aquí)
RUN python modelo.py

# Indicamos que la aplicación escuchará en el puerto 5000 (interno del contenedor)
EXPOSE 5000

# Comando para ejecutar la aplicación usando Gunicorn en producción
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "--workers", "2", "app:app"]

