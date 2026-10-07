# Estrategia inicial de pruebas — EcoTrack (solución de referencia)

**Equipo:** Docente
**Metodología:** Scrum, sprints de una semana
**Fecha:** 04/09/2026

## Alcance de este esquema

Historias cubiertas:

1. Entrar con correo `@utez.edu.mx`.
2. Registrar agua en litros y luz en kWh.
3. Ver el historial del propio laboratorio y si se acerca a la meta semanal.

## Esquema

| Historia | Qué se comprueba | Tipo | Criterio de aprobación | Archivo (Unidad III) |
|---|---|---|---|---|
| Registrar consumo | Rechazar litros ≤ 0 | Unitaria | La regla devuelve un mensaje de error para 0 y para -3. | `test/unitaria/reglas_test.dart` |
| Registrar consumo | Rechazar litros sobre el tope | Unitaria | Con 10 000.5 L la regla devuelve error. | `test/unitaria/reglas_test.dart` |
| Entrar | Correo institucional | Unitaria | `20233tn001@utez.edu.mx` se acepta; `ana@gmail.com` y `@utez.edu.mx` se rechazan. | `test/unitaria/reglas_test.dart` |
| Ver meta | Umbral de “se acerca” | Unitaria | Con meta de 100 L, 80 L responde sí y 79 L responde no. | `test/unitaria/reglas_test.dart` |
| Registrar consumo | Mensaje visible y botón que no avanza | Interfaz | Con litros vacíos se lee “Escribe los litros” y la pantalla de resumen no aparece. | `test/interfaz/registro_page_test.dart` |
| Registrar consumo | Resumen con los datos capturados | Interfaz | Con 12.5 L y 3 kWh aparece el resumen y muestra 12.5. | `test/interfaz/registro_page_test.dart` |
| Registrar consumo | Guardar y verlo en el historial | Integración | Tras confirmar, el historial lista laboratorio, litros y kWh de esa captura. | `integration_test/guardar_y_ver_historial_test.dart` |

## Qué queda fuera

- Ranking entre laboratorios: el cliente lo pidió, pero no está en el sprint.
- Lectura automática de medidores: depende de hardware que no tenemos.
- “Que se vea bonita”: no tiene criterio de sí o no.