
CREATE OR REPLACE FUNCTION fnsaldoactual(icuenta integer)
RETURNS numeric(11,2) AS 
$BODY$
DECLARE
	isaldocuenta numeric(11,2);
	totaldepositos numeric(11,2);
	totalretiros numeric(11,2);
BEGIN
	SELECT SUM(Importe) INTO totaldepositos FROM dtdepositos WHERE cuenta = icuenta;
	SELECT SUM(Importe) INTO totalretiros FROM dtretiros WHERE cuenta = icuenta;
	
	isaldocuenta = (totaldepositos - totalretiros);
	return isaldocuenta;
END
$BODY$
LANGUAGE plpgsql;
