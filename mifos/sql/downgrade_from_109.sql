DELETE FROM CONFIG_KEY_VALUE_INTEGER WHERE CONFIGURATION_KEY = 'sessionTimeout';
ALTER TABLE SYSTEM_CONFIGURATION ADD COLUMN SESSION_TIME_OUT SMALLINT AFTER OFFICE_ID;

/* restore the previous (though unused) value of session timeout for the existing row in this table */
UPDATE SYSTEM_CONFIGURATION SET SESSION_TIME_OUT = 1 WHERE OFFICE_ID = 1;

INSERT INTO SYSTEM_CONFIGURATION(OFFICE_ID,SESSION_TIME_OUT,SCHEDULE_MEETING_ON_HOLIDAY,DAYS_FOR_CAL_DEFINITION,NAME_SEQUENCE,BACK_DATED_TXN_ALLOWED,CENTER_HIERARCHY_EXIST,GROUP_CAN_APPLY_LOANS,CLIENT_CAN_EXIST_OUTSIDE_GROUP,NO_OF_INTEREST_DAYS)
VALUES(null,60,null,null,null,null,null,null,null,null);

UPDATE DATABASE_VERSION SET DATABASE_VERSION = 108 WHERE DATABASE_VERSION = 109;
