CREATE TABLE IF NOT EXISTS PUBLIC.TBCONFIGURACAO (
	CONCODIGO BIGINT NOT NULL,
	CONENVIARLANCEVLRMINIMO BOOLEAN DEFAULT FALSE,
	CONPERCENTUALMEEPP DECIMAL(3,2),
	CONCOLUNASEQUENCIA SMALLINT,
	CONCOLUNADESCRICAO SMALLINT,
	CONCOLUNAVALORMINIMO SMALLINT,
	CONCOLUNAVARIACAOINI SMALLINT,
	CONCOLUNAVARIACAOFIM SMALLINT,
	CONQUATROCASASDECIMAIS BOOLEAN DEFAULT FALSE,
	CONTIPOREDUCAO SMALLINT DEFAULT 0,
	CONVALORREDUCAOINI DECIMAL(15,4) DEFAULT 0.01,
	CONVALORREDUCAOFIM DECIMAL(15,4) DEFAULT 0.01,
	CONCOLUNATIPOREDUCAO SMALLINT,
	CONINICIOENVIOLANCES SMALLINT,
	CONDISPUTAMEEPP BOOLEAN DEFAULT FALSE,
	CONSTRAINT CONFIGURACAO_PK PRIMARY KEY (CONCODIGO)
);
CREATE UNIQUE INDEX IF NOT EXISTS PRIMARY_KEY_CF ON PUBLIC.TBCONFIGURACAO (CONCODIGO);

CREATE TABLE IF NOT EXISTS PUBLIC.TBCONFIGURACAOARREMATE (
	CARNAOMOSTARINFORMACOESHARDWARE BOOLEAN,
	CARLEMBRARDADOSACESSO BOOLEAN DEFAULT FALSE NOT NULL,
	CARUSUARIOACESSO VARCHAR,
	CARSENHAACESSO VARCHAR
);

CREATE TABLE IF NOT EXISTS PUBLIC.TBPORTAL (
	PORCODIGO SMALLINT NOT NULL,
	PORDESCRICAO VARCHAR,
	PORSTATUS SMALLINT,
	CONSTRAINT TBPORTAL_PK PRIMARY KEY (PORCODIGO)
);

