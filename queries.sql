-- =====================================================================
-- CONSULTAS EJECUTADAS EN LA AUDITORÍA DE DATOS EduTrack
-- =====================================================================

-- 0. Comprobar que las bases de datos están correctamente configuradas y que las tablas contienen datos.
SELECT *
FROM enrollments
LIMIT 5;

SELECT *
FROM students
LIMIT 5;

SELECT *
FROM courses
LIMIT 5;

-- 1. Listar todas las inscripciones del curso 'Intro to Python', mostrando nombre del estudiante, email y porcentaje de completado.
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

-- 2. Obtener todas las inscripciones donde completion_percentage sea menor que 10 (posibles abandonos).
SELECT *
FROM enrollments
WHERE completion_percentage < 10; 

-- 3. Encontrar todas las inscripciones donde el campo instructor sea NULL.
SELECT *
FROM enrollments
WHERE instructor IS NULL;

-- 4. Listar los 5 estudiantes con mayor completion_percentage que todavía no han aprobado (passed = false).
SELECT student_name, completion_percentage, passed
FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5;

-- 5. Mostrar todas las inscripciones creadas en el último año, ordenadas por enrollment_date descendente.
SELECT * 
FROM enrollments
WHERE enrollment_date >= '2025-09-28'
ORDER BY enrollment_date DESC;

-- 6. INSERT del registro de inscripción faltante indicado en el brief.
INSERT INTO enrollments (id, student_id, student_name, student_email, course_id, course_title, category, enrollment_date, completion_percentage, passed, monthly_fee_paid, instructor)
VALUES (18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com', 5, 'Advanced Python', 'Programming', '2025-04-01', 0, FALSE, 69.99, 'Carlos Vega');

-- 7. UPDATE de todas las inscripciones donde instructor sea NULL - asignar el valor por defecto 'Pending assignment'.
-- (Nota previa: Se verificó cuántos registros existían con instructor IS NULL).
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

-- 8. DELETE - Eliminación de todas las inscripciones ligadas a las cuentas de prueba importadas (@test.com).
-- (Nota previa: Se confirmaron las filas afectadas con un SELECT previo).
DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';

-- 9. Contar el número de inscripciones agrupado por category.
SELECT category, COUNT(*) AS total
FROM enrollments
GROUP BY category
ORDER BY total DESC;

-- 10. Calcular el promedio de completion_percentage agrupado por course_title, ordenado de menor a mayor.
SELECT course_title, ROUND(AVG(completion_percentage), 2) AS Promedio
FROM enrollments
GROUP BY course_title 
ORDER BY Promedio ASC;

-- 11. Mostrar únicamente los cursos con más de 3 inscripciones (usar HAVING).
SELECT course_title, COUNT(*) AS total
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

-- 12. Calcular los ingresos totales (SUM de monthly_fee_paid) agrupados por category, ordenados de mayor a menor.
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;