ALTER TABLE QUESTIONS DROP COLUMN SHORT_NAME;
ALTER TABLE QUESTIONS ADD COLUMN SHORT_NAME VARCHAR(50);
ALTER TABLE SURVEY_RESPONSE DROP COLUMN MULTI_SELECT_VALUE;

update DATABASE_VERSION set DATABASE_VERSION = 131 where DATABASE_VERSION = 132;
