+++
draft = true
title = 'Pointers'
weight = 0
+++

# Golang / Pointer

## ¿Porque usarlos?

Si tenemos una variable llamada alpha que contiene un dato que ocupa 1Mb, y esta variable la pasamos a una función que internamente se llama omega se debe duplicar el contenido de la variable, y pasamos a tener la misma variable en dos sitios (alpha y omega) diferentes que ocupa 2Mb en total. Si usamos los punteros, podemos optimizar el uso de la memoria de otra forma, la variable original llamada alpha que se debe pasar a una función mediante una variable omega que se le asignará el valor de un puntero "que apunta a la variable alpha” entonces solo ocupamos 1 Mb y ahorramos CPU y Memoria en cada copia.

Ventajas

- Optimización del uso de la memoria y de la CPU.
- Mas eficiencia para el garbage-collector.
Simbolos

El & delante del nombre de la variable (&a) se usa para recuperar la dirección donde se almacena el valor de esta variable. Esa dirección es lo que el puntero va a almacenar.
* delante de un nombre del tipo de dato (*INT), significa que la variable declarada almacenará una dirección de otra variable de ese tipo (no un valor de ese tipo).
func (l *Items)
func Load() *Items {
var items *Items
type data struct {
	Files    []*models.ModelsFileEntry  `json:"files"`
}
* frente a una variable de tipo puntero (*c)  se utiliza para recuperar un valor almacenado en una dirección determinada. En Go speak esto se le llama "dereferencing”.
for _, i := range *l {
len(*l)
(*l)[itemIndex].Key
*l = append(*l, m)
Así se imprime la dirección de un puntero:

*[]Person        // pointer to slice
[]*Person        // slice of pointers
