# app.py
from flask import Flask, request, jsonify
import joblib
import numpy as np

# Inicializar la aplicación Flask
app = Flask(__name__)

# Cargar el modelo entrenado
modelo = joblib.load('model.pkl')

@app.route('/')
def home():
    return "API lista"

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Obtener los datos de la solicitud
        data = request.get_json()

        # Validar que la clave 'features' esté presente
        if 'features' not in data:
            return jsonify({'error': 'Missing "features" in request'}), 400
        
        features = data['features']

        # Validar que las características sean una lista numérica de 4 elementos
        if not isinstance(features, list) or len(features) != 4 or not all(isinstance(i, (int, float)) for i in features):
            return jsonify({'error': 'Features should be a list of 4 numeric values'}), 400

        # Convertir la lista a un array numpy
        features_array = np.array(features).reshape(1, -1)

        # Realizar la predicción
        prediction = modelo.predict(features_array)

        # Devolver la clase predicha
        return jsonify({'prediction': int(prediction[0])})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
