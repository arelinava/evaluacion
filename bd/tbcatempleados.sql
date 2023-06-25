-- Table: public.tbcatempleados

-- DROP TABLE IF EXISTS public.tbcatempleados;

CREATE TABLE IF NOT EXISTS public.tbcatempleados
(
    keyx serial,
    numeroempleado integer NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
    apellidopaterno character varying(50) COLLATE pg_catalog."default" NOT NULL,
    apellidomaterno character varying(50) COLLATE pg_catalog."default" NOT NULL,
    rfc character varying(13) COLLATE pg_catalog."default" NOT NULL,
    contrasena character varying(8) COLLATE pg_catalog."default" NOT NULL,
    rol integer NOT NULL DEFAULT 1,
    CONSTRAINT tbcatempleados_pkey PRIMARY KEY (numeroempleado),
	CONSTRAINT fk_rol FOREIGN KEY (rol)
        REFERENCES public.tbroles (idrol) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbcatempleados
    OWNER to postgres;