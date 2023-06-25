-- Table: public.tbdepositos

-- DROP TABLE IF EXISTS public.tbdepositos;

CREATE TABLE IF NOT EXISTS public.tbdepositos
(
    iddeposito integer NOT NULL DEFAULT nextval('tbdepositos_iddeposito_seq'::regclass),
    idcuenta integer NOT NULL,
    importe numeric(11,2) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    CONSTRAINT tbdepositos_pkey PRIMARY KEY (iddeposito),
    CONSTRAINT fk_cuenta FOREIGN KEY (idcuenta)
        REFERENCES public.tbcuentas (keyx) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbdepositos
    OWNER to postgres;