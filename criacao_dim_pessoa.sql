-- Table: public.dim_pessoa

-- DROP TABLE IF EXISTS public.dim_pessoa;

CREATE TABLE IF NOT EXISTS public.dim_pessoa
(
    sk_pessoa bigint NOT NULL DEFAULT nextval('dim_pessoa_sk_pessoa_seq'::regclass),
    version integer,
    etl_dt_inicio timestamp without time zone,
    etl_dt_fim timestamp without time zone,
    nk_pessoa integer,
    nome_completo character varying(50) COLLATE pg_catalog."default",
    genero character varying(9) COLLATE pg_catalog."default",
    cidade character varying(19) COLLATE pg_catalog."default",
    "região" character varying(8) COLLATE pg_catalog."default",
    estado character varying(14) COLLATE pg_catalog."default",
    altura double precision,
    altura_classe text COLLATE pg_catalog."default",
    peso double precision,
    tamanho_de_camisa text COLLATE pg_catalog."default",
    rem_em_dolar double precision,
    rem_em_real double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dim_pessoa
    OWNER to postgres;
-- Index: idx_dim_pessoa_lookup

-- DROP INDEX IF EXISTS public.idx_dim_pessoa_lookup;

CREATE INDEX IF NOT EXISTS idx_dim_pessoa_lookup
    ON public.dim_pessoa USING btree
    (nk_pessoa ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: idx_dim_pessoa_tk

-- DROP INDEX IF EXISTS public.idx_dim_pessoa_tk;

CREATE INDEX IF NOT EXISTS idx_dim_pessoa_tk
    ON public.dim_pessoa USING btree
    (sk_pessoa ASC NULLS LAST)
    TABLESPACE pg_default;