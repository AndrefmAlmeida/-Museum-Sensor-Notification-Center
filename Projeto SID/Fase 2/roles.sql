drop role if exists 'admin';

CREATE ROLE 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON grupo36_mongodb.alerta TO 'admin';
GRANT SELECT, INSERT, UPDATE, DELETE ON grupo36_mongodb.medicoes_sensores TO 'admin';

drop user if exists 'andreadmin';
CREATE USER 'andreadmin' IDENTIFIED BY 'root';
GRANT 'admin' TO 'andreadmin';
SET DEFAULT ROLE 'admin' FOR 'andreadmin';