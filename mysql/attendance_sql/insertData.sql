INSERT INTO attendance.department values(0001,'システム部技術課');
INSERT INTO attendance.department values(0002,'システム部開発課');
INSERT INTO attendance.department values(0003,'人事部人事課');
INSERT INTO attendance.department values(0004,'人事部経理課');
INSERT INTO attendance.department values(0005,'総務部総務課');
INSERT INTO attendance.department values(0006,'総務部広報課');
INSERT INTO attendance.department values(0007,'総務部施設管理課');
INSERT INTO attendance.department values(0008,'営業部営業1課');
INSERT INTO attendance.department values(0009,'営業部営業2課');
INSERT INTO attendance.department values(0010,'食品部加工課');
INSERT INTO attendance.department values(0011,'食品部研究課');
INSERT INTO attendance.department values(0012,'食品部出荷課');
INSERT INTO attendance.department values(0013,'ねこ出荷課');
INSERT INTO attendance.department values(0014,'ゴリラ飼育課');

INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('tanaka','testpass','0000',0001,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('sasaki','testpass','942931304868',0002,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('tamoto','testpass','1081554428514',0003,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('sakurai','testpass','185297986163',0004,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('nishimi','testpass','324809056554',0005,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('kita','testpass','736538714391',0006,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code,secret_code) VALUES('kimura','testpass','117904302638',0007,1);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('minami','testpass','323811205739',0008);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('sunagawa','testpass','598790431411',0009);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('nakatou','testpass','1012801659496',0010);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('katou','testpass','668918538849',0011);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('takatou','testpass','0000',0012);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('minase','testpass','0000',0013);
INSERT INTO attendance.employee_list(name,pass,cardid,department_code) VALUES('齋藤T','testpass','524786013679',0014);

INSERT INTO attendance.assignment VALUES(1000,'tanaka',0001);
INSERT INTO attendance.assignment VALUES(1001,'sasaki',0002);
INSERT INTO attendance.assignment VALUES(1002,'tamoto',0003);
INSERT INTO attendance.assignment VALUES(1003,'sakurai',0004);
INSERT INTO attendance.assignment VALUES(1004,'nishimi',0005);
INSERT INTO attendance.assignment VALUES(1005,'kita',0006);
INSERT INTO attendance.assignment VALUES(1006,'kimura',0007);
INSERT INTO attendance.assignment VALUES(1007,'minami',0008);
INSERT INTO attendance.assignment VALUES(1008,'sunagawa',0009);
INSERT INTO attendance.assignment VALUES(1009,'nakatou',0010);
INSERT INTO attendance.assignment VALUES(1010,'katou',0011);
INSERT INTO attendance.assignment VALUES(1011,'takatou',0012);
INSERT INTO attendance.assignment VALUES(1012,'minase',0013);
INSERT INTO attendance.assignment VALUES(1013,'齋藤T',0014);

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1007,323811205739,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1008,598790431411,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1009,1012801659496,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1010,668918538849,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1011,0000,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1012,0000,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1010,668918538849,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1011,0000,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1007,323811205739,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1008,598790431411,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1009,1012801659496,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1010,668918538849,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1011,0000,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1007,323811205739,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1008,598790431411,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1009,1012801659496,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1010,668918538849,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1011,0000,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1007,323811205739,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1008,598790431411,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1009,1012801659496,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1010,668918538849,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.time_sheets VALUES(1000,0000,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1001,942931304868,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1002,1081554428514,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1003,185297986163,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1004,324809056554,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1005,736538714391,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1006,117904302638,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));
INSERT INTO attendance.time_sheets VALUES(1013,524786013679,STR_TO_DATE('2020-12-07
','%Y-%c-%d'),STR_TO_DATE('2020-12-07 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-07 18:00','%Y-%c-%d %H:%i'));

INSERT INTO attendance.employee_secret VALUES(1000,'1995-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1001,'2000-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1002,'1993-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1003,'1997-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1004,'1994-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1005,'1990-12-23','テスト問題','テスト回答');
INSERT INTO attendance.employee_secret VALUES(1006,'1989-12-23','テスト問題','テスト回答');

SELECT employeeid, work_day,DATE_FORMAT(attendance,'%H:%i'),DATE_FORMAT(goouttime,'%H:%i'),DATE_FORMAT(returntime,'%H:%i'),DATE_FORMAT(leaveWork,'%H:%i') FROM time_sheets;


SHOW tables;


SELECT * FROM attendance.department ORDER BY code asc;
SELECT * FROM attendance.employee_list ORDER BY employeeid asc;
SELECT * FROM attendance.employee_secret ORDER BY employeeid asc;
SELECT * FROM attendance.assignment ORDER BY employeeid asc;
SELECT * FROM attendance.time_sheets ORDER BY employeeid asc,work_day asc;
SELECT * FROM attendance.time_per_month;
SELECT * FROM attendance.dept_total_time;
SELECT * FROM attendance.secret_select;
SELECT * FROM attendance.time_select;
SELECT * FROM attendance.list_select;

commit;