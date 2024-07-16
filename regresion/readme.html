<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Documentación de Regresión Lineal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1, h2, h3 {
            color: #333;
        }
        code {
            background-color: #eee;
            padding: 2px 4px;
            font-family: monospace;
        }
        pre {
            background-color: #eee;
            padding: 10px;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <h1>Documentación de Regresión Lineal</h1>

    <h2>Introducción</h2>
    <p>La regresión lineal es una técnica estadística que intenta modelar la relación entre dos variables cuantitativas. Este modelo asume que la relación entre las variables es lineal, y busca ajustar una línea recta que minimice la suma de los errores al cuadrado entre los valores observados y los valores predichos.</p>

    <h2>Ecuación de la Recta de Regresión</h2>
    <p>La línea de regresión se describe por la ecuación:</p>
    <p><code>y = β₀ + β₁x</code></p>
    <ul>
        <li><code>y</code>: Variable dependiente (objetivo o respuesta)</li>
        <li><code>x</code>: Variable independiente (característica o predictor)</li>
        <li><code>β₀</code>: Intersección con el eje y</li>
        <li><code>β₁</code>: Pendiente de la línea</li>
    </ul>

    <h2>Cálculo de los Coeficientes</h2>
    <p>Para encontrar los valores óptimos de <code>β₀</code> y <code>β₁</code>, se utilizan las siguientes fórmulas de mínimos cuadrados:</p>
    <p><code>β₁ = (n ∑(xᵢ yᵢ) - ∑xᵢ ∑yᵢ) / (n ∑(xᵢ²) - (∑xᵢ)²)</code></p>
    <p><code>β₀ = (∑yᵢ - β₁ ∑xᵢ) / n</code></p>

    <h2>Derivación de las Fórmulas</h2>
    <p>1. Sumas Necesarias:</p>
    <ul>
        <li><code>∑xᵢ</code>: Suma de todos los <code>x</code></li>
        <li><code>∑yᵢ</code>: Suma de todos los <code>y</code></li>
        <li><code>∑(xᵢ yᵢ)</code>: Suma de productos de cada <code>xᵢ</code> y <code>yᵢ</code></li>
        <li><code>∑(xᵢ²)</code>: Suma de los cuadrados de cada <code>xᵢ</code></li>
    </ul>

    <p>2. Cálculo de <code>β₁</code>:</p>
    <p><code>β₁ = (n ∑(xᵢ yᵢ) - ∑xᵢ ∑yᵢ) / (n ∑(xᵢ²) - (∑xᵢ)²)</code></p>

    <p>3. Cálculo de <code>β₀</code>:</p>
    <p><code>β₀ = (∑yᵢ - β₁ ∑xᵢ) / n</code></p>

    <h2>Ejemplo</h2>
    <p>Supongamos que tenemos los siguientes datos de entrenamiento:</p>
    <pre><code>X_train = [1, 2, 3, 4, 5]
y_train = [10, 20, 30, 40, 50]</code></pre>

    <p>1. Sumas:</p>
    <ul>
        <li><code>∑xᵢ = 1 + 2 + 3 + 4 + 5 = 15</code></li>
        <li><code>∑yᵢ = 10 + 20 + 30 + 40 + 50 = 150</code></li>
        <li><code>∑(xᵢ yᵢ) = 1*10 + 2*20 + 3*30 + 4*40 + 5*50 = 550</code></li>
        <li><code>∑(xᵢ²) = 1² + 2² + 3² + 4² + 5² = 55</code></li>
    </ul>

    <p>2. Cálculo de <code>β₁</code>:</p>
    <p><code>β₁ = (5 * 550 - 15 * 150) / (5 * 55 - 15²) = (2750 - 2250) / (275 - 225) = 500 / 50 = 10</code></p>

    <p>3. Cálculo de <code>β₀</code>:</p>
    <p><code>β₀ = (150 - 10 * 15) / 5 = (150 - 150) / 5 = 0</code></p>

    <p>Así, la ecuación de la recta de regresión es:</p>
    <p><code>y = 0 + 10x</code></p>
    <p>Esto significa que la pendiente es 10 y la intersección es 0. La línea de regresión predice que por cada incremento de 1 en <code>x</code>, <code>y</code> aumentará en 10.</p>

    <h2>Pseudocódigo</h2>
    <pre><code>function linearRegression(X_train, y_train):
    n = length(X_train)  # Número de observaciones
    suma_x = 0
    suma_y = 0
    suma_xy = 0
    suma_x2 = 0

    # Calcular las sumas necesarias
    for i from 0 to n-1:
        x = X_train[i][0]
        y = y_train[i]
        suma_x += x
        suma_y += y
        suma_xy += x * y
        suma_x2 += x * x

    # Calcular los coeficientes de la recta de regresión
    beta1 = (n * suma_xy - suma_x * suma_y) / (n * suma_x2 - (suma_x)^2)
    beta0 = (suma_y - beta1 * suma_x) / n

    return beta0, beta1

# Entrenamiento del modelo
X_train = [[1], [2], [3], [4], [5]]
y_train = [10, 20, 30, 40, 50]
beta0, beta1 = linearRegression(X_train, y_train)

# Realizar predicciones
X_test = [6, 7, 8]
for x in X_test:
    prediction = beta0 + beta1 * x
    print("Prediction for", x, "is", prediction)</code></pre>

    <h2>Implementación en D</h2>
    <pre><code>import dlib;

void main()
{
    // Crear un dataset
    double[][] X_train = [[1], [2], [3], [4], [5]];
    double[] y_train = [10, 20, 30, 40, 50];

    // Crear un objeto de regresión lineal
    auto regressor = new dlib.TrainableLinearRegressor();

    // Entrenar el modelo
    regressor.train(X_train, y_train);

    // Realizar predicciones
    double[] X_test = [6, 7, 8];
    foreach (x; X_test)
    {
        double prediction = regressor.predict([x]);
        writeln("Prediction for ", x, " is ", prediction);
    }
}</code></pre>
</body>
</html>
