DROP TABLE IF EXISTS ACCEPTED_PAYMENT_TYPE;
DROP TABLE IF EXISTS SUPPORTED_MODES;

CREATE TABLE ACCEPTED_PAYMENT_TYPE
(
 ACCEPTED_PAYMENT_TYPE_ID SMALLINT AUTO_INCREMENT NOT NULL,
 TRANSACTION_ID SMALLINT NOT NULL,
 PAYMENT_TYPE_ID SMALLINT NOT NULL,
 PRIMARY KEY(ACCEPTED_PAYMENT_TYPE_ID),
 FOREIGN KEY(TRANSACTION_ID)
   REFERENCES TRANSACTION_TYPE(TRANSACTION_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(PAYMENT_TYPE_ID)
    REFERENCES PAYMENT_TYPE(PAYMENT_TYPE_ID)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
)
ENGINE=InnoDB CHARACTER SET utf8;

INSERT INTO ACCEPTED_PAYMENT_TYPE (ACCEPTED_PAYMENT_TYPE_ID,TRANSACTION_ID,PAYMENT_TYPE_ID) VALUES (1,1,1);
INSERT INTO ACCEPTED_PAYMENT_TYPE (ACCEPTED_PAYMENT_TYPE_ID,TRANSACTION_ID,PAYMENT_TYPE_ID) VALUES (2,2,1);
INSERT INTO ACCEPTED_PAYMENT_TYPE (ACCEPTED_PAYMENT_TYPE_ID,TRANSACTION_ID,PAYMENT_TYPE_ID) VALUES (3,3,1);
INSERT INTO ACCEPTED_PAYMENT_TYPE (ACCEPTED_PAYMENT_TYPE_ID,TRANSACTION_ID,PAYMENT_TYPE_ID) VALUES (4,4,1);
INSERT INTO ACCEPTED_PAYMENT_TYPE (ACCEPTED_PAYMENT_TYPE_ID,TRANSACTION_ID,PAYMENT_TYPE_ID) VALUES (5,5,1);


update DATABASE_VERSION set DATABASE_VERSION = 140 where DATABASE_VERSION = 139;