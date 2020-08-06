set serveroutput on;

DECLARE
    -- Definición de variables
    PI CONSTANT NUMBER := 3.1416;
    area NUMBER;
    radio NUMBER;
BEGIN
    radio := :dato;
    area := PI * (radio * radio);
    DBMS_OUTPUT.PUT_LINE( 'Area: ' || ROUND(area,2) || ' cm2' );
END;