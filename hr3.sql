-- muestra valores antes y despues comparando la columna hire_date


SELECT  hire_date, last_name, 
        LAG(hire_date,1,null) OVER (ORDER BY hire_date) as "Proxima Contratado",
        LEAD(hire_date,1,null) OVER (ORDER BY hire_date)as "anterior contratado"
FROM    employees
ORDER BY hire_date;

SELECT last_name, hire_date, salary,
   LAG(salary, 1, 0) OVER (ORDER BY hire_date) AS prev_sal
   FROM employees
   WHERE job_id = 'PU_CLERK';
   
SELECT department_id,hire_date,last_name, LISTAGG(last_name, '; ') 
WITHIN GROUP (ORDER BY hire_date,last_name,department_id)
OVER (PARTITION BY department_id)
AS "empleados"
from EMPLOYEES 
group by department_id, hire_date, last_name;



-- inserte nuevo campo en tabla employees

INSERT INTO EMPLOYEES VALUES
(207,'Marcial Jose','Duran','marcialduran',213318,'08/12/16','IT_PROG',
32000,null,null,60);

update EMPLOYEES set last_name = 'Duran Salazar' where EMPLOYEE_ID=207;

--
SELECT last_name,department_id ,salary, last_VALUE(last_name) over (order by salary)
      last_person
FROM EMPLOYEES 
ORDER BY salary;

-- xml muestra el tipo de salida puede ser html, pdf ...
-- spool genera archivo de salida en la ruta .xml cambia segun formato 

spool c:\users\marcial\salida.xml
select /*xml*/* from EMPLOYEES

-- crear barras de resultado 
-- 'SQLDEV:GUAGE: VALOR MINIMO:VALOR MAXIMO:MINIMO%:MAXIMO%:' || nombre_tabla alias

SELECT  last_name, 'SQLDEV:GAUGE:1:32000:2500:8000:'|| salary barras, salary
FROM employees
ORDER BY salary desc;

