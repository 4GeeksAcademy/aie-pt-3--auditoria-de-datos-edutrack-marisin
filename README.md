# 📊 Auditoría de Datos en EduTrack

## 🎯 Resumen del proyecto
Proyecto enfocado en realizar una revisión completa de la tabla `enrollments` antes de comenzar el ciclo de reportes. Para llevarlo a cabo, se utilizó **Supabase** como plataforma de base de datos para ejecutar el filtrado y análisis de los registros.

---

## 🛠️ Lo que se hizo (Resumen de tareas)
* **Configuración de la base de datos**
* **Consultas — Lectura y filtrado** (identificando progresos bajos, abandonos, instructores nulos y fechas recientes).
* **Consultas — Corrección de datos** (gestión de inserciones, actualizaciones y eliminaciones de cuentas de prueba `@test.com`)
* **Informe de análisis** (`analysis_report.md`) sustentado por las 12 queries recogidas en `queries.sql`

---

## 📂 Anexos

### Datos del estudiante a añadir
```sql
-- ============================================================
-- MISSING RECORD — read before writing the INSERT
-- ============================================================
-- During the migration from the previous system it was detected
-- that the following enrollment was confirmed by email but was
-- never recorded in the database:
--
--   student_id    : 3
--   student_name  : Lucia Fernandes
--   student_email : lucia.fernandes@student.edutrack.com
--   course_id     : 5
--   course_title  : Advanced Python
--   category      : Programming
--   enrollment_date      : 2025-04-01
--   completion_percentage: 0
--   passed               : false
--   monthly_fee_paid     : 69.99
--   instructor           : Carlos Vega
--
-- Your task: write the INSERT that adds this record with id = 18
-- ============================================================

### Estructura de Entregables

El proyecto consta de dos archivos principales ubicados en la raíz del repositorio

1. **`queries.sql`**: Archivo que contiene las **12 consultas SQL** ejecutadas y probadas en Supabase, divididas en las siguientes categorías:
   * Configuración de la base de datos y comprobaciones iniciales.
   * Lectura y filtrado de datos.
   * Corrección de datos (Mutaciones: `INSERT`, `UPDATE`, `DELETE`).
   * Agregación e informe de métricas.

2. **`analysis_report.md`**: Informe de análisis detallado en formato Markdown que documenta los resultados reales obtenidos de la ejecución de cada consulta para que el equipo de operaciones pueda consultarlas sin necesidad de ejecutar código SQL.

---
