# Documentación de Regresión Lineal

## Introducción

La regresión lineal es una técnica estadística que intenta modelar la relación entre dos variables cuantitativas. Este modelo asume que la relación entre las variables es lineal, y busca ajustar una línea recta que minimice la suma de los errores al cuadrado entre los valores observados y los valores predichos.

## Ecuación de la Recta de Regresión

La línea de regresión se describe por la ecuación:


y = β₀ + β₁x
y: Variable dependiente (objetivo o respuesta)
x: Variable independiente (característica o predictor)
β₀: Intersección con el eje y
β₁: Pendiente de la línea
Cálculo de los Coeficientes
Para encontrar los valores óptimos de β₀ y β₁, se utilizan las siguientes fórmulas de mínimos cuadrados:

plaintext
Copiar código
β₁ = (n ∑(xᵢ yᵢ) - ∑xᵢ ∑yᵢ) / (n ∑(xᵢ²) - (∑xᵢ)²)
β₀ = (∑yᵢ - β₁ ∑xᵢ) / n
Derivación de las Fórmulas
Sumas Necesarias:

∑xᵢ: Suma de todos los x
∑yᵢ: Suma de todos los y
∑(xᵢ yᵢ): Suma de productos de cada xᵢ y yᵢ
∑(xᵢ²): Suma de los cuadrados de cada xᵢ
Cálculo de β₁:

plaintext
Copiar código
β₁ = (n ∑(xᵢ yᵢ) - ∑xᵢ ∑yᵢ) / (n ∑(xᵢ²) - (∑xᵢ)²)
Cálculo de β₀:

plaintext
Copiar código
β₀ = (∑yᵢ - β₁ ∑xᵢ) / n
Ejemplo
Supongamos que tenemos los siguientes datos de entrenamiento:

plaintext
Copiar código
X_train = [1, 2, 3, 4, 5]
y_train = [10, 20, 30, 40, 50]
Sumas:

∑xᵢ: 1 + 2 + 3 + 4 + 5 = 15
∑yᵢ: 10 + 20 + 30 + 40 + 50 = 150
∑(xᵢ yᵢ): 1*10 + 2*20 + 3*30 + 4*40 + 5*50 = 550
∑(xᵢ²): 1² + 2² + 3² + 4² + 5² = 55
Cálculo de β₁:

plaintext
Copiar código
β₁ = (5 * 550 - 15 * 150) / (5 * 55 - 15²) = (2750 - 2250) / (275 - 225) = 500 / 50 = 10
Cálculo de β₀:

plaintext
Copiar código
β₀ = (150 - 10 * 15) / 5 = (150 - 150) / 5 = 0
La ecuación de la recta de regresión es:

plaintext
Copiar código
y = 0 + 10x
Esto significa que la pendiente es 10 y la intersección es 0. La línea de regresión predice que por cada incremento de 1 en x, y aumentará en 10.

Pseudocódigo
plaintext
Copiar código
function linearRegression(X_train, y_train):
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
    print("Prediction for", x, "is", prediction)
