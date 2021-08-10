declare
    next_id INTEGER;
    c1_id INTEGER;
    c1_name VARCHAR2(250);
begin
    select rid, rname into c1_id, c1_name from soa_cfg_owner.order_status_recipient WHERE rstatus = 0 and rname = '1C' and ROWNUM = 1;

    select SOA_CFG_OWNER.ORDER_STATUS_QUE_SEQ.NEXTVAL into next_id from dual;
    Insert into SOA_CFG_OWNER.ORDER_STATUS_QUE (QID, ORDERNUMBER, ORDERID, STATUS, SUBSTATUS, INDATE) 
    values (next_id, '00353807', '80168000000VbRS', 'Completed', 'Completed', sysdate);
    Insert into
    SOA_CFG_OWNER.ORDER_STATUS_PROCESS
        (PRID, QID, RID, RIDNAME, STATUSS, PROCESSED)
    values
        (SOA_CFG_OWNER.ORDER_STATUS_PROCESS_SEQ.NEXTVAL, next_id, c1_id, c1_name, '0', sysdate);

    commit;
end;