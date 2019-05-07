CREATE DATABASE employed_db;

USE employed_db;

CREATE TABLE employed(
    id INT(11) NOT NULL,
    name VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    job VARCHAR(20) NOT NULL,
    mail VARCHAR(20) NOT NULL,
    age INT(2) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phone VARCHAR(11) NOT NULL
);
ALTER TABLE employed
    ADD PRIMARY KEY (id);

ALTER TABLE employed
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT= 1;

DESCRIBE employed;
LOCK TABLES employed WRITE;
INSERT INTO employed VALUES (1, 'Constanza', 'Arancibia', 'Desarrollador', 'carancibia@example.com',25, 'Av. Ossa 347', '56984256354'), (2, 'Jose', 'Gutierrez', 'Desarrollador', 'jgutierrez@example.com',28, 'Gran avenida 2394', '56985643215'), (3, 'Pablo', 'Lagos', 'Ingenierio', 'plagos@example.com',25, 'Primera transversal 3049', '56996452536'), (4, 'Alfredo', 'Vargas', 'Abogado', 'avargas@example.com',29, 'Segunda avenida 6054', '56986972536');
UNLOCK TABLES;

SELECT * FROM employed_db.employed;

CREATE PROCEDURE employedAddOrEdit(
    IN _id INT, 
    IN _name VARCHAR(20),
    IN _lastname VARCHAR(20),
    IN _job VARCHAR (20),
    IN _mail VARCHAR (20),
    IN _age INT,
    IN _address VARCHAR(100),
    IN _phone VARCHAR(11)
)
BEGIN
    IF _id = 0 THEN 
        INSERT INTO employed (name, lastname, job, mail, age, address, phone)
        VALUES (_name , _lastname , _job , _mail , _age , _address , _phone);
        SET _id = LAST_INSERT_ID();
    ELSE
        UPDATE employed
        SET
            name = _name,
            lastname = _lastname,
            job = _job,
            mail = _mail,
            age = _age,
            address = _address,
            phone = _phone
            WHERE id = _id;
    END IF;
    SELECT _id AS id;
END