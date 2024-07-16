import std.stdio;
import std.math;
import std.array;
import std.conv:to;

void main()
{
    // Crear un dataset
    double[][] X_train = [[1], [2], [3], [4], [5]]; // Lista de listas con valores de entrada
    double[] y_train = [10, 20, 30, 40, 50]; // Lista con valores objetivo

    // Variables para las sumas necesarias
    double suma_x = 0;     // Suma de los valores de X_train
    double suma_y = 0;     // Suma de los valores de y_train
    double suma_xy = 0;    // Suma de los productos de X_train y y_train
    double suma_x2 = 0;    // Suma de los cuadrados de los valores de X_train
    int n = to!int(X_train.length); // Número de observaciones en el conjunto de entrenamiento

    // Calcular las sumas necesarias
    foreach (i; 0 .. n) // Iterar sobre cada índice desde 0 hasta n-1
    {
        double x = X_train[i][0]; // Obtener el valor de entrada x en la posición i
        double y = y_train[i];    // Obtener el valor objetivo y en la posición i
        suma_x += x;              // Acumular el valor de x en suma_x
        suma_y += y;              // Acumular el valor de y en suma_y
        suma_xy += x * y;         // Acumular el producto de x y y en suma_xy
        suma_x2 += x * x;         // Acumular el cuadrado de x en suma_x2
    }

    // Calcular los coeficientes de la recta de regresión
    double beta1 = (n * suma_xy - suma_x * suma_y) / (n * suma_x2 - suma_x * suma_x); // Calcular la pendiente (beta1)
    double beta0 = (suma_y - beta1 * suma_x) / n; // Calcular la intersección (beta0)

    // Mostrar los coeficientes calculados
    writeln("Coeficientes calculados: beta0 = ", beta0, ", beta1 = ", beta1);

    // Realizar predicciones
    double[] X_test = [6, 7, 9]; // Lista de valores de entrada para predicción
    foreach (x; X_test) // Iterar sobre cada valor en X_test
    {
        double prediction = beta0 + beta1 * x; // Calcular la predicción usando la fórmula y = beta0 + beta1 * x
        writeln("Prediction for ", x, " is ", prediction); // Mostrar la predicción
    }
}
