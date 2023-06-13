/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/

CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

CREATE TABLE IF NOT EXISTS mytable (
  col0 STRING,
  col1 DATE,
  col2 INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'data.tsv' INTO TABLE mytable;

SELECT col0, col1, col2
FROM mytable
ORDER BY col0, col2, col1;

SET hive.resultset.use.unique.column.names=false;
INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT col0, col1, col2
FROM mytable
ORDER BY col0, col2, col1;
