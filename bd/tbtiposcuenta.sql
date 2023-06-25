-- Table: public.tbtiposcuenta

-- DROP TABLE IF EXISTS public.tbtiposcuenta;

CREATE TABLE IF NOT EXISTS public.tbtiposcuenta
(
    idtipocuenta serial,
    descripcion character varying(50) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbtiposcuenta
    OWNER to postgres;