ALTER TABLE HOLIDAY ADD COLUMN HOLIDAY_CHANGES_APPLIED_FLAG SMALLINT DEFAULT 1;

update DATABASE_VERSION set DATABASE_VERSION = 122 where DATABASE_VERSION = 121;
