ALTER TABLE CURRENCY DROP COLUMN CURRENCY_CODE;

UPDATE DATABASE_VERSION SET DATABASE_VERSION = 163 WHERE DATABASE_VERSION = 164;