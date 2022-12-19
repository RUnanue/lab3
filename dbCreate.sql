-- Table: public.habilidad

-- DROP TABLE IF EXISTS public.habilidad;

CREATE TABLE IF NOT EXISTS public.habilidad
(
    id integer NOT NULL,
    nombre character varying(40) COLLATE pg_catalog."default",
    descripcion character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT habilidad_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.habilidad
    OWNER to postgres;



-- Table: public.institucion

-- DROP TABLE IF EXISTS public.institucion;

CREATE TABLE IF NOT EXISTS public.institucion
(
    id integer NOT NULL,
    nombre character varying(40) COLLATE pg_catalog."default",
    direccion character varying(40) COLLATE pg_catalog."default",
    CONSTRAINT institucion_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.institucion
    OWNER to postgres;



-- Table: public.estado_tarea

-- DROP TABLE IF EXISTS public.estado_tarea;

CREATE TABLE IF NOT EXISTS public.estado_tarea
(
    id integer NOT NULL,
    estado character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT estado_tarea_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.estado_tarea
    OWNER to postgres;



-- Table: public.tarea

-- DROP TABLE IF EXISTS public.tarea;

CREATE TABLE IF NOT EXISTS public.tarea
(
    id integer NOT NULL,
    nombre character varying(40) COLLATE pg_catalog."default",
    descripcion character varying(100) COLLATE pg_catalog."default",
    id_emergencia character varying(100) COLLATE pg_catalog."default",
    id_estado_tarea integer,
    CONSTRAINT tarea_pkey PRIMARY KEY (id),
    CONSTRAINT fk_tarea_estado_tarea FOREIGN KEY (id_estado_tarea)
        REFERENCES public.estado_tarea (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tarea
    OWNER to postgres;



-- Table: public.eme_habilidad

-- DROP TABLE IF EXISTS public.eme_habilidad;

CREATE TABLE IF NOT EXISTS public.eme_habilidad
(
    id integer NOT NULL,
    id_emergencia character varying(100) COLLATE pg_catalog."default",
    id_habilidad integer,
    CONSTRAINT eme_habilidad_pkey PRIMARY KEY (id),
    CONSTRAINT fk_eme_habilidad_habilidad FOREIGN KEY (id_habilidad)
        REFERENCES public.habilidad (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.eme_habilidad
    OWNER to postgres;



-- Table: public.tarea_habilidad

-- DROP TABLE IF EXISTS public.tarea_habilidad;

CREATE TABLE IF NOT EXISTS public.tarea_habilidad
(
    id integer NOT NULL,
    id_tarea integer,
    id_eme_habilidad integer,
    CONSTRAINT tarea_habilidad_pkey PRIMARY KEY (id),
    CONSTRAINT fk_tarea_habilidad_eme_habilidad FOREIGN KEY (id_eme_habilidad)
        REFERENCES public.eme_habilidad (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_tarea_habilidad_tarea FOREIGN KEY (id_tarea)
        REFERENCES public.tarea (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tarea_habilidad
    OWNER to postgres;



-- Table: public.ranking

-- DROP TABLE IF EXISTS public.ranking;

CREATE TABLE IF NOT EXISTS public.ranking
(
    id integer NOT NULL,
    id_voluntario character varying(100) COLLATE pg_catalog."default",
    id_tarea integer,
    puntaje integer,
    CONSTRAINT ranking_pkey PRIMARY KEY (id),
    CONSTRAINT fk_ranking_tarea FOREIGN KEY (id_tarea)
        REFERENCES public.tarea (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ranking
    OWNER to postgres;

