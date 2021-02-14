
CREATE DATABASE rjp CHARACTER SET utf8;
CREATE USER attendance IDENTIFIED BY 'attendance';
GRANT ALL ON *.* to attendance;
commit;
