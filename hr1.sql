CREATE SEQUENCE seq_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10

select seq_id.currval from dual;

INSERT INTO Prueba (ID,nombre,apellido,edad)
VALUES (seq_id.nextval,'marcial','duran',35);

ALTER TABLE prueba
ADD PRIMARY KEY(id);

ALTER TABLE prueba
ADD CONSTRAINT id_pk PRIMARY KEY (ID);

ALTER TABLE PRUEBA
DROP PRIMARY KEY

ALTER TABLE PRUEBA
DROP CONSTRAINT id_pk;

drop table prueba;

CREATE TABLE prueba2 
  (
  persona_id INT , 
  Nombre VARCHAR2 (255) NOT NULL,
  Apellido VARCHAR2 (255),
  city VARCHAR2 (255) DEFAULT 'Buenos Aires',
  Direccion VARCHAR@(255),
  CONSTRAINT id_pk PRIMARY KEY (ID),
  CONSTRAINT id_chk CHECK (persona_id>0)
  );
  
ALTER TABLE prueba
MODIFY city DEFAULT 'Buenos Aires';

ALTER TABLE prueba
DROP COLUMN city DROP DEFAULT;

-- se crear secuencia que autoincrementa el valor de ID
CREATE SEQUENCE misecuencia
INCREMENT BY  10 
START WITH    120
MAXVALUE      9999
NOCACHE       
NOCYCLE;

DROP SEQUENCE seq_id;

create table secuencia
( id number primary key,
  col1 number);

INSERT INTO secuencia VALUES (misecuencia.nextval, 40);

SELECT * FROM secuencia;

--muestra el valor actual de la secuencia
SELECT misecuencia.currval from dual;

-- crear usuario debe crearce desde system

CREATE USER miusuario IDENTIFIED BY PASSWORD
GRANT CREATE SESSION TO miusuario;
GRANT CREATE TABLE TO miusuario;
GRANT CREATE VIEW TO miusuario;
GRANT CREATE ANY TRIGGER TO miusuario;
GRANT CREATE ANY PROCEDURE TO miusuario;
GRANT CREATE SEQUENCE TO miusuario;
GRANT CREATE SYNONYM TO miusuario;

-- ejemplo de creacion de una vista
CREATE VIEW empleados_depts AS
SELECT  first_name || ' '|| last_name as NOMBRE, department_name, city
FROM employees NATURAL JOIN departments
NATURAL JOIN locations;

select * from empleados_depts; -- se llama no la tabla si no la vista creada 

DROP VIEW  empleados_depts; -- eliminar esa vista creada

-- para modificar una vista ya creada
CREATE OR REPLACE VIEW empleados_depts AS
SELECT  first_name || ' '|| last_name as NOMBRE, department_name, city, country_name
FROM employees 
NATURAL JOIN departments
NATURAL JOIN countries
NATURAL JOIN locations;
