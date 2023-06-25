-- Table: public.tbtransferencias

-- DROP TABLE IF EXISTS public.tbtransferencias;

CREATE TABLE IF NOT EXISTS public.tbtransferencias
(
    idtransferencia serial,
    idretiro integer NOT NULL,
    iddeposito integer NOT NULL,
    importe numeric(11,2) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    CONSTRAINT tbtransferencias_pkey PRIMARY KEY (idtransferencia),
    CONSTRAINT fk_cuentadestino FOREIGN KEY (iddeposito)
        REFERENCES public.tbdepositos (iddeposito) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_cuentaorigen FOREIGN KEY (idretiro)
        REFERENCES public.tbretiros (idretiro) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbtransferencias
    OWNER to postgres;