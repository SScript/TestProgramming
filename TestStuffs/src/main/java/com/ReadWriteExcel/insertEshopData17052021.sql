declare
    next_id INTEGER;
    eshop_id INTEGER;
    eshop_name VARCHAR2(250);
begin
    select rid, rname into eshop_id, eshop_name from soa_cfg_owner.order_status_recipient WHERE rstatus = 0 and rname = 'EShop' and ROWNUM = 1;

    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00350980', '80168000000VUs4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343867', '80168000000VBEA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343856', '80168000000VBDH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343851', '80168000000VBCs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343844', '80168000000VBCJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343831', '80168000000VBBG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343820', '80168000000VBAN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343816', '80168000000VBA3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343813', '80168000000VB9t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343809', '80168000000VB9Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343804', '80168000000VB95', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343801', '80168000000VB8g', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343793', '80168000000VB7s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343783', '80168000000VB74', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343773', '80168000000VB6B', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343771', '80168000000VB5w', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343767', '80168000000VB5X', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343761', '80168000000VB4y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343760', '80168000000VB4t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343750', '80168000000VB40', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343742', '80168000000VB3M', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343738', '80168000000VB37', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343734', '80168000000VB2n', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343725', '80168000000VB1z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343719', '80168000000VB1Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343717', '80168000000VB1B', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343712', '80168000000VB0h', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343700', '80168000000VAzZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343698', '80168000000VAzK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343692', '80168000000VAyl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343687', '80168000000VAyM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343681', '80168000000VAxs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343680', '80168000000VAxn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343671', '80168000000VAwz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343654', '80168000000VAvX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343611', '80168000000VAFY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343608', '80168000000VAFJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343605', '80168000000VAF4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343600', '80168000000VAEf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343594', '80168000000VAEB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343592', '80168000000VAE1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343590', '80168000000VADr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343584', '80168000000VADS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343582', '80168000000VADI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343581', '80168000000VADD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343579', '80168000000VAD3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343573', '80168000000VACZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343571', '80168000000VACP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343569', '80168000000VACF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343568', '80168000000VACA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343567', '80168000000VAC5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343565', '80168000000VABv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343562', '80168000000VABg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343561', '80168000000VABb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343560', '80168000000VABW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343559', '80168000000VABR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343555', '80168000000VAA5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343553', '80168000000VAB2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343551', '80168000000VAAs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343547', '80168000000VAAT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343538', '80168000000VA9k', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343536', '80168000000VA9a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343534', '80168000000VA9Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343524', '80168000000VA8c', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343521', '80168000000VA8S', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343516', '80168000000VA83', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343515', '80168000000VA7y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343512', '80168000000VA7j', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343509', '80168000000VA7U', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343506', '80168000000VA7F', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343501', '80168000000VA6q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343495', '80168000000VA6H', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343489', '80168000000VA5n', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343488', '80168000000VA5i', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343486', '80168000000VA5Y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343485', '80168000000VA5T', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343482', '80168000000VA5J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343473', '80168000000VA4a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343471', '80168000000VA4Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343467', '80168000000VA46', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343460', '80168000000VA3S', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343459', '80168000000VA3I', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343457', '80168000000VA33', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343453', '80168000000VA2Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343449', '80168000000VA2F', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343430', '80168000000VA0T', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343420', '80168000000V9zf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343403', '80168000000V9yD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343399', '80168000000V9xt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343391', '80168000000V9xF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343373', '80168000000V9vs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343369', '80168000000V9vT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343367', '80168000000V9vE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343357', '80168000000V9uQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343356', '80168000000V9uL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343346', '80168000000V9tc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343337', '80168000000V9so', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343336', '80168000000V9sj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343335', '80168000000V9se', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343323', '80168000000V9rM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343322', '80168000000V9rH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343318', '80168000000V9qx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343312', '80168000000V9qT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343308', '80168000000V9q9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343299', '80168000000V9pQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343297', '80168000000V9pG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343296', '80168000000V9pB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343288', '80168000000V9oS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343287', '80168000000V9oN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343285', '80168000000V9oD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343249', '80168000000V9l9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343241', '80168000000V9kV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343238', '80168000000V9kG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343233', '80168000000V9jr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343226', '80168000000V9jD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343214', '80168000000V9iK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343213', '80168000000V9i5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343211', '80168000000V9hv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343204', '80168000000V9hM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343193', '80168000000V9gJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343184', '80168000000V9fa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343156', '80168000000V9dA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343150', '80168000000V9cg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343146', '80168000000V9cM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343136', '80168000000V9bY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343130', '80168000000V9b4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343117', '80168000000V9Zw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343110', '80168000000V9Yt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343102', '80168000000V9Xl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343101', '80168000000V9XC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343099', '80168000000V9X2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343097', '80168000000V9Ws', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00343087', '80168000000V9KF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342400', '80168000000V8Rj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342396', '80168000000V8RP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342389', '80168000000V8Qq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342385', '80168000000V8QW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342381', '80168000000V8QC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342376', '80168000000V8PK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342373', '80168000000V8Pd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342370', '80168000000V8PO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342361', '80168000000V8Oa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342357', '80168000000V8OG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342356', '80168000000V8NY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342351', '80168000000V8Nw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342345', '80168000000V8NS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342337', '80168000000V8Mo', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342336', '80168000000V8Mj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342331', '80168000000V8MK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342326', '80168000000V8Lv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342320', '80168000000V8LR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342311', '80168000000V8Kn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342304', '80168000000V8KE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342303', '80168000000V8K9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342301', '80168000000V8Jz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342298', '80168000000V8Jk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342288', '80168000000V8Iw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342285', '80168000000V8Ih', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342284', '80168000000V8Ic', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342283', '80168000000V8IX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342282', '80168000000V8IS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342277', '80168000000V8I3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342270', '80168000000V8HF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342269', '80168000000V8H5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342261', '80168000000V8GC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342256', '80168000000V8Fn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342250', '80168000000V8FE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342249', '80168000000V8F9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342247', '80168000000V8Ez', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342233', '80168000000V8DX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342218', '80168000000V8Bv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342212', '80168000000V8BM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342210', '80168000000V8BC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342202', '80168000000V8AY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342195', '80168000000V89u', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342190', '80168000000V89V', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342186', '80168000000V89B', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342184', '80168000000V891', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342177', '80168000000V88S', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342166', '80168000000V87Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342148', '80168000000V867', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342146', '80168000000V85x', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342138', '80168000000V85J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342135', '80168000000V83s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342116', '80168000000V83N', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342114', '80168000000V83D', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342112', '80168000000V833', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342101', '80168000000V82A', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342100', '80168000000V825', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342094', '80168000000V81W', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342090', '80168000000V80k', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342087', '80168000000V80V', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342083', '80168000000V80B', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342076', '80168000000V7zc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342075', '80168000000V7zX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342071', '80168000000V7zD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342064', '80168000000V7yK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342057', '80168000000V7xl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342044', '80168000000V7wd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342042', '80168000000V7wT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342035', '80168000000V7vv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342032', '80168000000V7vg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342021', '80168000000V7uY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342019', '80168000000V7uw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342005', '80168000000V7tj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00342001', '80168000000V7tP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341987', '80168000000V7sH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341984', '80168000000V7s7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341979', '80168000000V7ri', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341970', '80168000000V7qz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341947', '80168000000V7p3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341935', '80168000000V7o0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341928', '80168000000V7nR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341920', '80168000000V7mn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341884', '80168000000V7kh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341881', '80168000000V7kS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341869', '80168000000V7jZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341865', '80168000000V7jF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341863', '80168000000V7j5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341859', '80168000000V7il', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341849', '80168000000V7hx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341848', '80168000000V7hs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341845', '80168000000V7hi', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341844', '80168000000V7hd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341830', '80168000000V7gQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341829', '80168000000V7gL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341822', '80168000000V7fn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341813', '80168000000V7f8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341810', '80168000000V7ea', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341807', '80168000000V7ej', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341803', '80168000000V7eP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341798', '80168000000V7e0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341792', '80168000000V7dW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341790', '80168000000V7dM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341788', '80168000000V7dC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341780', '80168000000V7cY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341766', '80168000000V7bQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341761', '80168000000V7b1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341734', '80168000000V7YM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341725', '80168000000V7XJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341711', '80168000000V7Vw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341708', '80168000000V7Vh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341699', '80168000000V7Uy', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341661', '80168000000V7Rk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341651', '80168000000V7Qw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341645', '80168000000V7Qc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341643', '80168000000V7Ow', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341621', '80168000000V7OC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341614', '80168000000V7NY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341604', '80168000000V7Mk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341582', '80168000000V7L3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341572', '80168000000V7KF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341563', '80168000000V7IA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341548', '80168000000V7IT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341539', '80168000000V7Hf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341535', '80168000000V7HL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341531', '80168000000V7Gw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341505', '80168000000V7El', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341497', '80168000000V7E7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341484', '80168000000V7D4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341459', '80168000000V7At', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341453', '80168000000V7AP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341451', '80168000000V7AF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341448', '80168000000V7A0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341444', '80168000000V79g', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341430', '80168000000V78T', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341424', '80168000000V77u', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341402', '80168000000V75t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341399', '80168000000V75e', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341396', '80168000000V73U', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341392', '80168000000V74q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341377', '80168000000V73i', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341374', '80168000000V73O', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341373', '80168000000V73J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341355', '80168000000V71m', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341335', '80168000000V6Rt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341333', '80168000000V6Rj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341327', '80168000000V6RF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341316', '80168000000V6QM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341311', '80168000000V6Px', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341310', '80168000000V6Ps', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341303', '80168000000V6PJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341301', '80168000000V6Oz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341298', '80168000000V6Ok', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341293', '80168000000V6OL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341289', '80168000000V6O1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341286', '80168000000V6Nm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341281', '80168000000V6NN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341273', '80168000000V6Mj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341267', '80168000000V6MF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341262', '80168000000V6Lq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341258', '80168000000V6LW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341256', '80168000000V6LM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341253', '80168000000V6L7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341250', '80168000000V6Ks', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341249', '80168000000V6Kn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341228', '80168000000V6J1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341215', '80168000000V6Hj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341206', '80168000000V6H0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341202', '80168000000V6Gg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341193', '80168000000V6Fs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341189', '80168000000V6FY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341183', '80168000000V6F4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341182', '80168000000V6Ez', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341166', '80168000000V6DS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341164', '80168000000V6DD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341162', '80168000000V6D3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341160', '80168000000V6Ct', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341128', '80168000000V69f', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341121', '80168000000V691', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341110', '80168000000V67t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341107', '80168000000V67Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341099', '80168000000V66q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341085', '80168000000V65Y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341077', '80168000000V64u', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341064', '80168000000V63r', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341057', '80168000000V63I', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341053', '80168000000V62y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341041', '80168000000V620', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341036', '80168000000V61b', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341032', '80168000000V61H', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341029', '80168000000V612', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341019', '80168000000V60E', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341016', '80168000000V5zz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341013', '80168000000V5zp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00341003', '80168000000V5yw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340996', '80168000000V5ww', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340980', '80168000000V5xA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340966', '80168000000V5vx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340957', '80168000000V5vE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340940', '80168000000V5tm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340934', '80168000000V5tN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340919', '80168000000V5s0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340917', '80168000000V5rl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340914', '80168000000V5rM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340867', '80168000000V5mv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340860', '80168000000V5mH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340855', '80168000000V5ln', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340851', '80168000000V5lT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340827', '80168000000V5jc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340823', '80168000000V5jI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340807', '80168000000V5i0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340790', '80168000000V5h7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340781', '80168000000V5gO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340772', '80168000000V5fk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340769', '80168000000V5fa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340768', '80168000000V5fV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340763', '80168000000V5fB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340756', '80168000000V5ec', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340754', '80168000000V5eS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340748', '80168000000V5dy', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340747', '80168000000V5dt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340740', '80168000000V5dK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340729', '80168000000V5cW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340728', '80168000000V5cR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340725', '80168000000V5cC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340723', '80168000000V5c2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340713', '80168000000V5bE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340703', '80168000000V5aQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340695', '80168000000V5Zm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340685', '80168000000V5Z3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340684', '80168000000V5Yy', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340659', '80168000000V5Wx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340657', '80168000000V5Wn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340650', '80168000000V5WE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340648', '80168000000V5W4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340641', '80168000000V5VV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340639', '80168000000V5VL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340633', '80168000000V5Tf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340630', '80168000000V5Um', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340621', '80168000000V5U3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340614', '80168000000V5TU', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340613', '80168000000V5TP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340611', '80168000000V5TF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340606', '80168000000V5Sq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340603', '80168000000V5Sb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340600', '80168000000V5SM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340589', '80168000000V5RT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340588', '80168000000V5RO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340586', '80168000000V5RE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340584', '80168000000V5R4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340583', '80168000000V5Qz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340581', '80168000000V5Qp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340578', '80168000000V5Qa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340565', '80168000000V5PX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340564', '80168000000V5PS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340563', '80168000000V5PN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340556', '80168000000V5Oo', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340553', '80168000000V5OZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340548', '80168000000V5OA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340530', '80168000000V5Mx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340525', '80168000000V5Md', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340522', '80168000000V5MO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340509', '80168000000V5LQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340490', '80168000000V5Jt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340477', '80168000000V5Iv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340455', '80168000000V4jm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340444', '80168000000V4it', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340438', '80168000000V4iU', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340437', '80168000000V4iP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340425', '80168000000V4hW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340420', '80168000000V4eE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340409', '80168000000V4gJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340403', '80168000000V4fg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340398', '80168000000V4fV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340385', '80168000000V4eS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340381', '80168000000V4e8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340378', '80168000000V4dt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340376', '80168000000V4dj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340367', '80168000000V4d0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340365', '80168000000V4cq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340362', '80168000000V4cb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340357', '80168000000V4cC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340348', '80168000000V4bY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340343', '80168000000V4b9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340342', '80168000000V4b4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340320', '80168000000V4ZI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340317', '80168000000V4Z3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340302', '80168000000V4Xv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340299', '80168000000V4Xg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340280', '80168000000V4WO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340275', '80168000000V4Vz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340246', '80168000000V4Tj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340237', '80168000000V4T0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340236', '80168000000V4Sv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340229', '80168000000V4SM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340223', '80168000000V4Rs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340215', '80168000000V4RE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340205', '80168000000V4QV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340204', '80168000000V4QQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340201', '80168000000V4QB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340200', '80168000000V4Q6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340195', '80168000000V4Pm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340192', '80168000000V4PX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340185', '80168000000V4Oy', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340178', '80168000000V4Oe', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340172', '80168000000V4OA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340168', '80168000000V4Nv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340160', '80168000000V4NM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340145', '80168000000V4ME', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340132', '80168000000V4JD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340113', '80168000000V4K3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340105', '80168000000V4JP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340102', '80168000000V4JA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340082', '80168000000V4Hi', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340074', '80168000000V4H4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340073', '80168000000V4Gz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340056', '80168000000V4Fm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340052', '80168000000V4FX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340048', '80168000000V4FD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340041', '80168000000V4Ee', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340036', '80168000000V4EF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340032', '80168000000V4Dv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340018', '80168000000V3ev', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340006', '80168000000V3dx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340005', '80168000000V3ds', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00340000', '80168000000V3dT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339990', '80168000000V3ck', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339985', '80168000000V3cL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339965', '80168000000V3ae', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339957', '80168000000V3a0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339952', '80168000000V3Zb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339943', '80168000000V3YK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339941', '80168000000V3Yn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339936', '80168000000V3YO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339917', '80168000000V3Ww', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339915', '80168000000V3Wm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339907', '80168000000V3W8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339901', '80168000000V3Ve', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339886', '80168000000V3UW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339884', '80168000000V3UM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339875', '80168000000V3Td', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339872', '80168000000V3TO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339848', '80168000000V3RN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339846', '80168000000V3RD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339840', '80168000000V3Qe', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339837', '80168000000V3QK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339829', '80168000000V3Pg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339824', '80168000000V3PC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339822', '80168000000V3P2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339817', '80168000000V3OY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339805', '80168000000V3NG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339801', '80168000000V3Mh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339791', '80168000000V3Lt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339759', '80168000000V3I6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339741', '80168000000V3GP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339733', '80168000000V3Fg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339725', '80168000000V3Es', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339698', '80168000000V3Ch', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339695', '80168000000V3CX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339691', '80168000000V3CD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339688', '80168000000V3By', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339687', '80168000000V3Bt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339669', '80168000000V3AW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339662', '80168000000V39s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339657', '80168000000V39T', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339655', '80168000000V39J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339650', '80168000000V38z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339640', '80168000000V38G', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339636', '80168000000V37s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339630', '80168000000V37X', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339628', '80168000000V37N', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339622', '80168000000V36o', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339617', '80168000000V36P', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339602', '80168000000V35H', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339596', '80168000000V34d', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339595', '80168000000V34Y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339583', '80168000000V33f', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339574', '80168000000V32r', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339568', '80168000000V32N', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339566', '80168000000V32D', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339563', '80168000000V31y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339561', '80168000000V31Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339532', '80168000000V2yu', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339530', '80168000000V2yf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339508', '80168000000V2we', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339506', '80168000000V2wU', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339479', '80168000000V2tz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339475', '80168000000V2ta', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339470', '80168000000V2t6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339439', '80168000000V2GQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339434', '80168000000V2G1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339431', '80168000000V2Fm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339430', '80168000000V2Fh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339421', '80168000000V2Ey', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339413', '80168000000V2EK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339410', '80168000000V2E5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339407', '80168000000V2Dv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339404', '80168000000V2Dg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339403', '80168000000V2Db', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339395', '80168000000V2Cx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339392', '80168000000V2Ci', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339386', '80168000000V2CE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339385', '80168000000V2C9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339378', '80168000000V2Ba', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339376', '80168000000V2BQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339365', '80168000000V2Ac', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339360', '80168000000V2AD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339358', '80168000000V2A3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339354', '80168000000V29j', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339351', '80168000000V29U', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339348', '80168000000V29F', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339340', '80168000000V28b', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339335', '80168000000V28C', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339329', '80168000000V27i', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339327', '80168000000V27Y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339318', '80168000000V26p', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339315', '80168000000V26a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339314', '80168000000V26V', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339313', '80168000000V26Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339311', '80168000000V26G', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339304', '80168000000V22F', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339283', '80168000000V245', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339280', '80168000000V23l', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339277', '80168000000V23M', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339276', '80168000000V23C', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339261', '80168000000V21a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339259', '80168000000V21Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339257', '80168000000V21G', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339242', '80168000000V208', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339235', '80168000000V1zZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339230', '80168000000V1zA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339228', '80168000000V1yr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339217', '80168000000V1yH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339214', '80168000000V1xx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339212', '80168000000V1xn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339210', '80168000000V1xd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339202', '80168000000V1wz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339171', '80168000000V1tM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339168', '80168000000V1t2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339166', '80168000000V1ss', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339163', '80168000000V1sQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339155', '80168000000V1s9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339152', '80168000000V1rp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339146', '80168000000V1rL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339137', '80168000000V1js', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339134', '80168000000V1qN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339131', '80168000000V1q8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339123', '80168000000V1pF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339113', '80168000000V1oH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339108', '80168000000V1nY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339098', '80168000000V1lh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339092', '80168000000V1l3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339078', '80168000000V1hz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339077', '80168000000V1hp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339076', '80168000000V1hk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339050', '80168000000V1e2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339036', '80168000000V1cf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339034', '80168000000V1cC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00339031', '80168000000V1c1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338978', '80168000000V1UR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338958', '80168000000V1Sa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338944', '80168000000V1RS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338932', '80168000000V1QZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338912', '80168000000V1Ox', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338896', '80168000000V1Nf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338892', '80168000000V1NL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338890', '80168000000V1NB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338877', '80168000000V0pQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338875', '80168000000V0pG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338873', '80168000000V0p6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338870', '80168000000V0or', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338861', '80168000000V0o8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338860', '80168000000V0ny', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338858', '80168000000V0no', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338855', '80168000000V0nZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338852', '80168000000V0nK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338851', '80168000000V0nF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338845', '80168000000V0mq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338842', '80168000000V0mb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338839', '80168000000V0mM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338823', '80168000000V0ln', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338820', '80168000000V0lY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338808', '80168000000V0ka', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338805', '80168000000V0kL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338799', '80168000000V0jr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338798', '80168000000V0jm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338795', '80168000000V0jX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338786', '80168000000V0io', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338782', '80168000000V0iU', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338780', '80168000000V0iK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338778', '80168000000V0iA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338775', '80168000000V0hv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338773', '80168000000V0hh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338768', '80168000000V0hR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338765', '80168000000V0hC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338757', '80168000000V0gd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338751', '80168000000V0g9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338749', '80168000000V0fz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338748', '80168000000V0fu', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338744', '80168000000V0fa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338743', '80168000000V0fV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338738', '80168000000V0fB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338737', '80168000000V0f6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338735', '80168000000V0ew', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338734', '80168000000V0er', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338732', '80168000000V0eh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338726', '80168000000V0eI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338720', '80168000000V0do', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338719', '80168000000V0dj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338708', '80168000000V0cb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338705', '80168000000V0cM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338702', '80168000000V0c7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338698', '80168000000V0bn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338693', '80168000000V0bO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338691', '80168000000V0bE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338685', '80168000000V0ak', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338673', '80168000000V0Zm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338659', '80168000000V0Ye', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338655', '80168000000V0YK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338652', '80168000000V0Y5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338650', '80168000000V0Xv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338648', '80168000000V0Xl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338644', '80168000000V0XH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338640', '80168000000V0Wx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338620', '80168000000V0VB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338616', '80168000000V0Ur', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338597', '80168000000V0Sq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338591', '80168000000V0SC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338576', '80168000000V0QV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338567', '80168000000V0Pc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338564', '80168000000V0PN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338562', '80168000000V0P3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338553', '80168000000V0OF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338551', '80168000000V0O5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338546', '80168000000V0Nl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338543', '80168000000V0NM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338533', '80168000000V0Md', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338486', '80168000000V0Iv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338485', '80168000000V0Iq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338473', '80168000000V0Hs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338464', '80168000000V0H9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338462', '80168000000V0Gz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338448', '80168000000V0Fw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338444', '80168000000V0FN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338443', '80168000000V0FD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338435', '80168000000V0EU', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338428', '80168000000V0Dl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338419', '80168000000V0D2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338416', '80168000000V0Cn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338405', '80168000000V0Bp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338390', '80168000000V0Ac', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338388', '80168000000V0AS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338385', '80168000000V0AD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338381', '80168000000V09t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338380', '80168000000V09o', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338367', '80168000000V08b', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338366', '80168000000V08W', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338362', '80168000000V08C', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338334', '80168000000V05c', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338323', '80168000000V04j', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338312', '80168000000V03l', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338310', '80168000000V03b', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338308', '80168000000V03R', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338305', '80168000000V037', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338286', '80168000000V01Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338280', '80168000000V00w', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338272', '80168000000V008', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338262', '80168000000UzzK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338253', '80168000000Uzyb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338250', '80168000000UzyM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338220', '80168000000UzSW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338206', '80168000000UzRO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338199', '80168000000UzQp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338197', '80168000000UzQf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338196', '80168000000UzQa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338191', '80168000000UzQG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338189', '80168000000UzQ6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338183', '80168000000UzPc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338181', '80168000000UzPS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338171', '80168000000UzOe', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338168', '80168000000UzOP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338166', '80168000000UzOF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338159', '80168000000UzNg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338154', '80168000000UzNH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338151', '80168000000UzN2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338140', '80168000000UzM9', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338136', '80168000000UzLp', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338134', '80168000000UzLH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338127', '80168000000UzLB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338117', '80168000000UzKS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338116', '80168000000UzKN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338104', '80168000000UzIc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338103', '80168000000UzJP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338095', '80168000000UzIl', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338088', '80168000000UzIC', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338085', '80168000000UzHx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338079', '80168000000UzHT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338073', '80168000000UzGz', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338069', '80168000000UzGk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338067', '80168000000UzGa', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338062', '80168000000UzGB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338061', '80168000000UzG6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338056', '80168000000UzFh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338050', '80168000000UzFD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338042', '80168000000UzEZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338032', '80168000000UzDq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338025', '80168000000UzDH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338019', '80168000000UzCn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00338001', '80168000000UzB1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337987', '80168000000Uz9Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337982', '80168000000Uz9A', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337966', '80168000000Uz7s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337963', '80168000000Uz7d', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337951', '80168000000Uz6a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337937', '80168000000Uz5N', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337934', '80168000000Uz58', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337923', '80168000000Uz4A', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337913', '80168000000Uz3M', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337909', '80168000000Uz32', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337902', '80168000000Uz2T', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337876', '80168000000Uz0D', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337857', '80168000000Uyyg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337831', '80168000000UywL', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337826', '80168000000Uyvr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337824', '80168000000Uytm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337818', '80168000000Uyv8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337795', '80168000000UytH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337774', '80168000000UyrQ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337765', '80168000000Uyqc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337750', '80168000000UypP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337739', '80168000000UyoH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337731', '80168000000Uynd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337726', '80168000000UynE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337712', '80168000000Uym1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337692', '80168000000UykP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337691', '80168000000UykK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337688', '80168000000Uyk5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337677', '80168000000Uyj2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337675', '80168000000Uyis', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337651', '80168000000Uygw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337648', '80168000000Uygh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337629', '80168000000UyfA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337604', '80168000000UyBi', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337602', '80168000000UyBY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337585', '80168000000UyAB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337584', '80168000000UyA6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337568', '80168000000Uy8t', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337564', '80168000000Uy8Z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337554', '80168000000Uy7q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337545', '80168000000Uy77', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337540', '80168000000Uy6i', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337538', '80168000000Uy6Y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337534', '80168000000Uy6E', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337502', '80168000000Uy3e', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337498', '80168000000Uy3K', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337496', '80168000000Uy3A', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337492', '80168000000Uy2q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337485', '80168000000Uy2H', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337484', '80168000000Uy2C', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337482', '80168000000Uy22', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337480', '80168000000Uy1s', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337472', '80168000000Uy1E', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337469', '80168000000Uy0z', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337463', '80168000000Uy0a', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337455', '80168000000Uxzw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337453', '80168000000Uxzm', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337450', '80168000000UxzX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337446', '80168000000UxzI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337433', '80168000000UxyF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337428', '80168000000Uxxv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337422', '80168000000UxxR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337412', '80168000000Uxwd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337392', '80168000000Uxv1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337389', '80168000000Uxum', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337386', '80168000000UxuX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337377', '80168000000Uxto', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337376', '80168000000Uxtj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337354', '80168000000Uxrx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337337', '80168000000Uxqk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337316', '80168000000Uxp3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337307', '80168000000UxoK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337290', '80168000000Uxmx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337260', '80168000000UxlB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337257', '80168000000Uxkw', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337246', '80168000000Uxk3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337240', '80168000000UxjZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337235', '80168000000UxjA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337228', '80168000000Uxib', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337221', '80168000000Uxi2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337198', '80168000000UxgG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337193', '80168000000Uxfr', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337183', '80168000000Uxf3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337179', '80168000000Uxej', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337175', '80168000000Uxdn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337169', '80168000000Uxe5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337158', '80168000000UxdM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337152', '80168000000Uxcs', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337141', '80168000000Uxc4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337125', '80168000000Uxar', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337121', '80168000000UxaX', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337110', '80168000000UxZe', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337096', '80168000000UxYg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337093', '80168000000UxYR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337092', '80168000000UxYM', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337089', '80168000000UxY7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337088', '80168000000UxY2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337074', '80168000000UxWu', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337071', '80168000000UxWf', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337069', '80168000000UxWV', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337063', '80168000000UxW6', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337044', '80168000000UxUZ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337009', '80168000000Ux0E', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00337005', '80168000000Uwx7', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336994', '80168000000UwzB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336987', '80168000000Uwyc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336974', '80168000000Uwxe', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336970', '80168000000UwxK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336969', '80168000000UwxF', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336968', '80168000000UwxA', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336951', '80168000000Uwvn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336945', '80168000000UwvJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336917', '80168000000Uwt8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336897', '80168000000UwrW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336884', '80168000000UwqT', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336882', '80168000000UwqJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336881', '80168000000UwqE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336879', '80168000000Uwq4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336852', '80168000000Uwnt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336851', '80168000000Uwno', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336845', '80168000000UwnK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336823', '80168000000UwlY', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336814', '80168000000Uwku', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336786', '80168000000Uwie', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336777', '80168000000Uwi0', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336772', '80168000000Uwhb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336764', '80168000000Uwgx', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336760', '80168000000Uwgd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336757', '80168000000UwgO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336749', '80168000000Uwfk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336739', '80168000000Uwf1', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336730', '80168000000UweI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336729', '80168000000UweD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336719', '80168000000UwdP', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336710', '80168000000Uwcg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336684', '80168000000Uw7R', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336678', '80168000000Uw6x', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336674', '80168000000Uw6d', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336669', '80168000000Uw6E', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336663', '80168000000Uw5k', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336659', '80168000000Uw5Q', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336655', '80168000000Uw56', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336653', '80168000000Uw4w', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336645', '80168000000Uw4I', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336635', '80168000000Uw3U', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336630', '80168000000Uw35', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336619', '80168000000Uw27', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336603', '80168000000Uw0f', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336601', '80168000000Uw0V', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336599', '80168000000Uw0L', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336591', '80168000000Uvzc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336587', '80168000000UvzN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336582', '80168000000Uvz3', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336578', '80168000000Uvye', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336572', '80168000000Uvxq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336567', '80168000000UvxR', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336559', '80168000000Uvwn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336545', '80168000000Uvva', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336535', '80168000000Uvum', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336533', '80168000000Uvuc', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336526', '80168000000Uvu8', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336517', '80168000000UvtK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336501', '80168000000Uvs2', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336487', '80168000000Uvqk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336481', '80168000000UvqG', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336470', '80168000000UvpS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336467', '80168000000UvpD', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336458', '80168000000UvoK', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336449', '80168000000Uvnb', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336446', '80168000000UvnH', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336422', '80168000000Uvjj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336394', '80168000000UvgB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336387', '80168000000UvfN', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336367', '80168000000Uvdg', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336355', '80168000000Uvci', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336351', '80168000000UvcO', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336333', '80168000000Uv9x', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336317', '80168000000Uv7J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336300', '80168000000Uv7X', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336283', '80168000000Uv6A', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336272', '80168000000Uv5M', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336259', '80168000000Uv4J', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336256', '80168000000Uv44', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336253', '80168000000Uv3p', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336246', '80168000000Uv3G', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336243', '80168000000Uv31', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336230', '80168000000Uv1y', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336214', '80168000000Uv0g', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336208', '80168000000Uv0C', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336194', '80168000000Uux4', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336128', '80168000000Uury', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336126', '80168000000Uurj', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336109', '80168000000UupJ', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336088', '80168000000Uumt', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336070', '80168000000Uukd', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336065', '80168000000UukE', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336059', '80168000000Uujk', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336024', '80168000000Uuh5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00336021', '80168000000Uugq', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335987', '80168000000Uudh', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335962', '80168000000UubW', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335936', '80168000000UuZB', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335872', '80168000000UuTI', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335858', '80168000000UuS5', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335841', '80168000000UuQn', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00335811', '80168000000UuLv', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, eshop_id, eshop_name, '0', sysdate);


    commit;
end;