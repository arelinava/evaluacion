
CREATE OR REPLACE FUNCTION fntransferencia(
	cuentaorigen integer,
	cuentadestino integer,
	importe numeric(11,2)
)
RETURNS TABLE (saldocuentaorigen numeric(11,2), saldocuentadestino numeric(11,2))
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
		INSERT INTO tbretiros VALUES(cuentaorigen, importe, CURRENT_TIMESTAMP);
		SELECT fnsaldoactual(cuentaorigen) INTO isaldocuenta;
		SELECT MAX(idretiro) INTO iretiro FROM tbretiros WHERE cuenta = cuentaorigen;
		
		INSERT INTO tbdepositos VALUES(cuentadestino, importe, CURRENT_TIMESTAMP);
		SELECT fnsaldoactual(cuentadestino) INTO isaldocuentadestino;
		SELECT MAX(iddeposito) INTO ideposito FROM tbdepositos WHERE cuenta = cuentadestino;
		
		INSERT INTO tbtransferencias VALUES(iretiro, ideposito, importe, CURRENT_TIMESTAMP);
		INSERT INTO tmp_saldo VALUES(isaldocuenta, isaldocuentadestino);
		
	RETURN QUERY SELECT * FROM tmp_saldo;
END
$BODY$;


