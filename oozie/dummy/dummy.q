DROP TABLE IF EXISTS landing.dummy;
CREATE EXTERNAL TABLE landing.dummy
(numb string,
 thou bigint,
 str string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LOCATION '/user/flume/processing/${WORKING_DIR}';

DROP TABLE IF EXISTS staging.dummy;
CREATE TABLE staging.dummy
(numb string,
 thou bigint,
 str string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

INSERT OVERWRITE TABLE staging.dummy
SELECT numb,thou,str FROM landing.dummy;

