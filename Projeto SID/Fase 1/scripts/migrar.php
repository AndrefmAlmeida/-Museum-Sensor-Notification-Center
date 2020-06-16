<?php

$url = 'localhost';
$username = 'root';
$password = 'root';
$conn = mysqli_connect($url, $username, $password);
if (!$conn) {
die("ConnectionFailled: " . $conn->connect_error);
}


$sql1 = "INSERT INTO grupo21_museudestino.log_consulta_utilizadores
SELECT * FROM grupo21_museuorigem.log_consulta_utilizadores
WHERE grupo21_museuorigem.log_consulta_utilizadores.migrado = 0;
UPDATE grupo21_museuorigem.log_consulta_utilizadores 
SET grupo21_museuorigem.log_consulta_utilizadores.migrado=1 
WHERE grupo21_museuorigem.log_consulta_utilizadores.migrado=0; 

INSERT INTO grupo21_museudestino.log_alertas
SELECT * FROM grupo21_museuorigem.log_alertas
WHERE grupo21_museuorigem.log_alertas.migrado = 0;
UPDATE grupo21_museuorigem.log_alertas 
SET grupo21_museuorigem.log_alertas.migrado=1 
WHERE grupo21_museuorigem.log_alertas.migrado=0; 

INSERT INTO grupo21_museudestino.log_medicoes_sensores
SELECT * FROM grupo21_museuorigem.log_medicoes_sensores
WHERE grupo21_museuorigem.log_medicoes_sensores.migrado = 0;
UPDATE grupo21_museuorigem.log_medicoes_sensores 
SET grupo21_museuorigem.log_medicoes_sensores.migrado=1 
WHERE grupo21_museuorigem.log_medicoes_sensores.migrado=0;

INSERT INTO grupo21_museudestino.log_ronda
SELECT * FROM grupo21_museuorigem.log_ronda
WHERE grupo21_museuorigem.log_ronda.migrado = 0;
UPDATE grupo21_museuorigem.log_ronda 
SET grupo21_museuorigem.log_ronda.migrado=1 
WHERE grupo21_museuorigem.log_ronda.migrado=0;

INSERT INTO grupo21_museudestino.log_rondaextra
SELECT * FROM grupo21_museuorigem.log_rondaextra
WHERE grupo21_museuorigem.log_rondaextra.migrado = 0;
UPDATE grupo21_museuorigem.log_rondaextra 
SET grupo21_museuorigem.log_rondaextra.migrado=1 
WHERE grupo21_museuorigem.log_rondaextra.migrado=0;

INSERT INTO grupo21_museudestino.log_sistema
SELECT * FROM grupo21_museuorigem.log_sistema
WHERE grupo21_museuorigem.log_sistema.migrado = 0; 
UPDATE grupo21_museuorigem.log_sistema 
SET grupo21_museuorigem.log_sistema.migrado=1
WHERE grupo21_museuorigem.log_sistema.migrado=0; 

INSERT INTO grupo21_museudestino.log_utilizador
SELECT * FROM grupo21_museuorigem.log_utilizador
WHERE grupo21_museuorigem.log_utilizador.migrado = 0; 
UPDATE grupo21_museuorigem.log_utilizador 
SET grupo21_museuorigem.log_utilizador.migrado=1 
WHERE grupo21_museuorigem.log_utilizador.migrado=0;";



/* execute multi query */
	if (mysqli_multi_query($conn, $sql1)) {
        /* store first result set */
        if ($result1 = mysqli_use_result($conn)) {
            while ($row = mysqli_fetch_row($result1)) {
                printf("%s\n", $row[0]);
            }
            mysqli_free_result($result1);
        }
	}



mysqli_close($conn);

?>