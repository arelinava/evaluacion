CREATE OR REPLACE FUNCTION public.fnoperacionesempleados(
	iopcion integer,
	inumempleado integer,
	snombre character varying,
	sappaterno character varying,
	sapmaterno character varying,
	sdireccion character varying,
	scodigopostal character varying,
	stelefono character varying,
	scurp character varying,
	snss character varying,
	ipuesto integer,
	scausabaja character varying)
    RETURNS TABLE(tnumempleado integer, tnombre character varying, tappaterno character varying, tapmaterno character varying, tdireccion character varying, tcodigopostal character varying, ttelefono character varying, tcurp character varying, tnss character varying, tdescripcionpuesto character varying, testatus integer, tmensaje character varying) 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE
	tmp_resultado record;
	iestatusresultado integer;
	smensaje character varying;
	
BEGIN
	If iopcion = 1 then
		if (SELECT COUNT(numeroempleado) tbcatempleadosprueba WHERE numeroempleado = iNumEmpleado) == 0 then
			INSERT INTO tbcatempleadosprueba VALUES(iNumEmpleado, sNombre, sApPaterno, sApMaterno, sDireccion, sCodigoPostal, sCurp,sNss, iPuesto, CURRENT_DATE, '1900-01-01', 1, '');
			iestatusresultado = 1;
			imensaje = 'Empleado ' + numeroempleado + ' registrado exitosamente.';
		ELSE
			iestatusresultado = -1;
			imensaje = 'Empleado ' + numeroempleado + ' ya se encuentra registrado.';
		END if;
		
		/*FOR tmp_resultado in
					SELECT numeroempleado
					   , nombre
					   , apellidopaterno
					   , apellidomaterno
					   , direccion
					   , codigopostal
					   , telefono 
					   , curp
					   , nss
					   , puestos.descripcion
					   , iestatusresultado
					   , imensaje
				   FROM tbcatempleadosprueba empleados 
				   inner join tbcatpuestoprueba puestos on empleados.puesto = puestos.idpuesto 
				   WHERE numeroempleado = iNumEmpleado
		LOOP*/
		INSERT INTO tmp_resultado SELECT numeroempleado
								   , nombre
								   , apellidopaterno
								   , apellidomaterno
								   , direccion
								   , codigopostal
								   , telefono 
								   , curp
								   , nss
								   , puestos.descripcion
								   , iestatusresultado
								   , imensaje
								   FROM tbcatempleadosprueba empleados 
								   inner join tbcatpuestoprueba puestos on empleados.puesto = puestos.idpuesto 
								   WHERE numeroempleado = iNumEmpleado;
	END if;
	
	
	RETURN QUERY SELECT * FROM tmp_resultado;
END
$BODY$;

ALTER FUNCTION public.fnoperacionesempleados(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, integer, character varying)
    OWNER TO postgres;