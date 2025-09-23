# Mini Proyecto: API REST para predicción de Iris con Flask

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

## Requisitos

- Python 3.x
- Flask
- scikit-learn
- joblib

## Instalación

### 1. Clona este repositorio:

```bash
git clone https://github.com/Qrawiya/iris-api-flask.git
cd iris-api-flask
