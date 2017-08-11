drop database if exists alin;
create database alin;
use alin;

CREATE TABLE TEST_AREA (
  id          BIGINT AUTO_INCREMENT PRIMARY KEY,
  begindate   VARCHAR(8),
  enddate     VARCHAR(8),
  str_code    VARCHAR(8),
  str_name    VARCHAR(128),
  area_code   VARCHAR(8),
  area_name   VARCHAR(32),
  create_date DATE,
  create_id   VARCHAR(8),
  STATUS      BIGINT,
  update_time DATE
) CHARSET=utf8 ENGINE=INNODB;
SELECT * from TEST_AREA;
