
CREATE user attendance
	IDENTIFIED BY attendance
;

GRANT CONNECT,RESOURCE,CREATE VIEW TO attendance;

ALTER USER attendance quota unlimited ON USERS;