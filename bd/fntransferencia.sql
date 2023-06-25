-- FUNCTION: public.fntransferencia(integer, integer, numeric)

-- DROP FUNCTION IF EXISTS public.fntransferencia(integer, integer, numeric);

CREATE OR REPLACE FUNCTION public.fntransferencia(
	cuentaorigen integer,
	cuentadestino integer,
	importe numeric)
    RETURNS TABLE(saldocuentaorigen numeric, saldocuentadestino numeric) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
	tmp_saldo record;
	isaldocuenta numeric(11,2);
	isaldocuentadestino numeric(11,2);
	iretiro integer;
	ideposito integer;
BEGIN
		INSERT INTO tbretiros(idcuenta, importe, fecha) VALUES(cuentaorigen, importe, CURRENT_TIMESTAMP);
		SELECT fnsaldoactual(cuentaorigen) INTO isaldocuenta;
		SELECT MAX(idretiro) INTO iretiro FROM tbretiros WHERE cuenta = cuentaorigen;
		
		INSERT INTO tbdepositos(idcuenta, importe, fecha) VALUES(cuentadestino, importe, CURRENT_TIMESTAMP);
		SELECT fnsaldoactual(cuentadestino) INTO isaldocuentadestino;
		SELECT MAX(iddeposito) INTO ideposito FROM tbdepositos WHERE cuenta = cuentadestino;
		
		INSERT INTO tbtransferencias(idretiro,iddeposito, importe, fecha) VALUES(iretiro, ideposito, importe, CURRENT_TIMESTAMP);
		INSERT INTO tmp_saldo VALUES(isaldocuenta, isaldocuentadestino);
		
	RETURN QUERY SELECT * FROM tmp_saldo;
END
$BODY$;

ALTER FUNCTION public.fntransferencia(integer, integer, numeric)
    OWNER TO postgres;
