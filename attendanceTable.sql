CREATE user attendance(
	IDENTIFIED BY attendance
);

CREATE SEQUENCE employeeid(
	START WITH 1000
	INCREMENT BY 1
	MINVALUE 1000
	MAXVALUE 9999999
	NOCYCLE
);

CREATE TABLE department(
	depertmentCode NUMBER(4) CONSTRAINT department_code_pk PRIMARY KEY,
	depertmentname VARCHAR2(20)	NOT NULL
);

CREATE TABLE authority_type(
	code NUMBER(1) NOT NULL,
	authoritytype VARCHAR2(6) NOT NULL
);

CRETAE TABLE employee_list(
	employeeid NUMBER(7) CONSTRAINT employeeList_id_pk PRIMARY KEY,
	name VARCHAR2(30) NOT NULL,
	pass VARCHAR2(30) NOT NULL,
	cardid VARCHAR2(20) NOT NULL,
	usertype NUMBER(1) NOT NULL CONSTRAINT employee_list_usertype_fk REFERENCES authority_type(code)
);

CREATE TABLE employee_secret(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
	birthday date CONSTRAINT secret_birthday(to_date(SYSDATE,'yyyy') - to_date(birthday,'yyyy') >= 16),
	secret_problem VARCHAR2(20) NOT NULL,
	secret_answer VARCHAR2(40) NOT NULL
);

CREATE TABLE assignment(
	employeeid NUMBER(7) CONSTRAINT secret_id_pk PRIMARY KEY REFERENCES employee_list(employeeid),
)
