ALTER TABLE TBCONFIGURACAO ADD COLUMN IF NOT EXISTS CONTEMPOEXTRAENTRELANCES BIGINT DEFAULT 0;
ALTER TABLE TBLICITACAO ADD COLUMN IF NOT EXISTS LICTEMPOEXTRAENTRELANCES BIGINT DEFAULT 0;
ALTER TABLE TBITEMLICITACAO ADD COLUMN IF NOT EXISTS ITETEMPOEXTRAENTRELANCES BIGINT DEFAULT 0;