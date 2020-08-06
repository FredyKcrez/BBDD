set SERVEROUTPUT on;

DECLARE
    -- Definición de arreglos
    TYPE alumnosArray IS VARRAY(5) OF NVARCHAR2(100);
    TYPE notasArray IS VARRAY(5) OF NUMBER;
    -- Uso de los arreglos
    alumnos alumnosArray;
    notas notasArray;
BEGIN
    alumnos := alumnosArray('Alex','Ana','Sue','Bea','Susy');
    notas := notasArray(90,85,70,59,66);
    
    DBMS_OUTPUT.PUT_LINE( 'Alumno : Nota' );
    
    FOR i IN 1..4 LOOP
        DBMS_OUTPUT.PUT_LINE( alumnos(i) || ' : ' || notas(i) );
    END LOOP;
END;