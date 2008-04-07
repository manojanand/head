# altered the table to add the below columns to improve search
ALTER TABLE CUSTOMER ADD COLUMN FIRST_NAME VARCHAR(200) NULL;
ALTER TABLE CUSTOMER ADD COLUMN LAST_NAME VARCHAR(200) NULL;
ALTER TABLE CUSTOMER ADD COLUMN SECOND_LAST_NAME VARCHAR(200) NULL;


UPDATE CUSTOMER C,customer_name_detail CN SET C.FIRST_NAME =(Select CN.FIRST_NAME from customer_name_detail CN where CN.CUSTOMER_ID = C.CUSTOMER_ID and CN.NAME_TYPE = 3) where  C.CUSTOMER_ID = CN.CUSTOMER_ID ;

UPDATE CUSTOMER C,customer_name_detail CN SET C.LAST_NAME =(Select CN.LAST_NAME from customer_name_detail CN where CN.CUSTOMER_ID = C.CUSTOMER_ID and CN.NAME_TYPE = 3) where  C.CUSTOMER_ID = CN.CUSTOMER_ID ;

UPDATE CUSTOMER C,customer_name_detail CN SET C.SECOND_LAST_NAME =(Select CN.SECOND_LAST_NAME from customer_name_detail CN where CN.CUSTOMER_ID = C.CUSTOMER_ID and CN.NAME_TYPE = 3) where  C.CUSTOMER_ID = CN.CUSTOMER_ID ;

# altered the column name appropriately
ALTER TABLE LOAN_ACCOUNT CHANGE COLUMN INTEREST_RATE_AMOUNT INTEREST_RATE DECIMAL(13, 10);

ALTER TABLE LOAN_ACCOUNT DROP FOREIGN KEY loan_account_ibfk_5;
ALTER TABLE LOAN_ACCOUNT DROP COLUMN INTEREST_RATE_CURRENCY_ID;

ALTER TABLE CUSTOMER_POSITION MODIFY VERSION_NO INTEGER NOT NULL;

