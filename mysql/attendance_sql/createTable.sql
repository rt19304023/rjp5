CREATE TABLE department
(
	code int UNSIGNED PRIMARY KEY,
	name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE employee_list
(
	employeeid int UNSIGNED PRIMARY KEY auto_increment,
	name VARCHAR(30) NOT NULL,
	pass VARCHAR(30) NOT NULL,
	cardid VARCHAR(20) NOT NULL,
	department_code int UNSIGNED NOT NULL,
	secret_code int UNSIGNED DEFAULT 0 NOT NULL CHECK(secret_code IN(1,0)),
	
	CONSTRAINT employeeList_departmentCode_fk
		FOREIGN KEY department_code(department_code)
		REFERENCES department(code) ON DELETE CASCADE
)AUTO_INCREMENT=1000;

CREATE TABLE employee_secret
(
	employeeid int UNSIGNED PRIMARY KEY,
	birthday date,
	secret_problem VARCHAR(20) NOT NULL,
	secret_answer VARCHAR(40) NOT NULL
);

CREATE TABLE assignment
(
	employeeid int UNSIGNED PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	department_code int UNSIGNED NOT NULL,
	
	CONSTRAINT assignment_dcode_fk 
	FOREIGN KEY department_code(department_code)
	REFERENCES department(code) ON DELETE CASCADE
);

CREATE TABLE time_sheets
(
	employeeid int UNSIGNED,
	work_day datetime,
	attendance datetime,
	goouttime datetime,
	returntime datetime,
	leaveWork datetime,
	
	 CONSTRAINT time_id_fk
	 FOREIGN KEY employeeid(employeeid)
	 REFERENCES employee_list(employeeid) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW time_per_month
AS
	SELECT employeeid, DATE_FORMAT(work_day,'%Y-%c') as month, SUM(((leaveWork - attendance) - (returntime - goouttime)) * 24) as attendant
	FROM time_sheets GROUP BY employeeid, DATE_FORMAT(work_day,'%Y-%c')
	ORDER BY employeeid, DATE_FORMAT(work_day,'%Y-%c');

CREATE OR REPLACE VIEW dept_total_time
AS
	SELECT assignment.employeeid emp_id, assignment.name, assignment.department_code as dep_code,
	department.name as dep_name,month, attendant
	FROM assignment 
		JOIN department 
		ON assignment.department_code = department.code 
		JOIN time_per_month
		ON assignment.employeeid = time_per_month.employeeid
	ORDER BY emp_id asc, month asc;

CREATE OR REPLACE VIEW secret_select
AS
	SELECT secret.employeeid as employeeid, DATE_FORMAT(birthday,'%Y-%c-%d') as birthday,
	secret_problem,secret_answer,department_code 
	FROM employee_secret secret
		JOIN employee_list list
		ON secret.employeeid = list.employeeid;

CREATE OR REPLACE VIEW time_select
AS
	SELECT employeeid,DATE_FORMAT(work_day,'%Y-%c-%d') as work_day,DATE_FORMAT(attendance,'%H:%i') as attendance,
	DATE_FORMAT(goouttime,'%H:%i') as goouttime,DATE_FORMAT(returntime,'%H:%i') as returntime,DATE_FORMAT(leaveWork,'%H:%i') as leaveWork,DATE_FORMAT(work_day,'%m') as month
	FROM time_sheets
	ORDER BY month asc, employeeid asc,work_day asc;

CREATE OR REPLACE VIEW list_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name,
	cardid, department_code, department.name as department_name
	FROM employee_list JOIN department ON employee_list.department_code = department.code;

CREATE OR REPLACE VIEW login_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name, pass,
	department.code as department_code, department.name as department_name,secret_code
	FROM employee_list JOIN department
	ON employee_list.department_code = department.code
	ORDER BY department_code,employeeid asc;

INSERT INTO department values(0001,'システム部技術課');
INSERT INTO department values(0002,'システム部開発課');
INSERT INTO department values(0003,'人事部人事課');
INSERT INTO department values(0004,'人事部経理課');
INSERT INTO department values(0005,'総務部総務課');
INSERT INTO department values(0006,'総務部広報課');
INSERT INTO department values(0007,'総務部施設管理課');
INSERT INTO department values(0008,'営業部営業1課');
INSERT INTO department values(0009,'営業部営業2課');
INSERT INTO department values(0010,'食品部加工課');
INSERT INTO department values(0011,'食品部研究課');
INSERT INTO department values(0012,'食品部出荷課');

INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(1000,'tanaka','testpass','0000',0001,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(0,'sunagawa','testpass','0000',0002,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(0,'sanada','testpass','0000',0003,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(0,'katou','testpass','0000',0004,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(0,'kusunoki','testpass','0000',0005,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code,secret_code) VALUES(0,'tanaka','testpass','0000',0006,1);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'kimura','testpass','0000',0007);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'tanaka','testpass','0000',0008);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'sunagawa','testpass','0000',0009);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'sanada','testpass','0000',0010);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'katou','testpass','0000',0011);
INSERT INTO employee_list(employeeid,name,pass,cardid,department_code) VALUES(0,'kusunoki','testpass','0000',0012);

INSERT INTO assignment VALUES(1000,'tanaka',0001);
INSERT INTO assignment VALUES(1001,'sunagawa',0002);
INSERT INTO assignment VALUES(1002,'sanada',0003);
INSERT INTO assignment VALUES(1003,'katou',0004);
INSERT INTO assignment VALUES(1004,'kusunoki',0005);
INSERT INTO assignment VALUES(1005,'tanaka',0006);
INSERT INTO assignment VALUES(1006,'kimura',0007);
INSERT INTO assignment VALUES(1007,'tanaka',0008);
INSERT INTO assignment VALUES(1008,'sunagawa',0009);
INSERT INTO assignment VALUES(1009,'sanada',0010);
INSERT INTO assignment VALUES(1010,'katou',0011);
INSERT INTO assignment VALUES(1011,'kusunoki',0012);

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1007,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1008,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1009,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1010,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1011,STR_TO_DATE('2020-11-28','%Y-%c-%d'),STR_TO_DATE('2020-11-28 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-28 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1010,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1011,STR_TO_DATE('2020-11-30','%Y-%c-%d'),STR_TO_DATE('2020-11-30 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-11-30 13:00','%Y-%c-%d %H:%i')STR_TO_DATE('2020-11-30 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1007,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1008,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1009,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1010,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1011,STR_TO_DATE('2020-12-01','%Y-%c-%d'),STR_TO_DATE('2020-12-01 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-01 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1007,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1008,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1009,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1010,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1011,STR_TO_DATE('2020-12-02','%Y-%c-%d'),STR_TO_DATE('2020-12-02 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-02 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-12-03','%Y-%c-%d'),STR_TO_DATE('2020-12-03 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-03 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1007,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1008,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1009,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1010,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));

INSERT INTO time_sheets VALUES(1000,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1001,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1002,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1003,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1004,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1005,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));
INSERT INTO time_sheets VALUES(1006,STR_TO_DATE('2020-12-04','%Y-%c-%d'),STR_TO_DATE('2020-12-04 09:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 12:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 13:00','%Y-%c-%d %H:%i'),STR_TO_DATE('2020-12-04 18:00','%Y-%c-%d %H:%i'));

