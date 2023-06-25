-- FUNCTION: public.fnoperacionescuenta(integer, numeric, numeric)

-- DROP FUNCTION IF EXISTS public.fnoperacionescuenta(integer, numeric, numeric);

CREATE OR REPLACE FUNCTION public.fnoperacionescuenta(
	iopcion integer,
	cuenta numeric,
	importe numeric)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
	isaldocuenta numeric(11,2);
BEGIN
	--Deposito
	If iopcion = 1 THEN
		INSERT INTO tbdepositos(idcuenta, importe, fecha) VALUES(cuenta, importe, CURRENT_TIMESTAMP);	
	END if;
	--Retiro
	if iopcion = 2 THEN
		INSERT INTO tbretiros(idcuenta, importe, fecha) VALUES(cuenta, importe, CURRENT_TIMESTAMP);
	END if;
	
	SELECT fnsaldoactual(cuenta) INTO isaldocuenta;
	RETURN isaldocuenta;
END
$BODY$;

ALTER FUNCTION public.fnoperacionescuenta(integer, numeric, numeric)
    OWNER TO postgres;
