declare
    next_id INTEGER;
    eshop_id INTEGER;
    eshop_name VARCHAR2(250);
begin
    select rid, rname into eshop_id, eshop_name from soa_cfg_owner.order_status_recipient WHERE rstatus = 0 and rname = 'EShop' and ROWNUM = 1;

    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336095', '80168000000UunXAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336118', '80168000000UuqvAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336143', '80168000000UutLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336166', '80168000000Uuw5AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336211', '80168000000Uv0RAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336303', '80168000000Uv7mAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336385', '80168000000UvfDAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336390', '80168000000UvfhAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336477', '80168000000UvpwAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336495', '80168000000UvrYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336527', '80168000000UvuDAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336554', '80168000000UvwPAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336594', '80168000000UvzwAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336617', '80168000000Uw1xAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336667', '80168000000Uw64AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336733', '80168000000UweXAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336766', '80168000000Uwh7AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336812', '80168000000UwkkAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336835', '80168000000UwmWAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336868', '80168000000UwpBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336900', '80168000000UwrlAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336920', '80168000000UwtNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336931', '80168000000UwuBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336982', '80168000000UwyDAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337080', '80168000000UxXOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337084', '80168000000UxXiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337116', '80168000000Uxa8AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337156', '80168000000UxdCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337165', '80168000000UxdqAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337205', '80168000000UxgkAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337250', '80168000000UxkNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337295', '80168000000UxnMAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337343', '80168000000UxrEAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337347', '80168000000UxrYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337356', '80168000000Uxs7AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337379', '80168000000UxtyAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337431', '80168000000Uxy5AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337439', '80168000000UxyjAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337476', '80168000000Uy1YAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337477', '80168000000Uy1dAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337511', '80168000000Uy4NAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337512', '80168000000Uy4SAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337549', '80168000000Uy7RAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337658', '80168000000UyhVAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337715', '80168000000UymGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337730', '80168000000UynYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337737', '80168000000Uyo7AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337754', '80168000000UypoAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337789', '80168000000UysnAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337802', '80168000000UytqAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337808', '80168000000UyuKAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337821', '80168000000UyvXAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337828', '80168000000Uyw1AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337840', '80168000000UyxJAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337880', '80168000000Uz0XAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337892', '80168000000Uz1aAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337897', '80168000000Uz1zAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337930', '80168000000Uz4oAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337944', '80168000000Uz61AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337974', '80168000000Uz8WAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337979', '80168000000Uz8vAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338015', '80168000000UzCTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338023', '80168000000UzD7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338065', '80168000000UzGQAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338099', '80168000000UzJ5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338101', '80168000000UzJFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338107', '80168000000UzJeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338119', '80168000000UzKcAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338139', '80168000000UzM4AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338145', '80168000000UzMYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338157', '80168000000UzNWAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338175', '80168000000UzOyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338178', '80168000000UzPDAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338180', '80168000000UzPNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338184', '80168000000UzPhAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338188', '80168000000UzQ1AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338198', '80168000000UzQkAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338201', '80168000000UzQzAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338213', '80168000000UzRxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338243', '80168000000UzxsAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338266', '80168000000UzzjAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338298', '80168000000V02OAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338320', '80168000000V04PAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338327', '80168000000V053AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338329', '80168000000V05DAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338335', '80168000000V05hAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338345', '80168000000V06QAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338353', '80168000000V07JAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338358', '80168000000V07sAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338370', '80168000000V08vAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338387', '80168000000V0ANAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338394', '80168000000V0AwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338426', '80168000000V0DbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338456', '80168000000V0GVAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338477', '80168000000V0ICAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338497', '80168000000V0JoAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338512', '80168000000V0KwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338538', '80168000000V0MxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338589', '80168000000V0RiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338612', '80168000000V0USAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338633', '80168000000V0WFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338635', '80168000000V0WTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338643', '80168000000V0XCAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338660', '80168000000V0YjAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338664', '80168000000V0Z3AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338667', '80168000000V0ZIAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338669', '80168000000V0ZSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338676', '80168000000V0a1AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338680', '80168000000V0aLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338694', '80168000000V0bTAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338717', '80168000000V0dZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338727', '80168000000V0eNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338741', '80168000000V0fLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338746', '80168000000V0fkAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338759', '80168000000V0gnAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338761', '80168000000V0gsAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338770', '80168000000V0hbAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338788', '80168000000V0iyAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338794', '80168000000V0jSAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338802', '80168000000V0k6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338803', '80168000000V0kBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338813', '80168000000V0kzAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338840', '80168000000V0mRAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338863', '80168000000V0oIAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338868', '80168000000V0nQAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338883', '80168000000V0rYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338916', '80168000000V1PCAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338926', '80168000000V1Q5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338928', '80168000000V1QFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338940', '80168000000V1RDAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338943', '80168000000V1RNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338950', '80168000000V1RwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338959', '80168000000V1SfAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338963', '80168000000V1SzAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338968', '80168000000V1TOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338970', '80168000000V1TYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338973', '80168000000V1TnAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338975', '80168000000V1TxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338981', '80168000000V1UgAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338986', '80168000000V1V5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338995', '80168000000V1VtAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339002', '80168000000V1WrAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339004', '80168000000V1X1AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339007', '80168000000V1XGAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339026', '80168000000V1aKAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339045', '80168000000V1dYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339065', '80168000000V1gcAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339080', '80168000000V1j2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339082', '80168000000V1jRAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339084', '80168000000V1jbAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339090', '80168000000V1k0AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339105', '80168000000V1mGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339116', '80168000000V1oWAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339143', '80168000000V1r6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339148', '80168000000V1rVAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339158', '80168000000V1sOAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339170', '80168000000V1tCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339178', '80168000000V1tvAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339204', '80168000000V1x9AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339216', '80168000000V1yCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339237', '80168000000V1zjAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339244', '80168000000V20IAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339265', '80168000000V21uAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339271', '80168000000V22iAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339274', '80168000000V22xAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339289', '80168000000V24ZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339293', '80168000000V24tAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339298', '80168000000V25IAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339320', '80168000000V26zAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339325', '80168000000V27OAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339331', '80168000000V27sAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339333', '80168000000V282AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339337', '80168000000V28MAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339345', '80168000000V290AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339346', '80168000000V295AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339352', '80168000000V29ZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339364', '80168000000V2AXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339369', '80168000000V2AwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339372', '80168000000V2B2AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339381', '80168000000V2BpAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339384', '80168000000V2C4AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339423', '80168000000V2F8AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339425', '80168000000V2FIAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339428', '80168000000V2FXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339435', '80168000000V2G6AAK', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339436', '80168000000V2GBAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339437', '80168000000V2GGAA0', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339466', '80168000000V2smAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339472', '80168000000V2tLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339495', '80168000000V2vbAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339514', '80168000000V2x8AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339517', '80168000000V2xNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339531', '80168000000V2ypAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339535', '80168000000V2zJAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339540', '80168000000V2xnAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339554', '80168000000V30vAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339571', '80168000000V32cAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339575', '80168000000V32wAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339586', '80168000000V33uAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339590', '80168000000V349AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339605', '80168000000V358AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339612', '80168000000V360AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339624', '80168000000V36yAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339626', '80168000000V37DAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339652', '80168000000V36fAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339659', '80168000000V39dAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339663', '80168000000V39xAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339665', '80168000000V3A7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339680', '80168000000V3BPAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339683', '80168000000V3BZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339703', '80168000000V3D6AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339718', '80168000000V3EJAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339736', '80168000000V3FvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339737', '80168000000V3G0AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339746', '80168000000V3GyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339781', '80168000000V3KHAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339785', '80168000000V3KlAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339788', '80168000000V3LZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339798', '80168000000V3MSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339806', '80168000000V3NQAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339809', '80168000000V3NfAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339813', '80168000000V3NzAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339849', '80168000000V3RSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339853', '80168000000V3RrAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339859', '80168000000V3SLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339865', '80168000000V3SpAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339878', '80168000000V3TsAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339882', '80168000000V3UCAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339887', '80168000000V3UbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339890', '80168000000V3UqAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339896', '80168000000V3VFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339910', '80168000000V3WNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339911', '80168000000V3WSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339920', '80168000000V3XBAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339921', '80168000000V3XGAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339938', '80168000000V3YYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339954', '80168000000V3ZlAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339967', '80168000000V3aoAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339970', '80168000000V3b3AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339973', '80168000000V3bIAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339978', '80168000000V3bmAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339980', '80168000000V3bwAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339983', '80168000000V3cBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339993', '80168000000V3czAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340002', '80168000000V3ddAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340004', '80168000000V3dnAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340009', '80168000000V3eCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340050', '80168000000V4FNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340062', '80168000000V4GGAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340068', '80168000000V4FeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340069', '80168000000V4GkAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340080', '80168000000V4HYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340095', '80168000000V4IbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340097', '80168000000V4IlAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340099', '80168000000V4IvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340101', '80168000000V4J5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340103', '80168000000V4JFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340107', '80168000000V4JZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340110', '80168000000V4JoAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340116', '80168000000V4KIAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340124', '80168000000V4KmAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340129', '80168000000V4L6AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340153', '80168000000V4MnAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340155', '80168000000V4MxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340162', '80168000000V4NSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340164', '80168000000V4NbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340173', '80168000000V4OFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340184', '80168000000V4NTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340202', '80168000000V4QGAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340203', '80168000000V4QLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340220', '80168000000V4RdAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340224', '80168000000V4RxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340226', '80168000000V4S7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340231', '80168000000V4SWAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340233', '80168000000V4SgAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340241', '80168000000V4TKAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340245', '80168000000V4TeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340247', '80168000000V4ToAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340251', '80168000000V4U8AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340253', '80168000000V4UIAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340258', '80168000000V4UhAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340261', '80168000000V4UwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340266', '80168000000V4VLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340270', '80168000000V4VfAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340272', '80168000000V4VkAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340278', '80168000000V4WEAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340281', '80168000000V4RAAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340283', '80168000000V4VvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340285', '80168000000V4WdAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340288', '80168000000V4WsAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340291', '80168000000V4X2AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340295', '80168000000V4XMAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340309', '80168000000V4YUAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340311', '80168000000V4YeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340314', '80168000000V4YtAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340332', '80168000000V4aGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340335', '80168000000V4aVAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340337', '80168000000V4afAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340339', '80168000000V4apAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340351', '80168000000V4bnAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340353', '80168000000V4bsAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340355', '80168000000V4c2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340368', '80168000000V4d5AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340375', '80168000000V4deAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340380', '80168000000V4e3AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340383', '80168000000V4eIAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340387', '80168000000V4ecAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340389', '80168000000V4emAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340391', '80168000000V4ewAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340395', '80168000000V4fGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340397', '80168000000V4fQAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340399', '80168000000V4faAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340406', '80168000000V4g4AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340407', '80168000000V4g9AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340412', '80168000000V4gYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340416', '80168000000V4gsAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340434', '80168000000V4iAAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340441', '80168000000V4hIAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340449', '80168000000V4jIAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340464', '80168000000V5HsAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340466', '80168000000V5I2AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340471', '80168000000V5IRAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340473', '80168000000V5IbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340474', '80168000000V5IgAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340483', '80168000000V5JPAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340485', '80168000000V5JLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340488', '80168000000V5JjAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340497', '80168000000V5KSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340505', '80168000000V5L6AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340508', '80168000000V5LLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340512', '80168000000V5LfAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340516', '80168000000V5LzAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340518', '80168000000V5M9AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340520', '80168000000V5KdAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340532', '80168000000V5N7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340550', '80168000000V5OKAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340575', '80168000000V5QLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340576', '80168000000V5QQAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340590', '80168000000V5RYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340610', '80168000000V5TAAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340616', '80168000000V5TeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340620', '80168000000V5TyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340623', '80168000000V5UDAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340625', '80168000000V5UNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340627', '80168000000V5UXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340637', '80168000000V5VBAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340643', '80168000000V5VfAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340645', '80168000000V5VpAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340661', '80168000000V5X7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340665', '80168000000V5XRAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340667', '80168000000V5XbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340670', '80168000000V5XqAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340674', '80168000000V5YAAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340679', '80168000000V5YZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340681', '80168000000V5YjAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340686', '80168000000V5Z8AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340687', '80168000000V5ZDAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340690', '80168000000V5ZNAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340693', '80168000000V5ZcAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340697', '80168000000V5ZwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340702', '80168000000V5aLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340710', '80168000000V5azAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340718', '80168000000V5bdAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340722', '80168000000V5bxAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340727', '80168000000V5cMAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340734', '80168000000V5cvAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340737', '80168000000V5dAAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340742', '80168000000V5dUAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340745', '80168000000V5djAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340750', '80168000000V5e8AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340759', '80168000000V5erAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340770', '80168000000V5eYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340771', '80168000000V5ffAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340776', '80168000000V5fzAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340779', '80168000000V5gEAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340782', '80168000000V5gTAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340784', '80168000000V5gdAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340787', '80168000000V5gsAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340792', '80168000000V5hHAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340819', '80168000000V5iyAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340825', '80168000000V5jSAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340826', '80168000000V5jXAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340831', '80168000000V5jwAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340834', '80168000000V5kBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340837', '80168000000V5kQAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340842', '80168000000V5kkAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340858', '80168000000V5m2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340862', '80168000000V5mRAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340872', '80168000000V5nPAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340875', '80168000000V5njAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340886', '80168000000V5ohAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340888', '80168000000V5orAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340891', '80168000000V5pBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340906', '80168000000V5qTAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340910', '80168000000V5r2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340922', '80168000000V5sFAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340935', '80168000000V5tSAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340942', '80168000000V5twAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340944', '80168000000V5u6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340947', '80168000000V5uLAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340953', '80168000000V5uuAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340959', '80168000000V5vOAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340976', '80168000000V5wqAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340985', '80168000000V5xZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340989', '80168000000V5xoAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341004', '80168000000V5z1AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341011', '80168000000V5zaAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341025', '80168000000V60iAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341027', '80168000000V60sAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341037', '80168000000V61gAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341047', '80168000000V62PAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341062', '80168000000V63hAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341067', '80168000000V646AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341071', '80168000000V64QAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341074', '80168000000V64fAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341081', '80168000000V65EAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341091', '80168000000V667AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341094', '80168000000V66MAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341116', '80168000000V68cAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341125', '80168000000V69LAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341130', '80168000000V69uAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341157', '80168000000V6CZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341167', '80168000000V6DXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341170', '80168000000V6DmAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341172', '80168000000V6DwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341180', '80168000000V6EpAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341184', '80168000000V6F9AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341195', '80168000000V6G2AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341199', '80168000000V6GRAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341201', '80168000000V6GbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341208', '80168000000V6HAAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341211', '80168000000V6HPAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341213', '80168000000V6HZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341221', '80168000000V6ISAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341227', '80168000000V6IwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341230', '80168000000V6JBAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341232', '80168000000V6JLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341234', '80168000000V6JVAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341238', '80168000000V6JuAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341242', '80168000000V6KEAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341245', '80168000000V6KTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341248', '80168000000V6KiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341260', '80168000000V6LgAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341264', '80168000000V6M0AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341269', '80168000000V6MPAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341272', '80168000000V6MeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341275', '80168000000V6MtAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341277', '80168000000V6N3AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341282', '80168000000V6NSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341283', '80168000000V6NXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341290', '80168000000V6O6AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341305', '80168000000V6PTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341307', '80168000000V6PdAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341308', '80168000000V6PiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341313', '80168000000V6Q7AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341319', '80168000000V6QbAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341322', '80168000000V6QqAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341330', '80168000000V6RUAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341332', '80168000000V6ReAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341348', '80168000000V71DAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341353', '80168000000V71cAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341357', '80168000000V71wAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341360', '80168000000V72BAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341363', '80168000000V72QAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341366', '80168000000V72fAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341381', '80168000000V742AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341394', '80168000000V755AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341395', '80168000000V75AAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341406', '80168000000V76NAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341407', '80168000000V76SAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341410', '80168000000V76hAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341436', '80168000000V78xAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341455', '80168000000V7AZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341466', '80168000000V7BXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341471', '80168000000V7BwAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341475', '80168000000V7CLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341478', '80168000000V7CaAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341480', '80168000000V7CkAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341488', '80168000000V7DOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341492', '80168000000V7DiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341498', '80168000000V7ECAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341501', '80168000000V7ERAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341507', '80168000000V7EvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341513', '80168000000V7FPAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341515', '80168000000V7FZAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341519', '80168000000V7FyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341521', '80168000000V7G8AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341526', '80168000000V7GSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341551', '80168000000V7IiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341561', '80168000000V7JWAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341567', '80168000000V7JqAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341580', '80168000000V7KtAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341581', '80168000000V7KyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341585', '80168000000V7LIAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341599', '80168000000V7MLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341606', '80168000000V7MuAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341608', '80168000000V7N4AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341611', '80168000000V7NJAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341616', '80168000000V7NiAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341619', '80168000000V7NxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341626', '80168000000V7ObAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341637', '80168000000V7PeAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341640', '80168000000V7PyAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341649', '80168000000V7QmAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341654', '80168000000V7RBAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341655', '80168000000V7RGAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341669', '80168000000V7SOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341675', '80168000000V7SxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341678', '80168000000V7TCAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341681', '80168000000V7TRAA0', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341686', '80168000000V7TqAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341693', '80168000000V7UUAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341696', '80168000000V7UjAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341706', '80168000000V7VXAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341728', '80168000000V7XnAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341750', '80168000000V7a8AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341753', '80168000000V7aNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341768', '80168000000V7baAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341772', '80168000000V7buAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341775', '80168000000V7c9AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341784', '80168000000V7csAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341786', '80168000000V7d2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341789', '80168000000V7dHAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341805', '80168000000V7eZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341811', '80168000000V7eyAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341814', '80168000000V7fDAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341816', '80168000000V7fNAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341817', '80168000000V7fSAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341820', '80168000000V7fhAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341825', '80168000000V7g1AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341832', '80168000000V7gfAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341833', '80168000000V7gkAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341835', '80168000000V7guAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341837', '80168000000V7h4AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341839', '80168000000V7hEAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341840', '80168000000V7hJAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341852', '80168000000V7iCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341853', '80168000000V7iHAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341860', '80168000000V7iqAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341871', '80168000000V7jjAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341875', '80168000000V7k3AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341899', '80168000000V7l6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341901', '80168000000V7lGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341903', '80168000000V7lQAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341905', '80168000000V7laAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341909', '80168000000V7luAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341911', '80168000000V7m4AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341915', '80168000000V7mOAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341917', '80168000000V7mYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341923', '80168000000V7n2AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341925', '80168000000V7nCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341934', '80168000000V7nvAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341941', '80168000000V7oZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341955', '80168000000V7pmAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341989', '80168000000V7sRAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342009', '80168000000V7tyAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342022', '80168000000V7v6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342060', '80168000000V7y0AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342067', '80168000000V7yZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342077', '80168000000V7zhAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342081', '80168000000V801AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342110', '80168000000V82tAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342124', '80168000000V84BAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342141', '80168000000V85YAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342152', '80168000000V86RAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342161', '80168000000V87AAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342168', '80168000000V87jAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342174', '80168000000V88DAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342175', '80168000000V88IAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342179', '80168000000V88cAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342181', '80168000000V88mAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342182', '80168000000V88rAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342187', '80168000000V89GAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342196', '80168000000V8A4AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342197', '80168000000V8A9AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342220', '80168000000V8C5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342223', '80168000000V8CKAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342245', '80168000000V8EpAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342252', '80168000000V8FOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342274', '80168000000V8HoAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342290', '80168000000V8J6AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342305', '80168000000V8KJAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342306', '80168000000V8KOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342308', '80168000000V8KYAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342313', '80168000000V8KxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342314', '80168000000V8JvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342321', '80168000000V8LWAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342323', '80168000000V8LgAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342329', '80168000000V8MAAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342338', '80168000000V8MtAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342342', '80168000000V8NDAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342349', '80168000000V8NmAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342352', '80168000000V8O1AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342353', '80168000000V8NJAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342358', '80168000000V8OLAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342363', '80168000000V8OkAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342366', '80168000000V8P4AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342367', '80168000000V8P9AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342371', '80168000000V8PTAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342377', '80168000000V8PsAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342378', '80168000000V8PxAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342382', '80168000000V8QHAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342392', '80168000000V8R5AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342397', '80168000000V8RUAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342414', '80168000000V97EAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343089', '80168000000V9WEAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343090', '80168000000V9WJAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343091', '80168000000V9WOAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343096', '80168000000V9WnAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343104', '80168000000V9XvAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343105', '80168000000V9Y0AAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343106', '80168000000V9YFAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343109', '80168000000V9YUAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343114', '80168000000V9ZSAA0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343115', '80168000000V9ZcAAK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343119', '80168000000V9a6AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343124', '80168000000V9aVAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343128', '80168000000V9auAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343138', '80168000000V9biAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343155', '80168000000V9d5AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343159', '80168000000V9dPAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343171', '80168000000V9eSAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343180', '80168000000V9fBAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343181', '80168000000V9fGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343194', '80168000000V9gTAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343195', '80168000000V9gYAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343201', '80168000000V9h7AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343206', '80168000000V9hWAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343217', '80168000000V9iZAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343231', '80168000000V9jhAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343245', '80168000000V9kpAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343251', '80168000000V9lJAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343254', '80168000000V9lYAAS', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343260', '80168000000V9m7AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343295', '80168000000V9p6AAC', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343306', '80168000000V9pzAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343328', '80168000000V9rlAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343340', '80168000000V9t3AAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343377', '80168000000V9wCAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343386', '80168000000V9wvAAC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343413', '80168000000V9z1AAC', 'Completed', 'Bill Payed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343415', '80168000000V9zGAAS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343461', '80168000000VA3cAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343469', '80168000000VA4GAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343477', '80168000000VA4uAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343484', '80168000000VA5OAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343493', '80168000000VA67AAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343497', '80168000000VA6RAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343505', '80168000000VA7AAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343511', '80168000000VA7eAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343522', '80168000000VA8XAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343526', '80168000000VA8mAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343540', '80168000000VA9uAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343541', '80168000000VA9zAAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343543', '80168000000VAA9AAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343546', '80168000000VAAOAA4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343548', '80168000000VAAdAAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343552', '80168000000VAAxAAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343576', '80168000000VACoAAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343596', '80168000000VAELAA4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343598', '80168000000VAEVAA4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343602', '80168000000VAEpAAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343618', '80168000000VAG7AAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343752', '80168000000VB4AAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343766', '80168000000VB5SAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343772', '80168000000VB66AAG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343797', '80168000000VB8CAAW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343841', '80168000000VBC4AAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343845', '80168000000VBCOAA4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343860', '80168000000VBDbAAO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    commit;
end;