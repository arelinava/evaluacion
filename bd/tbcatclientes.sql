-- Table: public.tbcatclientes

-- DROP TABLE IF EXISTS public.tbcatclientes;

CREATE TABLE IF NOT EXISTS public.tbcatclientes
(
    keyx serial,
    usuarioid integer NOT NULL,
    numerocliente integer NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
    apellidopaterno character varying(50) COLLATE pg_catalog."default" NOT NULL,
    apellidomaterno character varying(50) COLLATE pg_catalog."default" NOT NULL,
    nip character varying(4) COLLATE pg_catalog."default" NOT NULL,
    fechaalta date NOT NULL,
    fechabaja date NOT NULL,
    CONSTRAINT tbcatclientes_pkey PRIMARY KEY (keyx)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tbcatclientes
    OWNER to postgres;