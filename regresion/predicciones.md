# Documentación de Regresión Lineal en D

## Introducción

La regresión lineal es un método estadístico que se utiliza para modelar la relación entre una variable dependiente \( y \) y una o más variables independientes \( x \). La fórmula de la regresión lineal es:

\[ y = \beta_0 + \beta_1 x \]

Donde:
- \( y \) es la variable dependiente (lo que queremos predecir).
- \( x \) es la variable independiente (el valor de entrada).
- \( \beta_0 \) es la intersección con el eje y (el valor de \( y \) cuando \( x \) es 0).
- \( \beta_1 \) es la pendiente de la línea de regresión (cuánto cambia \( y \) por cada unidad que cambia \( x \)).

## Explicación del Código en D

```d
import dlib; // Importar la biblioteca dlib para algoritmos de aprendizaje automático
import std.stdio; // Importar la biblioteca para operaciones de entrada/salida

void main()
{
    // Crear un dataset de entrenamiento
    double[][] X_train = [[1], [2], [3], [4], [5]]; // Características de entrenamiento
    double[] y_train = [10, 20, 30, 40, 50]; // Etiquetas de entrenamiento

    // Crear un objeto de regresión lineal
    auto regressor = new dlib.TrainableLinearRegressor();

    // Entrenar el modelo con el dataset de entrenamiento
    regressor.train(X_train, y_train);

    // Realizar predicciones para los números 6, 7 y 8
    double[] X_test = [6, 7, 8]; // Características de prueba
    foreach (x; X_test) // Para cada valor en las características de prueba
    {
        double prediction = regressor.predict([x]); // Realizar predicción
        writeln("Prediction for ", x, " is ", prediction); // Imprimir el resultado
    }
}
