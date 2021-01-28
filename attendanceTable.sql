CREATE user attendance
	IDENTIFIED BY attendance
;

SELECT * FROM user_role_privs;
GRANT CONNECT,RESOURCE TO attendance;
SELECT TO_NUMBER(TO_CHAR(SYSDATE,'yyyy'),'9999') from dual;

 - TO_NUMBER(TO_CHAR(birthday,'yyyy'),'9999') 

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
	name VARCHAR2(20) NOT NULL
);

CREATE TABLE authority_type
(
	code NUMBER(1) CONSTRAINT authority_type_code_pk PRIMARY KEY,
	type VARCHAR2(6) NOT NULL
);

CREATE TABLE employee_list
(
	employeeid NUMBER(7) CONSTRAINT employeeList_id_pk PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	pass VARCHAR2(30) NOT NULL,
	cardid VARCHAR2(20) NOT NULL,
	usertype NUMBER(1) NOT NULL CONSTRAINT employee_list_usertype_fk REFERENCES authority_type(code)
);

CREATE TABLE user_age
(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	age NUMBER(3)
)

CREATE TABLE employee_secret
(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	birthday date CONSTRAINT secret_birthday CHECK(TO_NUMBER(TO_CHAR(SYSDATE,'yyyy'),'9999') >= 16),
	secret_problem VARCHAR2(20) NOT NULL,
	secret_answer VARCHAR2(40) NOT NULL
);

CREATE TABLE assignment
(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	depertment_code NUMBER(4) NOT NULL CONSTRAINT assignment_dcode_fk REFERENCES department(code),
	departmentname VARCHAR2(10) NOT NULL CONSTRAINT assignment_dname_fk REFERENCES(name)
);

CREATE TABLE work_table

	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	work_day date,
	attendance date,
	goouttime date,
	returntime date,
	leaveWork date 
);
