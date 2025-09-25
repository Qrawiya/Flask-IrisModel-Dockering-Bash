# Mini Proyecto: API REST para predicción de Iris con Flask

La Idea de este proyecto mas que el modelo en si, es lograr vizualizar el deploy de modelos a travez de FW como Flask 

Este es un proyecto de ejemplo que implementa una **API REST** utilizando **Flask** para hacer predicciones con un modelo de clasificación entrenado con el dataset **Iris**. El modelo utiliza el clasificador **RandomForestClassifier** de scikit-learn para predecir la clase de una flor de Iris en base a sus características.

## Descripción

La API permite hacer predicciones sobre el dataset Iris, el cual contiene datos sobre 150 flores de Iris. Las características de entrada son:
- Longitud del sépalo
- Anchura del sépalo
- Longitud del pétalo
- Anchura del pétalo

El modelo predice una de las tres clases:
- **0**: Setosa
- **1**: Versicolor
- **2**: Virginica

## Requisitos en el requirement.txt pero igual mas info aca

Docker: 28.4.0 (build d8eb465)

Python base image en Dockerfile: python:3.10-slim

Gunicorn: 20.1.0 (según logs del contenedor)

Flask: (No mencionaste versión explícita, pero probablemente una versión moderna compatible con Python 3.10)

joblib: (no especificada, usar la que tienes en requirements.txt)

NumPy: (igual, versión del requirements.txt)

Flask-CORS: (versión del requirements.txt)

## Instalación

### 1. Clona este repositorio:

```bash
git clone https://github.com/Qrawiya/iris-api-flask.git
cd iris-api-flask
