# modelo.py
import joblib
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier

def entrenar_guardar_modelo():
    # Cargar el dataset Iris
    data = load_iris()
    X = data.data
    y = data.target

    # Entrenar el modelo RandomForest
    modelo = RandomForestClassifier()
    modelo.fit(X, y)

    # Guardar el modelo en un archivo
    joblib.dump(modelo, 'model.pkl')
    print("Modelo guardado como 'model.pkl'.")

# Llamar a la función para entrenar y guardar el modelo
if __name__ == "__main__":
    entrenar_guardar_modelo()
