
CREATE DATABASE attendance CHARACTER SET utf8;
CREATE USER attendance IDENTIFIED BY 'attendance';
GRANT ALL ON attendance.* to attendance;
commit;
