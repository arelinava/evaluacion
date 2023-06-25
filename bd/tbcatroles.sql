-- Table: public.tbcatroles

-- DROP TABLE IF EXISTS public.tbcatroles;

CREATE TABLE IF NOT EXISTS public.tbroles
(
    idrol serial,
    descripcion character varying(50) NOT NULL,
	PRIMARY KEY(idrol)
);