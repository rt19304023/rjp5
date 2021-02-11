CREATE SEQUENCE employeeid
	START WITH 1000
	INCREMENT BY 1
	MINVALUE 1000
	MAXVALUE 9999999
	NOCYCLE
;
CREATE TABLE department
(
	code NUMBER(4) CONSTRAINT department_code_pk PRIMARY KEY,
	name VARCHAR2(20) NOT NULL CONSTRAINT department_name_uq UNIQUE
);
CREATE TABLE employee_list
(
	employeeid NUMBER(7) CONSTRAINT employeeList_id_pk PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	pass VARCHAR2(30) NOT NULL,
	cardid VARCHAR2(20) NOT NULL,
	department_code
 NUMBER(4) NOT NULL CONSTRAINT employeeList_departmentCode_fk REFERENCES department(code) ON DELETE CASCADE,
	secret_code NUMBER(1) DEFAULT 0 NOT NULL CHECK(secret_code IN(1,0))
);
CREATE TABLE employee_secret
(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid) ON DELETE CASCADE,
	birthday date ,
	secret_problem VARCHAR2(20) NOT NULL,
	secret_answer VARCHAR2(40) NOT NULL
);
CREATE TABLE assignment
(
	employeeid NUMBER(7) CONSTRAINT assignment_id_pk PRIMARY KEY REFERENCES employee_list(employeeid) ON DELETE CASCADE,
	name VARCHAR2(30) NOT NULL,
	department_code NUMBER(4) NOT NULL CONSTRAINT assignment_dcode_fk REFERENCES department(code) ON DELETE CASCADE
);
CREATE TABLE time_sheets
(
	employeeid NUMBER(7) CONSTRAINT time_id_fk  REFERENCES employee_list(employeeid) ON DELETE CASCADE,
	work_day date,
	attendance date,
	goouttime date,
	returntime date,
	leaveWork date
);

CREATE OR REPLACE VIEW time_per_month
AS
	SELECT employeeid, TO_CHAR(work_day,'RR-MM') as month, SUM(((leaveWork - attendance) - (returntime - goouttime)) * 24) as attendant
	FROM time_sheets GROUP BY employeeid, TO_CHAR(work_day,'RR-MM')
	ORDER BY employeeid, TO_CHAR(work_day,'RR-MM')
WITH READ ONLY;

CREATE OR REPLACE VIEW dept_total_time
AS
	SELECT assignment.employeeid emp_id, assignment.name, assignment.department_code as dep_code,
	department.name as dep_name,month, attendant
	FROM assignment 
		JOIN department 
		ON assignment.department_code = department.code 
		JOIN time_per_month
		ON assignment.employeeid = time_per_month.employeeid
	ORDER BY emp_id asc, month asc
WITH READ ONLY;

CREATE OR REPLACE VIEW secret_select
AS
	SELECT secret.employeeid as employeeid, TO_CHAR(birthday,'RRRR-MM-dd') as birthday,
	secret_problem,secret_answer,department_code 
	FROM employee_secret secret
		JOIN employee_list list
		ON secret.employeeid = list.employeeid
WITH READ ONLY;

CREATE OR REPLACE VIEW time_select
AS
	SELECT employeeid,TO_CHAR(work_day,'RRRR-MM-dd') as work_day,TO_CHAR(attendance,'HH24:MI') as attendance,
	TO_CHAR(goouttime,'HH24:MI') as goouttime,TO_CHAR(returntime,'HH24:MI') as returntime,TO_CHAR(leaveWork,'HH24:MI') as leaveWork,TO_CHAR(work_day,'MM') as month
	FROM time_sheets
	ORDER BY month asc, employeeid asc,work_day asc
WITH READ ONLY;

CREATE OR REPLACE VIEW list_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name,
	cardid, department_code, department.name as department_name
	FROM employee_list JOIN department ON employee_list.department_code = department.code
WITH READ ONLY;

CREATE OR REPLACE VIEW login_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name,pass,
	department.code as department_code, department.name as department_name,secret_code
	FROM employee_list JOIN department
	ON employee_list.department_code = department.code
	ORDER BY department_code,employeeid asc
WITH READ ONLY;

commit;

