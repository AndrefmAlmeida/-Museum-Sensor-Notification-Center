/*
Tipo: 'Administrador','ChefeSeguranca','DiretorMuseu','Seguranca','Auditor','Sensor','Migracao'
Roles: 'admin','cs','dm','seg','aud','sen','mig'
*/

/* Role admin */
DROP ROLE IF EXISTS 'admin';
CREATE ROLE 'admin';


GRANT ALL ON grupo21_museuorigem.alertas TO 'admin';
GRANT SELECT ON grupo21_museuorigem.medicoes_sensores TO 'admin';
GRANT SELECT ON grupo21_museuorigem.ronda TO 'admin';
GRANT SELECT ON grupo21_museuorigem.rondaextra TO 'admin';
GRANT ALL ON grupo21_museuorigem.sistema TO 'admin';
GRANT ALL ON grupo21_museuorigem.utilizador TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_alertas TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_consulta_utilizadores TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_medicoes_sensores TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_ronda TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_rondaextra TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_sistema TO 'admin';
GRANT SELECT ON grupo21_museuorigem.log_utilizador TO 'admin';
GRANT ALL ON grupo21_museudestino.* TO 'admin';

GRANT EXECUTE ON procedure grupo21_museuorigem.criarUtilizador TO 'admin';
GRANT EXECUTE ON procedure grupo21_museuorigem.removerUtilizador TO 'admin';
GRANT EXECUTE ON procedure grupo21_museuorigem.consultarUtilizadores TO 'admin';
GRANT EXECUTE ON procedure grupo21_museuorigem.editarUtilizador TO 'admin';

GRANT UPDATE ON mysql.user TO 'admin';
GRANT UPDATE ON grupo21_museuorigem.utilizador TO 'admin';

DROP USER IF EXISTS 'administrador'@'localhost';
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'pass';
GRANT 'admin' to 'administrador'@'localhost';
SET DEFAULT ROLE 'admin' FOR 'administrador'@'localhost';

/* Role cs */
DROP ROLE IF EXISTS 'cs';
CREATE ROLE 'cs';


GRANT SELECT ON grupo21_museuorigem.alertas TO 'cs';
GRANT SELECT ON grupo21_museuorigem.medicoes_sensores TO 'cs';
GRANT ALL ON grupo21_museuorigem.ronda TO 'cs';
GRANT SELECT ON grupo21_museuorigem.rondaextra TO 'cs';
GRANT UPDATE ON grupo21_museuorigem.rondaextra TO 'cs';
GRANT DELETE ON grupo21_museuorigem.rondaextra TO 'cs';
GRANT SELECT ON grupo21_museuorigem.sistema TO 'cs';
GRANT SELECT ON grupo21_museuorigem.utilizador TO 'cs';

GRANT EXECUTE ON procedure grupo21_museuorigem.consultarUtilizadores TO 'cs';
GRANT EXECUTE ON procedure grupo21_museuorigem.editarUtilizador TO 'cs';

GRANT UPDATE ON mysql.user TO 'cs';
GRANT UPDATE ON grupo21_museuorigem.utilizador TO 'cs';

DROP USER IF EXISTS 'chefeseg'@'localhost';
CREATE USER 'chefeseg'@'localhost' IDENTIFIED BY 'pass';
GRANT 'cs' to 'chefeseg'@'localhost';
SET DEFAULT ROLE 'cs' FOR 'chefeseg'@'localhost';


/* Role dm */
DROP ROLE IF EXISTS 'dm';
CREATE ROLE 'dm';


GRANT SELECT ON grupo21_museuorigem.alertas TO 'dm';
GRANT SELECT ON grupo21_museuorigem.medicoes_sensores TO 'dm';
GRANT SELECT ON grupo21_museuorigem.ronda TO 'dm';
GRANT SELECT ON grupo21_museuorigem.rondaextra TO 'dm';
GRANT SELECT ON grupo21_museuorigem.sistema TO 'dm';
GRANT UPDATE ON grupo21_museuorigem.sistema TO 'dm';
GRANT SELECT ON grupo21_museuorigem.utilizador TO 'dm';

