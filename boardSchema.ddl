-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-12-28 20:06:23 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- CREATE USER board IDENTIFIED BY ACCOUNT UNLOCK ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE board.comments (
    post_no          NUMBER(5) NOT NULL,
    comm_no          NUMBER(5) NOT NULL,
    comm_writer      VARCHAR2(50 BYTE) NOT NULL,
    comm_content     VARCHAR2(1000 BYTE) NOT NULL,
    comm_regdate     DATE DEFAULT sysdate,
    comm_declare     NUMBER(1) DEFAULT 0 NOT NULL,
    declare_reporter VARCHAR2(50 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX board.comments_pk ON
    board.comments (
        post_no
    ASC,
        comm_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE board.comments
    ADD CONSTRAINT comments_pk PRIMARY KEY ( post_no,
                                             comm_no )
        USING INDEX board.comments_pk;

CREATE TABLE board.member (
    mem_id      VARCHAR2(50 BYTE) NOT NULL,
    mem_pw      VARCHAR2(50 BYTE) NOT NULL,
    mem_name    VARCHAR2(50 BYTE) NOT NULL,
    mem_tel     VARCHAR2(15 BYTE) NOT NULL,
    mem_email   VARCHAR2(50 BYTE),
    mem_regdate DATE DEFAULT sysdate,
    mem_level   NUMBER(1) DEFAULT 0
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX board.member_pk ON
    board.member (
        mem_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE board.member
    ADD CONSTRAINT member_pk PRIMARY KEY ( mem_id )
        USING INDEX board.member_pk;

CREATE TABLE board.post (
    post_no          NUMBER(5) NOT NULL,
    post_writer      VARCHAR2(50 BYTE) NOT NULL,
    post_title       VARCHAR2(50 BYTE) NOT NULL,
    post_content     VARCHAR2(1000 BYTE),
    post_view        NUMBER(5) DEFAULT 0,
    post_like        NUMBER(5) DEFAULT 0,
    post_regdate     DATE DEFAULT sysdate NOT NULL,
    post_moddate     DATE,
    file_name        VARCHAR2(50 BYTE),
    stored_file_name VARCHAR2(50 BYTE),
    file_size        NUMBER(5)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX board.post_pk ON
    board.post (
        post_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE board.post
    ADD CONSTRAINT post_pk PRIMARY KEY ( post_no )
        USING INDEX board.post_pk;

ALTER TABLE board.comments
    ADD CONSTRAINT comments_post_no FOREIGN KEY ( post_no )
        REFERENCES board.post ( post_no )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE board.post
    ADD CONSTRAINT post_member_fk FOREIGN KEY ( post_writer )
        REFERENCES board.member ( mem_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             3
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
