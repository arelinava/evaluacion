
CREATE OR REPLACE FUNCTION public.fnoperacionescuenta(
	iopcion integer,
	cuenta numeric,
	importe numeric)
    RETURNS numeric(11,2)
AS $BODY$
DECLARE
	isaldocuenta numeric(11,2);
BEGIN
	--Deposito
	If iopcion = 1 THEN
		INSERT INTO tbdepositos VALUES(cuenta, importe, CURRENT_TIMESTAMP);	
	END if;
	--Retiro
	if iopcion = 2 THEN
		INSERT INTO tbretiros VALUES(cuenta, importe, CURRENT_TIMESTAMP);
	END if;
	
	SELECT fnsaldoactual(cuenta) INTO isaldocuenta;
	RETURN isaldocuenta;
END
$BODY$
    LANGUAGE 'plpgsql';

