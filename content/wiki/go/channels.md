+++
draft = true
title = 'Channels'
weight = 0
+++

# Channels

Son pipes (tuberias) que permiten conectar varias partes del codigo

De esta forma lo declaramos channel con el tipo de dato string:

messages := make(chan string)

Asignando un valor:

messages <- "ping"

Recibiendo un valor:

msg := <-messages

chan <-          writing to channel (output channel)
<- chan          reading from channel (input channel)
chan             read from or write to channel (input/output channel)

<- a // read from channel a

func a(out chan<- int){close(out) out <-1} // sale de la funcion
func b(in <-chan int){} // entra en la funcion

los channel de lectura no se cierran.

Ejemplos:
https://www.sohamkamani.com/blog/2017/08/24/golang-channels-explained/
http://marcio.io/2015/07/handling-1-million-requests-per-minute-with-golang/
https://pragmacoders.com/multithreading-go-tutorial/