GRANT EXECUTE ON procedure grupo21_museuorigem.consultarUtilizadores TO 'dm';
GRANT EXECUTE ON procedure grupo21_museuorigem.editarUtilizador TO 'dm';

GRANT UPDATE ON mysql.user TO 'dm';
GRANT UPDATE ON grupo21_museuorigem.utilizador TO 'dm';

DROP USER IF EXISTS 'diretor'@'localhost';
CREATE USER 'diretor'@'localhost' IDENTIFIED BY 'pass';
GRANT 'dm' to 'diretor'@'localhost';
SET DEFAULT ROLE 'dm' FOR 'diretor'@'localhost';


/* Role seg */
DROP ROLE IF EXISTS 'seg';
CREATE ROLE 'seg';


GRANT UPDATE ON grupo21_museuorigem.ronda TO 'seg';
GRANT UPDATE ON grupo21_museuorigem.rondaextra TO 'seg';
GRANT INSERT ON grupo21_museuorigem.rondaextra TO 'seg';

GRANT EXECUTE ON procedure grupo21_museuorigem.editarUtilizador TO 'seg';

GRANT UPDATE ON mysql.* TO 'seg';
GRANT UPDATE ON grupo21_museuorigem.utilizador TO 'seg';
GRANT SELECT ON grupo21_museuorigem.utilizador TO 'seg';
GRANT CREATE ON mysql.* TO 'seg';

DROP USER IF EXISTS 'seguranca'@'localhost';
CREATE USER 'seguranca'@'localhost' IDENTIFIED BY 'pass';
GRANT 'seg' to 'seguranca'@'localhost';
SET DEFAULT ROLE 'seg' FOR 'seguranca'@'localhost';


/* Role aud */
DROP ROLE IF EXISTS 'aud';
CREATE ROLE 'aud';

GRANT SELECT ON grupo21_museudestino.* TO 'aud';

GRANT UPDATE ON mysql.user TO 'aud';
GRANT UPDATE ON grupo21_museuorigem.utilizador TO 'aud';

DROP USER IF EXISTS 'auditor'@'localhost';
CREATE USER 'auditor'@'localhost' IDENTIFIED BY 'pass';
GRANT 'aud' to 'auditor'@'localhost';
SET DEFAULT ROLE 'aud' FOR 'auditor'@'localhost';

/* Role sen */
DROP ROLE IF EXISTS 'sen';
CREATE ROLE 'sen';

GRANT INSERT ON grupo21_museuorigem.medicoes_sensores TO 'sen';

DROP USER IF EXISTS 'sensor'@'localhost';
CREATE USER 'sensor'@'localhost' IDENTIFIED BY 'pass';
GRANT 'sen' to 'sensor'@'localhost';
SET DEFAULT ROLE 'sen' FOR 'sensor'@'localhost';


/* Role mig */

DROP ROLE IF EXISTS 'mig';
CREATE ROLE 'mig';

GRANT SELECT ON grupo21_museuorigem.log_alertas TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_consulta_utilizadores TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_medicoes_sensores TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_ronda TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_rondaextra TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_sistema TO 'mig';
GRANT SELECT ON grupo21_museuorigem.log_utilizador TO 'mig';
GRANT INSERT ON grupo21_museudestino.* TO 'mig';

GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_alertas TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_consulta_utilizadores TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_medicoes_sensores TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_ronda TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_rondaextra TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_sistema TO 'mig';
GRANT EXECUTE ON procedure grupo21_museuorigem.export_log_utilizador TO 'mig';

DROP USER IF EXISTS 'migracao'@'localhost';
CREATE USER 'migracao'@'localhost' IDENTIFIED BY 'pass';
GRANT 'mig' to 'migracao'@'localhost';
SET DEFAULT ROLE 'mig' FOR 'migracao'@'localhost';
