+++
draft = false
title = 'Helix'
+++

La lista de [shortcuts/keymap](https://docs.helix-editor.com/keymap.html) oficial. Si quieres aprender de forma interactiva con un tutorial incorporado, debes escribir el siguiente comando `hx --tutor`.

## Modes

- Normal `Escape` Por defecto (moverte, seleccionar, operadores, etc.)
- Space `Space` Tambien llamado action, es un sitio para centralizar las acciones con menu ()
- Command `:` Para hacer uso de la línea de comandos (guardar, abrir, cerrar, configurar, etc.)

## Shortcuts

|Mode    |Key      |Description                                                              |
|--------|---------|-------------------------------------------------------------------------|
|Normal  | %       | Selecciona todo.                                                        |
|Normal  | >       | Indent.                                                                 |
|Normal  | <       | Unindent.                                                               |
|Normal  | u       | Undo.                                                                   |
|Normal  | x       | Selecciona una linea.                                                   |
|Normal  | y       | Yunk (Copy).                                                            |
|Normal  | p       | Paste.                                                                  |
|Normal  | r       | Replace char.                                                           |
|Normal  | d       | Delete.                                                                 |
|Normal  | i       | Insert mode.                                                            |
|Normal  | xd      | Selecciona, copia y elimina una linea.                                  |
|Normal  | gg      | Ir al inicio del fichero.                                               |
|Normal  | ge      | Ir al final del fichero.                                                |
|Normal  | gh      | Ir al inicio de la linea.                                               |
|Normal  | gl      | Ir al final de la linea.                                                |
|Normal  | gd      | Saltar a la definición de una función.                                  |
|Normal  | mimd    | Eliminar un texto entre comillas.                                       |
|Normal  | miw     | Selecciona una palabra.                                                 |
|Normal  | vgl     | Selecciona desde donde estas hasta el final de la linea.                |
|Normal  | vged    | Selecciona y elimina todo.                                              |
|Normal  | Ctrl-c  | Comentar/Descomentar.                                                   |
|Normal  | Ctrl-b  | Page Up.                                                                |
|Normal  | Ctrl-f  | Page Down.                                                              |
|Normal  | Shift-C | Multiline, seleccionar e ir bajando, precionas la tecla `,` para salir. |
|Normal  | f       | Abrir fichero.                                                          |
|Space   | s       | List variables or functions on document.                                |
|Space   | b       | Abrir ficheros abiertos.                                                |
|Space   | y       | Copia en el portapapeles del SO.                                        |
|Command | w       | Guardar cambios del fichero.                                            |
|Command | bc      | Cierra un fichero sin guardar y sin salir.                              |
|Command | reload  | Recarga el fichero abierto.                                             |
|Command | q       | Cierra.                                                                 |
|Command | wq      | Guarda y cierra.                                                        |
|Command | q!      | Cierra descartando cambios.                                             |

## Flujos

Aqui explico brevemente como usar los shortcuts para hacer cosas en particular.

### Buscar y reemplazar

Supongamos que quiere buscar una palabra que se repite en todo el fichero, y luego reemplazar por otra. Debes hacer lo siguiente.

1. `%` selecciona todo el archivo.
2. `s` abre el prompt de selección. Escribe la palabra (acepta regex) y pulsa Enter. Ahora tienes un cursor en cada coincidencia.
3. `c` escribe la palabra nueva y pulsa Esc.
4. `,` para salir del modo de selección.
