+++
title = "Ejecutar consultas sin peligro en producción"
date = "2020-05-15"
draft = true
tags = ["mysql"]
+++

```sql
SET SQL_SAFE_UPDATES = 1;
SET SQL_SELECT_LIMIT = 1000;
SET MAX_JOIN_SIZE = 1000000;
```
