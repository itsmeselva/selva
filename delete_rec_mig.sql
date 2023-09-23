CREATE OR REPLACE PACKAGE BODY XXGTMREP.MIGRATED_TRANSACTION_DEL_PKG
AS
    PROCEDURE DELETE_MIGRATED_DATA (
        P_TABLE_NAME            IN VARCHAR2 DEFAULT NULL,
        P_GTM_TRANSACTION_GID   IN VARCHAR2 DEFAULT NULL)
    IS
        v_start_time       TIMESTAMP;         --START_TIME FOR WHOLE EXECUTION
        v_end_time         TIMESTAMP;           --END TIME FOR WHOLE EXECUTION
        v_start_time1      TIMESTAMP;
        v_start_time2      TIMESTAMP;
        v_start_time3      TIMESTAMP;
        v_start_time4      TIMESTAMP;
        v_start_time5      TIMESTAMP;
        v_start_time6      TIMESTAMP;
        v_start_time7      TIMESTAMP;
        v_start_time8      TIMESTAMP;
        v_start_time9      TIMESTAMP;
        v_start_time10     TIMESTAMP;
        v_start_time11     TIMESTAMP;
        v_start_time12     TIMESTAMP;
        v_start_time13     TIMESTAMP;
        v_start_time14     TIMESTAMP;
        v_start_time15     TIMESTAMP;
        v_start_time16     TIMESTAMP;
        v_start_time17     TIMESTAMP;
        v_start_time18     TIMESTAMP;
        v_start_time19     TIMESTAMP;
        v_end_time1        TIMESTAMP;
        v_end_time2        TIMESTAMP;
        v_end_time3        TIMESTAMP;
        v_end_time4        TIMESTAMP;
        v_end_time5        TIMESTAMP;
        v_end_time6        TIMESTAMP;
        v_end_time7        TIMESTAMP;
        v_end_time8        TIMESTAMP;
        v_end_time9        TIMESTAMP;
        v_end_time10       TIMESTAMP;
        v_end_time11       TIMESTAMP;
        v_end_time12       TIMESTAMP;
        v_end_time13       TIMESTAMP;
        v_end_time14       TIMESTAMP;
        v_end_time15       TIMESTAMP;
        v_end_time16       TIMESTAMP;
        v_end_time17       TIMESTAMP;
        v_end_time18       TIMESTAMP;
        v_end_time19       TIMESTAMP;
        v_record_count1    NUMBER;
        v_record_count2    NUMBER;
        v_record_count3    NUMBER;
        v_record_count4    NUMBER;
        v_record_count5    NUMBER;
        v_record_count6    NUMBER;
        v_record_count7    NUMBER;
        v_record_count8    NUMBER;
        v_record_count9    NUMBER;
        v_record_count10   NUMBER;
        v_record_count11   NUMBER;
        v_record_count12   NUMBER;
        v_record_count13   NUMBER;
        v_record_count14   NUMBER;
        v_record_count15   NUMBER;
        v_record_count16   NUMBER;
        v_record_count17   NUMBER;
        v_record_count18   NUMBER;
        v_record_count19   NUMBER;
        v_db_name          VARCHAR2 (50);


        CURSOR c IS
            SELECT tr.gtm_transaction_gid
              FROM XXGTMREP.GTM_TRANSACTION         tr,
                   XXGTMREP.gtm_transaction_Status  gtls
             WHERE     1 = 1
                   AND gtls.gtm_transaction_gid = tr.gtm_transaction_gid