INSERT INTO employee_secret VALUES(1000,'1995-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1001,'2000-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1002,'2003-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1003,'1997-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1004,'1994-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1005,'1990-12-23','テスト問題','テスト回答');
INSERT INTO employee_secret VALUES(1006,'1989-12-23','テスト問題','テスト回答');

SELECT employeeid, work_day,DATE_FORMAT(attendance,'%H:%i'),DATE_FORMAT(goouttime,'%H:%i'),DATE_FORMAT(returntime,'%H:%i'),DATE_FORMAT(leaveWork,'%H:%i') FROM time_sheets;

SHOW tables;

SELECT * FROM department;
SELECT * FROM employee_list;
SELECT * FROM employee_secret;
SELECT * FROM assignment;
SELECT * FROM time_sheets;
SELECT * FROM time_per_month;
SELECT * FROM dept_total_time;
SELECT * FROM secret_select;
SELECT * FROM time_select;
SELECT * FROM list_select;

commit;


-- UPDATE assignment SET name = kusunoki, department_code = 4 WHERE employeeid = 1004;

-- UPDATE time_sheets SET employeeid = 1006, work_day = TO_DATE('20-12-04','YY-MM-DD');

--UPDATE time_sheets SET attendance = TO_DATE('10:00','HH24:MI') WHERE employeeid = 1006 AND work_day = TO_DATE('2020-12-03','RRRR-MM-DD');
