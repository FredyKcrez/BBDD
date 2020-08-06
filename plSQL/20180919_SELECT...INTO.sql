SET SERVEROUTPUT ON;

DECLARE
    cantidad NUMBER;
    usuario NVARCHAR2(100);

BEGIN
    SELECT USER, COUNT(1) INTO usuario, cantidad FROM DUAL
    GROUP BY USER;

    DBMS_OUTPUT.PUT_LINE('Usuario: '|| usuario);
    DBMS_OUTPUT.PUT_LINE('Cantidad: '|| cantidad);
END;