# added the following tables to split the schedules into separate tables for loan, #savings,customer
CREATE TABLE CUSTOMER_SCHEDULE(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  ACCOUNT_ID INTEGER NOT NULL,
  CUSTOMER_ID INTEGER NOT NULL,
  CURRENCY_ID SMALLINT NULL,
  ACTION_DATE DATE NULL,
    MISC_FEES DECIMAL(10,3) NULL,
  MISC_FEES_CURRENCY_ID SMALLINT NULL,
  
  MISC_FEES_PAID DECIMAL(10,3) NULL,
  MISC_FEES_PAID_CURRENCY_ID SMALLINT NULL,
  
  MISC_PENALTY DECIMAL(10,3) NULL,
  MISC_PENALTY_CURRENCY_ID SMALLINT NULL,
  
  MISC_PENALTY_PAID DECIMAL(10,3) NULL,
  MISC_PENALTY_PAID_CURRENCY_ID SMALLINT NULL,
  
  PAYMENT_STATUS SMALLINT NOT NULL,
  INSTALLMENT_ID SMALLINT NOT NULL,
  PAYMENT_DATE DATE NULL,
  PARENT_FLAG SMALLINT NULL,
  VERSION_NO INTEGER NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY(ACCOUNT_ID)
    REFERENCES ACCOUNT(ACCOUNT_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
 FOREIGN KEY(CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(CUSTOMER_ID)
    REFERENCES CUSTOMER(CUSTOMER_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
TYPE=InnoDB CHARACTER SET utf8

AS SELECT ID, ACCOUNT_ID, CUSTOMER_ID, CURRENCY_ID, ACTION_DATE, MISC_FEES, MISC_FEES_CURRENCY_ID, MISC_FEES_PAID, MISC_FEES_PAID_CURRENCY_ID, MISC_PENALTY, MISC_PENALTY_CURRENCY_ID, MISC_PENALTY_PAID, MISC_PENALTY_PAID_CURRENCY_ID, PAYMENT_STATUS, INSTALLMENT_ID, PAYMENT_DATE, PARENT_FLAG, VERSION_NO FROM ACCOUNT_ACTIONS_DATE WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM CUSTOMER_ACCOUNT);



CREATE TABLE LOAN_SCHEDULE(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  ACCOUNT_ID INTEGER NOT NULL,
  CUSTOMER_ID INTEGER NOT NULL,
  CURRENCY_ID SMALLINT NULL,
  ACTION_DATE DATE NULL,
  
  PRINCIPAL DECIMAL(10, 3) NOT NULL,
  PRINCIPAL_CURRENCY_ID SMALLINT NULL,
  
  INTEREST DECIMAL(10, 3) NOT NULL,
  INTEREST_CURRENCY_ID SMALLINT NULL,
  
  PENALTY DECIMAL(10, 3) NOT NULL,
  PENALTY_CURRENCY_ID SMALLINT NULL,
  
  MISC_FEES DECIMAL(10,3) NULL,
  MISC_FEES_CURRENCY_ID SMALLINT NULL,
  
  MISC_FEES_PAID DECIMAL(10,3) NULL,
  MISC_FEES_PAID_CURRENCY_ID SMALLINT NULL,
  
  MISC_PENALTY DECIMAL(10,3) NULL,
  MISC_PENALTY_CURRENCY_ID SMALLINT NULL,
  
  MISC_PENALTY_PAID DECIMAL(10,3) NULL,
  MISC_PENALTY_PAID_CURRENCY_ID SMALLINT NULL,
  
  PRINCIPAL_PAID DECIMAL(10,3) NULL,
  PRINCIPAL_PAID_CURRENCY_ID SMALLINT NULL,
  
  INTEREST_PAID DECIMAL(10,3) NULL,
  INTEREST_PAID_CURRENCY_ID SMALLINT NULL,
  
  PENALTY_PAID DECIMAL(10,3) NULL,
  PENALTY_PAID_CURRENCY_ID SMALLINT NULL,
  
  PAYMENT_STATUS SMALLINT NOT NULL,
  INSTALLMENT_ID SMALLINT NOT NULL,
  PAYMENT_DATE DATE NULL,
  PARENT_FLAG SMALLINT NULL,
  VERSION_NO INTEGER NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY(ACCOUNT_ID)
    REFERENCES ACCOUNT(ACCOUNT_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
 FOREIGN KEY(CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
       
  FOREIGN KEY(PRINCIPAL_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(INTEREST_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(PENALTY_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(MISC_FEES_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(MISC_FEES_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(MISC_PENALTY_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(PRINCIPAL_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(INTEREST_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(PENALTY_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,

  FOREIGN KEY(MISC_PENALTY_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  
  FOREIGN KEY(CUSTOMER_ID)
    REFERENCES CUSTOMER(CUSTOMER_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
TYPE=InnoDB CHARACTER SET utf8

AS SELECT  ID ,  ACCOUNT_ID,  CUSTOMER_ID, CURRENCY_ID, ACTION_DATE, PRINCIPAL, PRINCIPAL_CURRENCY_ID , INTEREST, INTEREST_CURRENCY_ID, PENALTY, PENALTY_CURRENCY_ID, MISC_FEES, MISC_FEES_CURRENCY_ID, MISC_FEES_PAID,  MISC_FEES_PAID_CURRENCY_ID, MISC_PENALTY, MISC_PENALTY_CURRENCY_ID,  MISC_PENALTY_PAID,  MISC_PENALTY_PAID_CURRENCY_ID, PRINCIPAL_PAID, PRINCIPAL_PAID_CURRENCY_ID,
INTEREST_PAID, INTEREST_PAID_CURRENCY_ID, PENALTY_PAID, PENALTY_PAID_CURRENCY_ID, 
PAYMENT_STATUS , INSTALLMENT_ID, PAYMENT_DATE, PARENT_FLAG, VERSION_NO  FROM ACCOUNT_ACTIONS_DATE WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM LOAN_ACCOUNT);


CREATE TABLE SAVING_SCHEDULE (
  ID INTEGER NOT NULL AUTO_INCREMENT,
  ACCOUNT_ID INTEGER NOT NULL,
  CUSTOMER_ID INTEGER NOT NULL,
  CURRENCY_ID SMALLINT NULL,
  ACTION_DATE DATE NULL,
  DEPOSIT DECIMAL(10, 3) NOT NULL,
  DEPOSIT_CURRENCY_ID SMALLINT NULL,
  DEPOSIT_PAID DECIMAL(10,3) NULL,
  DEPOSIT_PAID_CURRENCY_ID SMALLINT NULL,
  PAYMENT_STATUS SMALLINT NOT NULL,
  INSTALLMENT_ID SMALLINT NOT NULL,
  PAYMENT_DATE DATE NULL,
  PARENT_FLAG SMALLINT NULL,
  VERSION_NO INTEGER NOT NULL,
  PRIMARY KEY(ID),
  FOREIGN KEY(ACCOUNT_ID)
    REFERENCES ACCOUNT(ACCOUNT_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
 FOREIGN KEY(CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(DEPOSIT_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(DEPOSIT_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(CUSTOMER_ID)
    REFERENCES CUSTOMER(CUSTOMER_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
TYPE=InnoDB CHARACTER SET utf8
 
AS SELECT ID, ACCOUNT_ID, CUSTOMER_ID,  CURRENCY_ID, ACTION_DATE, DEPOSIT, DEPOSIT_CURRENCY_ID, DEPOSIT_PAID, DEPOSIT_PAID_CURRENCY_ID, PAYMENT_STATUS, INSTALLMENT_ID, PAYMENT_DATE, PARENT_FLAG, VERSION_NO FROM ACCOUNT_ACTIONS_DATE WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM SAVINGS_ACCOUNT); 


CREATE TABLE LOAN_FEE_SCHEDULE (
  ACCOUNT_FEES_DETAIL_ID INTEGER NOT NULL AUTO_INCREMENT,
  ID INTEGER NOT NULL,
  INSTALLMENT_ID INTEGER NOT NULL,
  FEE_ID SMALLINT NOT NULL,
  ACCOUNT_FEE_ID INTEGER NOT NULL,  
  AMOUNT DECIMAL(10, 3) NULL,
  AMOUNT_CURRENCY_ID SMALLINT NULL,
  AMOUNT_PAID DECIMAL(10,3) NULL,
  AMOUNT_PAID_CURRENCY_ID SMALLINT NULL, 
  VERSION_NO INTEGER NOT NULL,
  PRIMARY KEY(ACCOUNT_FEES_DETAIL_ID),
  FOREIGN KEY(ID)
    REFERENCES LOAN_SCHEDULE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(AMOUNT_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(AMOUNT_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(FEE_ID)
    REFERENCES FEES(FEE_ID),
  FOREIGN KEY(ACCOUNT_FEE_ID)
    REFERENCES ACCOUNT_FEES(ACCOUNT_FEE_ID)
)
TYPE=InnoDB CHARACTER SET utf8

AS SELECT ACCOUNT_FEES_DETAIL_ID, ID, INSTALLMENT_ID, FEE_ID, ACCOUNT_FEE_ID, AMOUNT, AMOUNT_CURRENCY_ID, AMOUNT_PAID, AMOUNT_PAID_CURRENCY_ID, VERSION_NO FROM ACCOUNT_FEES_ACTION_DETAIL WHERE ACCOUNT_FEE_ID IN (SELECT ACCOUNT_FEE_ID FROM ACCOUNT_FEES WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM LOAN_ACCOUNT));


CREATE TABLE CUSTOMER_FEE_SCHEDULE (
  ACCOUNT_FEES_DETAIL_ID INTEGER NOT NULL AUTO_INCREMENT,
  ID INTEGER NOT NULL,
  INSTALLMENT_ID INTEGER NOT NULL,
  FEE_ID SMALLINT NOT NULL,
  ACCOUNT_FEE_ID INTEGER NOT NULL,  
  AMOUNT DECIMAL(10, 3) NULL,
  AMOUNT_CURRENCY_ID SMALLINT NULL,
  AMOUNT_PAID DECIMAL(10,3) NULL,
  AMOUNT_PAID_CURRENCY_ID SMALLINT NULL, 
  VERSION_NO INTEGER NOT NULL,
  PRIMARY KEY(ACCOUNT_FEES_DETAIL_ID ),
  FOREIGN KEY(ID)
    REFERENCES CUSTOMER_SCHEDULE(ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(AMOUNT_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(AMOUNT_PAID_CURRENCY_ID)
    REFERENCES CURRENCY(CURRENCY_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(FEE_ID)
    REFERENCES FEES(FEE_ID),
  FOREIGN KEY(ACCOUNT_FEE_ID)
    REFERENCES ACCOUNT_FEES(ACCOUNT_FEE_ID) 
)
TYPE=InnoDB CHARACTER SET utf8

AS SELECT ACCOUNT_FEES_DETAIL_ID, ID, INSTALLMENT_ID, FEE_ID, ACCOUNT_FEE_ID, AMOUNT, AMOUNT_CURRENCY_ID, AMOUNT_PAID, AMOUNT_PAID_CURRENCY_ID, VERSION_NO FROM ACCOUNT_FEES_ACTION_DETAIL WHERE ACCOUNT_FEE_ID IN (SELECT ACCOUNT_FEE_ID FROM ACCOUNT_FEES WHERE ACCOUNT_ID IN (SELECT ACCOUNT_ID FROM CUSTOMER_ACCOUNT));



DROP TABLE IF EXISTS ACCOUNT_FEES_ACTION_DETAIL;
DROP TABLE IF EXISTS ACCOUNT_ACTIONS_DATE;