CREATE TABLE IF NOT EXISTS PUBLIC.TBEMPRESA (
	EMPCNPJ BIGINT NOT NULL,
	EMPNOME VARCHAR NOT NULL,
	EMPLOGIN VARCHAR NOT NULL,
	EMPSENHA VARCHAR NOT NULL,
	EMPATIVO BOOLEAN NOT NULL,
	PORCODIGO SMALLINT DEFAULT 1 NOT NULL,
	EMPCERTIFICADO VARCHAR,
	EMPDATACERTIFICADO TIMESTAMP,
	EMPPORTE INTEGER,
	EMPPFX VARCHAR,
	EMPPFXCODIGO VARCHAR,
	EMPPFXSENHA VARCHAR,
	SSC BOOLEAN,
	CONSTRAINT TBEMPRESA_PK PRIMARY KEY (EMPCNPJ,PORCODIGO),
	CONSTRAINT TBPORTAL_TBEMPRESA_FK FOREIGN KEY (PORCODIGO) REFERENCES PUBLIC.TBPORTAL(PORCODIGO) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX IF NOT EXISTS TBPORTAL_TBEMPRESA_FK_INDEX_8 ON PUBLIC.TBEMPRESA (PORCODIGO);

CREATE TABLE IF NOT EXISTS PUBLIC.TBLICITACAO (
	EMPCNPJ BIGINT NOT NULL,
	LICCODIGO INTEGER NOT NULL,
	LICNUMERO VARCHAR(50) NOT NULL,
	LICUASG INTEGER NOT NULL,
	LICUASGNOME VARCHAR(300) NOT NULL,
	LICSRP BOOLEAN NOT NULL,
	LICOCULTA BOOLEAN DEFAULT FALSE,
	LICVALORREDUCAOINI DECIMAL(15,4) DEFAULT 0.01 NOT NULL,
	LICVALORREDUCAOFIM DECIMAL(15,4) DEFAULT 0.01 NOT NULL,
	LICQUATROCASASDECIMAIS BOOLEAN DEFAULT FALSE NOT NULL,
	LICDATAABERTURA TIMESTAMP,
	LICTIPOREDUCAO SMALLINT DEFAULT 0,
	LICINICIOENVIOLANCES SMALLINT,
	PORCODIGO SMALLINT DEFAULT 1 NOT NULL,
	LICDISPUTAMEEPP BOOLEAN,
	LICCRITERIO VARCHAR,
	LICHASH VARCHAR,
	LICDATAENCERRAMENTO TIMESTAMP,
	LICENVIARLANCEVLRMINIMO BOOLEAN,
	LICTIPOAPURACAO SMALLINT,
	LICENVIALANCEINICIODISPUTA BOOLEAN,
	LICICMS BOOLEAN DEFAULT FALSE,
	LICENVIARLANCEVIRADAMINUTO BOOLEAN,
	LICCOBRIRLANCEVIRADAMINUTO BOOLEAN,
	CONSTRAINT TBLICITACAO_PK PRIMARY KEY (LICCODIGO,EMPCNPJ,PORCODIGO),
	CONSTRAINT TBEMPRESA_TBLICITACAO_FK FOREIGN KEY (EMPCNPJ,PORCODIGO) REFERENCES PUBLIC.TBEMPRESA(EMPCNPJ,PORCODIGO) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX IF NOT EXISTS TBEMPRESA_TBLICITACAO_FK_INDEX_1 ON PUBLIC.TBLICITACAO (EMPCNPJ,PORCODIGO);

CREATE TABLE IF NOT EXISTS PUBLIC.TBITEMLICITACAO (
	EMPCNPJ BIGINT NOT NULL,
	LICCODIGO INTEGER NOT NULL,
	ITECODIGO BIGINT NOT NULL,
	ITEGRUPO VARCHAR(15),
	ITENUMERO INTEGER NOT NULL,
	ITEDESCRICAO VARCHAR(500) NOT NULL,
	ITEQUANTIDADE VARCHAR(50) NOT NULL,
	ITEVALORUNITARIO DECIMAL(50,4),
	ITEVALORTOTAL DECIMAL(50,4),
	ITEVALORMINIMO DECIMAL(50,4),
	ITEMEEPP BOOLEAN DEFAULT FALSE,
	ITEVALORREDUCAOINI DECIMAL(15,4),
	ITEVALORREDUCAOFIM DECIMAL(15,4),
	ITECODIGOGRUPO BIGINT,
	ITETIPOREDUCAO SMALLINT DEFAULT 0,
	PORCODIGO SMALLINT DEFAULT 1 NOT NULL,
	ITEPOSICAO SMALLINT DEFAULT 999,
	ITETIPO SMALLINT DEFAULT 0,
	ITEVALORMINIMOENTREPROPRIOLANCE DECIMAL(15,4),
	ITEVALORMINIMOENTREMELHORLANCE DECIMAL(15,4),
	ITETEMPOMINIMOENTRELANCES BIGINT DEFAULT 0 NOT NULL,
	ITEDISPUTAMEEPP BOOLEAN,
	ITESTATUSLANCE SMALLINT,
	ITESITUACAO VARCHAR,
	ITEMELHORLANCE DECIMAL(15,4),
	ITEULTIMOLANCE DECIMAL(15,4),
	ITEITENSGRUPO VARCHAR,
	ITEENVIARLANCEVLRMINIMO BOOLEAN DEFAULT FALSE,
	ITEVENCEDORCNPJ VARCHAR,
	ITEVENCEDORNOMEEMPRESA VARCHAR,
	ITEVENCEDORMARCA VARCHAR,
	ITEVENCEDORFABRICANTE VARCHAR,
	ITEPERCENTUALMINIMOENTRELANCE DECIMAL(15,4),
	ITEQUATROCASAS BOOLEAN,
	ITEINICIOENVIOLANCES SMALLINT,
	ITEEQUALIZACAO DECIMAL(15,4),
	ITEENVIARLANCEVIRADAMINUTO BOOLEAN,
	ITECOBRIRLANCEVIRADAMINUTO BOOLEAN,
	CONSTRAINT TBITEMLICITACAO_PK PRIMARY KEY (ITECODIGO,LICCODIGO,EMPCNPJ,PORCODIGO),
	CONSTRAINT TBLICITACAO_TBITEMLICITACAO_FK FOREIGN KEY (LICCODIGO,EMPCNPJ,PORCODIGO) REFERENCES PUBLIC.TBLICITACAO(LICCODIGO,EMPCNPJ,PORCODIGO) ON DELETE CASCADE ON UPDATE RESTRICT
);
CREATE INDEX IF NOT EXISTS TBLICITACAO_TBITEMLICITACAO_FK_INDEX_9 ON PUBLIC.TBITEMLICITACAO (LICCODIGO,EMPCNPJ,PORCODIGO);



