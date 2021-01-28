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
 NUMBER(4) NOT NULL CONSTRAINT employeeList_departmentCode_fk REFERENCES department(code)
);
CREATE TABLE employee_secret
(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	birthday date ,
	secret_problem VARCHAR2(20) NOT NULL,
	secret_answer VARCHAR2(40) NOT NULL
);
CREATE TABLE assignment
(
	employeeid NUMBER(7) CONSTRAINT assignment_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	depertment_code NUMBER(4) NOT NULL CONSTRAINT assignment_dcode_fk REFERENCES department(code),
	department_name VARCHAR2(10) NOT NULL CONSTRAINT assignment_dname_fk REFERENCES department(name)
);
CREATE TABLE time_sheets
(
	employeeid NUMBER(7) CONSTRAINT time_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	work_day date,
	attendance date,
	goouttime date,
	returntime date,
	leaveWork date 
);

SELECT TABLE_NAME FROM USER_TABLES;