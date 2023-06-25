-- Table: public.tbretiros

-- DROP TABLE IF EXISTS public.tbretiros;

CREATE TABLE IF NOT EXISTS public.tbretiros
(
    idretiro serial,
    idcuenta integer NOT NULL,
    importe numeric(11,2) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    CONSTRAINT tbretiros_pkey PRIMARY KEY (idretiro),
    CONSTRAINT fk_cuenta FOREIGN KEY (idcuenta)
        REFERENCES public.tbcuentas (keyx) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbretiros
    OWNER to postgres;