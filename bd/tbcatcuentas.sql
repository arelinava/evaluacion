-- Table: public.tbcuentas

-- DROP TABLE IF EXISTS public.tbcuentas;

CREATE TABLE IF NOT EXISTS public.tbcuentas
(
    keyx serial,
    numerocuenta numeric(6,0) NOT NULL,
    tipocuenta integer NOT NULL,
    cliente integer NOT NULL,
    fechaalta date NOT NULL,
    CONSTRAINT tbcuentas_pkey PRIMARY KEY (keyx),
    CONSTRAINT fk_cliente FOREIGN KEY (cliente)
        REFERENCES public.tbcatclientes (keyx) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbcuentas
    OWNER to postgres;