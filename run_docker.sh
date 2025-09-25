#!/bin/bash

set -e  # Detener el script en caso de error

IMAGE_NAME="iris-api"
CONTAINER_NAME="iris-api-container"
HOST_PORT=8000
CONTAINER_PORT=5000

echo "🔍 Verificando archivos esenciales..."
for file in Dockerfile requirements.txt app.py model.pkl; do
  if [ ! -f "$file" ]; then
    echo "❌ ERROR: No se encontró el archivo $file"
    exit 1
  fi
done

# Verificar si el contenedor ya existe y está corriendo
if [ "$(docker ps -q -f name=^/${CONTAINER_NAME}$)" ]; then
  echo "⚠️ El contenedor $CONTAINER_NAME ya está corriendo. Deteniéndolo..."
  docker stop $CONTAINER_NAME
  echo "🗑 Eliminando contenedor $CONTAINER_NAME..."
  docker rm $CONTAINER_NAME
fi

# Verificar si el contenedor existe pero está detenido
if [ "$(docker ps -aq -f status=exited -f name=^/${CONTAINER_NAME}$)" ]; then
  echo "🗑 Eliminando contenedor detenido $CONTAINER_NAME..."
  docker rm $CONTAINER_NAME
fi

echo "📦 Construyendo imagen Docker..."
docker build -t $IMAGE_NAME .

echo "🚀 Ejecutando contenedor..."
docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $CONTAINER_NAME $IMAGE_NAME

echo "⏳ Esperando 5 segundos para que la API arranque..."
sleep 5

echo "🔗 Probando la API con curl..."
if curl -X GET http://localhost:$HOST_PORT/; then
  echo "✅ API está corriendo correctamente en http://localhost:$HOST_PORT/"
else
  echo "❌ Falló la prueba GET"
  echo "📝 Mostrando últimos 20 logs del contenedor para debug:"
  docker logs --tail 20 $CONTAINER_NAME
  exit 1
fi

echo "📝 Mostrando últimos 20 logs del contenedor:"
docker logs --tail 20 $CONTAINER_NAME

echo "🧹 Limpiando contenedores detenidos huérfanos..."
docker container prune -f

echo "🧹 Limpiando imágenes dangling (sin tag)..."
docker image prune -f

echo "🚀 Proceso finalizado."
