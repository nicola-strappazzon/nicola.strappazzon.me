## Entradas, salidas y error

standard

stdin

stdout

stderr

### Redirigir las salidas

### Combinar salidas

con los comandos

Esto hace referencia a los pipes | del bash

sera que aquí hay un limite en estas variables?

## Limitaciones

Los clientes, por alguna razón, tienen un limite de caracteres, en el caso de linux es 4k, en Mac 1K, hay que averiguar que es exactamente.

[https://unix.stackexchange.com/questions/643777/is-there-any-limit-on-line-length-when-pasting-to-a-terminal-in-linux](https://unix.stackexchange.com/questions/643777/is-there-any-limit-on-line-length-when-pasting-to-a-terminal-in-linux)

### Configurar el input

Para habilitar alfunas funciones importantes y configurar algunos keymaps básicos para aumentar la cómodidad a gusto, debemos editar el siguiente fichero `~/.inputrc` y agregar las siguientes líneas:

```bash
set completion-ignore-case On
set bell-style none
set input-meta on
set output-meta on
set convert-meta off

"\e[1;5D": backward-word
"\e[1;5C": forward-word
"\e\e[C": forward-word
"\e\e[D": backward-word
```

Expliquemos que significa cada una de estas opciones:

- La opción `completion-ignore-case` permite completar omitiendo las mayusculas y las minusculas.
- La opción `bell-style` desactiva el sonido de terminal, pero eso no desactiva el sonido del cliente cómo el de iTerm2.
- Las opciones ya definidas; `input-meta`, `output-meta` y `convert-meta` permite la entrada y salida de caracteres del encoding UTF-8 evitando la siguiente forma `$'\0123\0456'`.
- Las opciones `backward-word` y `forward-word` son para habilitar los atajos teclado que nos permite movernos entre palabras, **Ctrl+←** and **Ctrl+→** o con **Alt+← and Alt+→**.

Existen muchas más opciones, dejamos una lista de ellas por curiosidad:

```bash
# History
# -----------------------------------------------------------------------------
# Use more intelligent Up/Down behaviour: use the text that has already been
# typed as the prefix for searching through commands, like in Vim.
"\e[B": history-search-forward
"\e[A": history-search-backward

# Try to stay at the same the cursor position when moving through the history.
set history-preserve-point on

# Autocompletion
# -----------------------------------------------------------------------------
# Make Tab autocompletion case-insensitive (cd ~/dow<Tab> => cd ~/Downloads/).
set completion-ignore-case On

# When autocompleting symlinks to directories, immediately add a trailing "/".
set mark-symlinked-directories on

# Do not expand "~" to the home directory when completing. (The actual value
# passed on to the command still is expanded, though. Which is good.) "Off" is
# the default value, but some servers override this, so I override the override.
set expand-tilde off

# Flip through autocompletion matches with Shift-Tab.
"\e[Z": menu-complete

# Do not autocomplete hidden files ("dot files") unless the pattern explicitly
# begins with a dot.
set match-hidden-files off

# Show all autocomplete results at once.
set page-completions off

# If there are more than 200 possible completions for a word, ask to show them
# all.
set completion-query-items 200

# Immediately show all possible completions.
set show-all-if-ambiguous on

# Show extra file information when completing, like ls -F does.
set visible-stats on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Line editing
# -----------------------------------------------------------------------------
# Allow UTF-8 input and output, instead of showing them like $'\0123\0456'.
set input-meta on
set output-meta on
set convert-meta off

# Use Alt/Meta+Delete to delete the preceding word.
"\e[3;3~": kill-word

# Delete for wonky terminals.
"\e[3~": delete-char

# Use Ctrl+← and Ctrl+→ (or Alt/Meta, or Esc) to move between words.
"\e[1;5D": backward-word
"\e[1;3D": backward-word
"\e[5D": backward-word
"\e\e[D": backward-word
"\e[1;5C": forward-word
"\e[1;3C": forward-word
"\e[5C": forward-word
"\e\e[C": forward-word

# Miscellaneous
# -----------------------------------------------------------------------------
# Neither sound a beep nor flash the screen when trying to ring the bell.
set bell-style none
```
