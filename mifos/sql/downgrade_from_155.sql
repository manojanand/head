
DELETE FROM SUPPORTED_LOCALE WHERE LOCALE_ID=2;
DELETE FROM LANGUAGE WHERE LANG_ID=2;
DELETE FROM LOOKUP_VALUE WHERE LOOKUP_ID = 190;
DELETE FROM COUNTRY WHERE COUNTRY_ID = 7;

UPDATE DATABASE_VERSION SET DATABASE_VERSION = 154 WHERE DATABASE_VERSION = 155;