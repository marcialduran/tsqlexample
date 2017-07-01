SELECT * from jobs
WHERE MIN_SALARY >10000;

SELECT first_name, TO_CHAR(hire_date,'yyyy') as ingreso FROM EMPLOYEES
WHERE to_char(hire_date,'yyyy') BETWEEN '2002' and '2005'
order by 2; 

SELECT first_name, hire_date FROM EMPLOYEES
WHERE to_char(hire_date,'yyyy') BETWEEN 2002 and 2005
order by 2;

SELECT first_name, hire_date FROM EMPLOYEES
WHERE job_id in ('IT_PROG', 'SA_MAN')
order by 2;

SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 150 OR EMPLOYEE_ID = 160;
-- WHERE EMPLOYEE_ID IN (150,16O); otra forma de hacerlo

SELECT job_title,(max_salary - min_salary)as diferencia from jobs
where MAX_SALARY BETWEEN 10000 and 20000;

-- redondear salaria a millares
SELECT first_name, salary, round(salary,-3) from EMPLOYEES;

-- mostrar fisrt_name, fecha de ingreso y el primer dia del siguiente mes a la 
--fecha de ingreso

SELECT first_name, hire_date, last_day(hire_date)+1 from employees;

-- a#os de experiencia de empleados
SELECT first_name, hire_date, floor((sysdate-hire_date)/365.25)as exp from employees;

-- mostrar fist_name, last_name despues de convertir la primera letra a mayuscula

SELECT INITCAP(first_name),INITCAP( last_name)
FROM employees
where rownum < 5;

-- funcion LTRIM y RTRIM

SELECT LTRIM('Buenos Dias','Buenos')
FROM dual;

SELECT RTRIM('Buenos Dias','Dias')
FROM dual;

--eliminar la M de la cadena y la convertir esa la primera letra en MAYUSC 
SELECT TRIM( 'M' from (initcap('marcial'))) from dual;

-- union first(convertirlo a minusc y eliminar 'e') con last name(convertido a mayusc)  

select concat(ltrim(lower(first_name),'e') ,upper((last_name))) as prueba
from employees;

-- funcion to_number
select to_number(salary, '99999.99') from employees;

--funcion ADD_MONTHS  el valor 1 indica el incremento

SELECT ADD_MONTHS ( '04-ABRIL-1981', 1) FROM DUAL;

SELECT hire_date, ADD_MONTHS (Hire_date,1)as aumento_mes FROM employees; 

-- funcion MONTHS_BETWEEN

SELECT  MONTHS_BETWEEN('01-NOVIEMBRE-2016','01-DICIEMBRE-2016') FROM dual;

-- Funcion NEXT_DAY muestra el siguiente dia en este caso lunes 

SELECT hire_date,NEXT_DAY(hire_date,'lunes') FROM EMPLOYEES;


-- funcion last_day ultimo dia del mes

SELECT hire_date, LAST_DAY (hire_date) FROM EMPLOYEES;

SELECT DISTINCT( CEIL(salary)) FROM EMPLOYEES;

SELECT MOD (7,4) FROM DUAL;

SELECT CEIL(11/4) FROM DUAL;

-- muestra la suma de todos los salarios que tengan el mismodeparment_id
SELECT  department_id,last_name,salary, 
        SUM(salary) OVER(PARTITION BY department_id)
        CUMULATIVE_SALARY
FROM    employees
ORDER BY 1; 

--DENSE_RANK

SELECT DENSE_RANK(9000, .05) WITHIN GROUP 
   (ORDER BY salary DESC, commission_pct) "Dense Rank" 
   FROM employees ;
   
   
/* selects the department name, employee name, and salary of all employees who work 
--in the human resources or purchasing department, and then computes a rank for each 
--unique salary in each of the two departments. The salaries that are equal receive 
the same rank. */ 
SELECT  d.department_name, e.last_name, e.salary, DENSE_RANK() 
OVER (PARTITION BY e.department_id ORDER BY e.salary ) as drank
FROM EMPLOYEES e, DEPARTMENTS d 
where e.department_id = d.department_id 
and d.department_id in ('30','40')
order by drank;

-- otro ejemplo
SELECT department_id,last_name,salary, DENSE_RANK() OVER
      (ORDER BY salary ) ranking 
FROM employees WHERE department_id = 50;




