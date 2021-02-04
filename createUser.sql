
CREATE user attendance
	IDENTIFIED BY attendance
;

GRANT CONNECT,RESOURCE TO attendance;

ALTER USER attendance quota unlimited ON USERS;