--                   AND tr.gtm_transaction_gid IN
--                           ('CTO/WPR.20734549',
--                            'CTO/WPR.20729724',
--                            'CTO/WPR.20705216')
                   AND gtls.STATUS_TYPE_GID = 'CTO/WPR.TS_STATUS'
                   AND gtls.status_value_gid = 'CTO/WPR.TS_STATUS_OPEN'
                   AND tr.DOMAIN_NAME IN ('CTO/WPR', 'CTO/MRKI')
                   AND tr.gtm_transaction_gid =
                       NVL (P_GTM_TRANSACTION_GID, tr.gtm_transaction_gid);
    BEGIN
        -- Get the database name
        SELECT ora_database_name INTO v_db_name FROM DUAL;

        DBMS_OUTPUT.PUT_LINE ('Database Name: ' || v_db_name);

        -- Print input parameters
        DBMS_OUTPUT.PUT_LINE (
            'Input Parameter - Table Name: ' || P_TABLE_NAME);
        DBMS_OUTPUT.PUT_LINE (
            'Input Parameter - Transaction GID: ' || P_GTM_TRANSACTION_GID);

        -- Initialize record count to zero
        -- Initialize record count to zero
        v_record_count1 := 0;
        v_record_count2 := 0;
        v_record_count3 := 0;
        v_record_count4 := 0;
        v_record_count5 := 0;
        v_record_count6 := 0;
        v_record_count7 := 0;
        v_record_count8 := 0;
        v_record_count9 := 0;
        v_record_count10 := 0;
        v_record_count11 := 0;
        v_record_count12 := 0;
        v_record_count13 := 0;
        v_record_count14 := 0;
        v_record_count15 := 0;
        v_record_count16 := 0;
        v_record_count17 := 0;
        v_record_count18 := 0;
        v_record_count19 := 0;
        -- Get the START Time for Whole Execution
        v_start_time := SYSTIMESTAMP;
        DBMS_OUTPUT.put_line (
               'Start Time for Whole Execution '
            || P_TABLE_NAME
            || ': '
            || TO_CHAR (v_start_time, 'DD-MON-YYYY HH24:MI:SS'));


        FOR r IN c
        LOOP
            IF P_TABLE_NAME IS NULL
            THEN
                SELECT COUNT (*)
                  INTO v_record_count1
                  FROM XXGTMREP.GTM_TRANSACTION_DATE
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                --                DBMS_OUTPUT.put_line (
                --                       'Record Count for XXGTMREP.GTM_TRANSACTION_DATE: '
                --                    || v_record_count);

                BEGIN
                    v_start_time1 := SYSTIMESTAMP;

                    DELETE FROM XXGTMREP.GTM_TRANSACTION_DATE
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time1 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_DATE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count2
                  FROM XXGTMREP.GTM_TRANSACTION_INVOLVED_PARTY
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;



                BEGIN
                    v_start_time2 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANSACTION_INVOLVED_PARTY
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;\
                    v_end_time2 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_INVOLVED_PARTY: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count3
                  FROM XXGTMREP.GTM_TRANSACTION_INV_LOCATION
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;



                BEGIN
                    v_start_time3 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANSACTION_INV_LOCATION
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time3 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_INV_LOCATION: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count4
                  FROM XXGTMREP.GTM_TRANSACTION_LINE_STATUS
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);


                BEGIN
                    v_start_time4 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANSACTION_LINE_STATUS
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time4 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_LINE_STATUS: '
                            || SQLERRM);
                END;


                SELECT COUNT (*)
                  INTO v_record_count5
                  FROM XXGTMREP.GTM_TRANSACTION_STATUS
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;


                BEGIN
                    v_start_time5 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANSACTION_STATUS
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time5 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_STATUS: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count6
                  FROM XXGTMREP.GTM_TRANSACTION_VALUE
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;



                BEGIN
                    v_start_time6 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANSACTION_VALUE
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time6 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_VALUE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count7
                  FROM XXGTMREP.GTM_TRANSACTION_REMARK
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;


                BEGIN
                    v_start_time7 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANSACTION_REMARK
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time7 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_REMARK: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count8
                  FROM XXGTMREP.GTM_TRANSLINE_REFNUM
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);



                BEGIN
                    v_start_time8 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANSLINE_REFNUM
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time8 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSLINE_REFNUM: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count9
                  FROM XXGTMREP.GTM_TRANS_LINE_CODE
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);


                BEGIN
                    v_start_time9 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_CODE
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time9 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_CODE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count10
                  FROM XXGTMREP.GTM_TRANS_LINE_INV_PARTY
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);



                BEGIN
                    v_start_time10 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_INV_PARTY
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time10 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_INV_PARTY: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count11
                  FROM XXGTMREP.GTM_TRANS_LINE_QUANTITY
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);


                BEGIN
                    v_start_time11 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_QUANTITY
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time11 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_QUANTITY: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count12
                  FROM XXGTMREP.GTM_TRANS_LINE_VALUE
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);



                BEGIN
                    v_start_time12 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_VALUE
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time12 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_VALUE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count13
                  FROM XXGTMREP.GTM_TRANS_REFNUM
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;



                BEGIN
                    v_start_time13 := SYSTIMESTAMP;


                    DELETE FROM XXGTMREP.GTM_TRANS_REFNUM
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time13 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_REFNUM: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count14
                  FROM XXGTMREP.GTM_TRANS_LINE_LICENSE
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);

                BEGIN
                    v_start_time14 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_LICENSE
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time14 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_LICENSE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count15
                  FROM XXGTMREP.GTM_TRANS_LINE_REMARK
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);



                BEGIN
                    v_start_time15 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TRANS_LINE_REMARK
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time15 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANS_LINE_REMARK: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count16
                  FROM XXGTMREP.GTM_TR_CONTROL_SCREEN
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);


                BEGIN
                    v_start_time16 := SYSTIMESTAMP;


                    DELETE FROM
                        XXGTMREP.GTM_TR_CONTROL_SCREEN
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time16 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TR_CONTROL_SCREEN: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count17
                  FROM XXGTMREP.GTM_TR_PROD_CLASSIFICATION
                 WHERE GTM_TRANSACTION_LINE_GID IN
                           (SELECT GTM_TRANSACTION_LINE_GID
                             FROM gtm_transaction_line
                            WHERE gtm_transaction_gid = r.gtm_transaction_gid);



                BEGIN
                    v_start_time17 := SYSTIMESTAMP;


                    DELETE FROM
                        GTM_TR_PROD_CLASSIFICATION
                          WHERE GTM_TRANSACTION_LINE_GID IN
                                    (SELECT GTM_TRANSACTION_LINE_GID
                                      FROM gtm_transaction_line
                                     WHERE gtm_transaction_gid =
                                           r.gtm_transaction_gid);

                    --                    COMMIT;
                    v_end_time17 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TR_PROD_CLASSIFICATION: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count18
                  FROM XXGTMREP.GTM_TRANSACTION_LINE
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;



                BEGIN
                    v_start_time18 := SYSTIMESTAMP;

                    DELETE FROM XXGTMREP.GTM_TRANSACTION_LINE
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time18 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION_LINE: '
                            || SQLERRM);
                END;



                SELECT COUNT (*)
                  INTO v_record_count19
                  FROM XXGTMREP.GTM_TRANSACTION
                 WHERE gtm_transaction_gid = r.gtm_transaction_gid;


                BEGIN
                    v_start_time19 := SYSTIMESTAMP;



                    DELETE FROM XXGTMREP.GTM_TRANSACTION
                          WHERE gtm_transaction_gid = r.gtm_transaction_gid;

                    --                    COMMIT;
                    v_end_time19 := SYSTIMESTAMP;
                EXCEPTION
                    WHEN OTHERS
                    THEN
                        DBMS_OUTPUT.put_line (
                               'Error deleting from XXGTMREP.GTM_TRANSACTION: '
                            || SQLERRM);
                END;



                ROLLBACK;
            ELSE
                -- Delete from the specified table
                --                V_START_TIME := SYSTIMESTAMP;

                EXECUTE IMMEDIATE   'DELETE FROM '
                                 || P_TABLE_NAME
                                 || ' WHERE gtm_transaction_gid = :1'
                    USING r.gtm_transaction_gid;

                ROLLBACK;
                -- Get the end
                v_end_time := SYSTIMESTAMP;
            --                COMMIT;

            END IF;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time1
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_DATE: '
            || v_record_count1
            || CHR (10)
            || 'End Time: '
            || v_end_time1
            || CHR (10));
        --            || 'Timestamp: '
        --            || TO_CHAR (SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time2
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_INVOLVED_PARTY: '
            || v_record_count2
            || CHR (10)
            || 'End Time: '
            || v_end_time2
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time3
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_INV_LOCATION: '
            || v_record_count3
            || CHR (10)
            || 'End Time: '
            || v_end_time3
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time4
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_LINE_STATUS: '
            || v_record_count4
            || CHR (10)
            || 'End Time: '
            || v_end_time4
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time5
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_STATUS: '
            || v_record_count5
            || CHR (10)
            || 'End Time: '
            || v_end_time5
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time6
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_VALUE: '
            || v_record_count6
            || CHR (10)
            || 'End Time: '
            || v_end_time6
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time7
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_REMARK: '
            || v_record_count7
            || CHR (10)
            || 'End Time: '
            || v_end_time7
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time8
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSLINE_REFNUM: '
            || v_record_count8
            || CHR (10)
            || 'End Time: '
            || v_end_time8
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time9
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_CODE: '
            || v_record_count9
            || CHR (10)
            || 'End Time: '
            || v_end_time9
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time10
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_INV_PARTY: '
            || v_record_count10
            || CHR (10)
            || 'End Time: '
            || v_end_time10
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time11
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_QUANTITY: '
            || v_record_count11
            || CHR (10)
            || 'End Time: '
            || v_end_time11
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time12
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_VALUE: '
            || v_record_count12
            || CHR (10)
            || 'End Time: '
            || v_end_time12
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time13
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_REFNUM: '
            || v_record_count13
            || CHR (10)
            || 'End Time: '
            || v_end_time13
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time14
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_LICENSE: '
            || v_record_count14
            || CHR (10)
            || 'End Time: '
            || v_end_time14
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time15
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANS_LINE_REMARK: '
            || v_record_count15
            || CHR (10)
            || 'End Time: '
            || v_end_time15
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time16
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TR_CONTROL_SCREEN: '
            || v_record_count16
            || CHR (10)
            || 'End Time: '
            || v_end_time16
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time17
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TR_PROD_CLASSIFICATION: '
            || v_record_count17
            || CHR (10)
            || 'End Time: '
            || v_end_time17
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time18
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION_LINE: '
            || v_record_count18
            || CHR (10)
            || 'End Time: '
            || v_end_time18
            || CHR (10));
        DBMS_OUTPUT.PUT_LINE (
               'Start Time: '
            || v_start_time19
            || CHR (10)
            || 'Record Count for XXGTMREP.GTM_TRANSACTION: '
            || v_record_count19
            || CHR (10)
            || 'End Time: '
            || v_end_time19
            || CHR (10));
        --            || 'Timestamp: '
        --            || TO_CHAR (SYSTIMESTAMP, 'DD-MON-YYYY HH24:MI:SS'));

        -- Get the end time for the whole execution
        v_end_time := SYSTIMESTAMP;
        DBMS_OUTPUT.put_line (
               'End Time for Whole Execution: '
            || TO_CHAR (v_end_time, 'DD-MON-YYYY HH24:MI:SS'));
    EXCEPTION
        WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE ('Error: ' || SQLERRM);
    END DELETE_MIGRATED_DATA;
END MIGRATED_TRANSACTION_DEL_PKG;
/

