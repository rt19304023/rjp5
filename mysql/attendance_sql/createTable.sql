CREATE TABLE attendance.department
(
	code int UNSIGNED PRIMARY KEY,
	name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE attendance.employee_list
(
	employeeid int UNSIGNED PRIMARY KEY auto_increment,
	name VARCHAR(30) NOT NULL,
	pass VARCHAR(30) NOT NULL,
	cardid VARCHAR(20) NOT NULL,
	department_code int UNSIGNED NOT NULL,
	secret_code int UNSIGNED DEFAULT 0 NOT NULL CHECK(secret_code IN(0,1)),
	
	CONSTRAINT employeeList_departmentCode_fk
		FOREIGN KEY department_code(department_code)
		REFERENCES department(code) ON DELETE CASCADE ON UPDATE CASCADE
)AUTO_INCREMENT=1000;

CREATE TABLE attendance.employee_secret
(
	employeeid int UNSIGNED PRIMARY KEY,
	birthday date,
	secret_problem VARCHAR(20) NOT NULL,
	secret_answer VARCHAR(40) NOT NULL
);

CREATE TABLE attendance.assignment
(
	employeeid int UNSIGNED PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	department_code int UNSIGNED NOT NULL,
	
	CONSTRAINT assignment_dcode_fk 
	FOREIGN KEY department_code(department_code)
	REFERENCES department(code) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE attendance.time_sheets
(
	employeeid int UNSIGNED REFERENCES employee_list(employeeid) ON DELETE CASCADE ON UPDATE CASCADE,
	cardid VARCHAR(20) NOT NULL REFERENCES employee_list(cardid) ON DELETE CASCADE ON UPDATE CASCADE,
	work_day datetime,
	attendance datetime,
	goouttime datetime,
	returntime datetime,
	leaveWork datetime,

	CONSTRAINT time_sheets_pk
	PRIMARY KEY(employeeid,work_day)
);

CREATE OR REPLACE VIEW attendance.time_per_month
AS
	SELECT employeeid, DATE_FORMAT(work_day,'%Y-%c') as month, SUM(TIMESTAMPDIFF(HOUR,attendance,leaveWork)-TIMESTAMPDIFF(HOUR,goouttime,returntime)) as attendant
	FROM time_sheets GROUP BY employeeid, DATE_FORMAT(work_day,'%Y-%c')
	ORDER BY employeeid, DATE_FORMAT(work_day,'%Y-%c');

CREATE OR REPLACE VIEW attendance.dept_total_time
AS
	SELECT assignment.employeeid emp_id, assignment.name, assignment.department_code as dep_code,
	department.name as dep_name,month, attendant
	FROM attendance.assignment 
		JOIN attendance.department 
		ON assignment.department_code = department.code  
		JOIN attendance.time_per_month
		ON assignment.employeeid = time_per_month.employeeid
	ORDER BY emp_id asc, month asc;

CREATE OR REPLACE VIEW attendance.secret_select
AS
	SELECT secret.employeeid as employeeid, DATE_FORMAT(birthday,'%Y/%c/%d') as birthday,
	secret_problem,secret_answer,department_code 
	FROM attendance.employee_secret secret
		JOIN attendance.employee_list list
		ON secret.employeeid = list.employeeid;

CREATE OR REPLACE VIEW attendance.time_select
AS
	SELECT employeeid,DATE_FORMAT(work_day,'%Y-%c-%d') as work_day,DATE_FORMAT(attendance,'%H:%i') as attendance,
	DATE_FORMAT(goouttime,'%H:%i') as goouttime,DATE_FORMAT(returntime,'%H:%i') as returntime,DATE_FORMAT(leaveWork,'%H:%i') as leaveWork,DATE_FORMAT(work_day,'%m') as month
	FROM time_sheets
	ORDER BY month asc, employeeid asc,work_day asc;

CREATE OR REPLACE VIEW attendance.list_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name,
	cardid, department_code, department.name as department_name
	FROM employee_list JOIN department ON employee_list.department_code = department.code;

CREATE OR REPLACE VIEW attendance.login_select
AS
	SELECT employee_list.employeeid as employeeid,employee_list.name as name, pass,
	department.code as department_code, department.name as department_name,secret_code
	FROM employee_list JOIN department
	ON employee_list.department_code = department.code
	ORDER BY department_code,employeeid asc;




-- UPDATE assignment SET name = kusunoki, department_code = 4 WHERE employeeid = 1004;

-- UPDATE time_sheets SET employeeid = 1006, work_day = TO_DATE('20-12-04','YY-MM-DD');

--UPDATE time_sheets SET attendance = TO_DATE('10:00','HH24:MI') WHERE employeeid = 1006 AND work_day = TO_DATE('2020-12-03','RRRR-MM-DD');


CREATE TABLE attendance.test_time_sheets
(
	employeeid int UNSIGNED REFERENCES employee_list(employeeid) ON DELETE CASCADE ON UPDATE CASCADE,
	cardid VARCHAR(20) NOT NULL REFERENCES employee_list(cardid) ON DELETE CASCADE ON UPDATE CASCADE,
	work_day datetime,
	attendance datetime,
	goouttime datetime,
	returntime datetime,
	leaveWork datetime,

	CONSTRAINT time_sheets_pk
	PRIMARY KEY(employeeid,work_day)
);
