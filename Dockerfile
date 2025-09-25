# Imagen base
FROM python:3.9-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY app.py .
COPY model.pkl .
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto por donde corre Flask
EXPOSE 5000

# Ejecuta la API
CMD ["python", "app.py"]
