/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

CREATE TABLE IF NOT EXISTS mytable (
  col1 STRING,
  col2 DATE,
  col3 INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE mytable;

SELECT DISTINCT col3
FROM mytable
ORDER BY col3
LIMIT 5;

SET hive.resultset.use.unique.column.names=false;
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT DISTINCT col3
FROM mytable
ORDER BY col3
LIMIT 5;
