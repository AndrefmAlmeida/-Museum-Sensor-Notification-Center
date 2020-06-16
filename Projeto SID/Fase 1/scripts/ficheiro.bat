ECHO Start Measure %Time% >> C:/Users/Andre/Desktop/timer/ficheirotimer.txt

mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_consulta_utilizadores.csv' INTO table grupo21_museudestino.log_consulta_utilizadores COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_utilizador.csv' INTO table grupo21_museudestino.log_utilizador COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_alertas.csv' INTO table grupo21_museudestino.log_alertas COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_medicoes_sensores.csv' INTO table grupo21_museudestino.log_medicoes_sensores COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_ronda.csv' INTO table grupo21_museudestino.log_ronda COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_rondaextra.csv' INTO table grupo21_museudestino.log_rondaextra COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
mysql -e "LOAD data infile 'C:/xampp/tmp/export_log_sistema.csv' INTO table grupo21_museudestino.log_sistema COLUMNS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '\"' ESCAPED BY '\"' LINES TERMINATED BY '\r\n';" -u root -proot
cd..
cd C:/xampp/tmp
del /f export_log_consulta_utilizadores.csv
del /f export_log_alertas.csv
del /f export_log_medicoes_sensores.csv
del /f export_log_ronda.csv
del /f export_log_rondaextra.csv
del /f export_log_sistema.csv
del /f export_log_utilizador.csv

ECHO Stop Measure %Time% >> C:/Users/Andre/Desktop/timer/ficheirotimer.txt