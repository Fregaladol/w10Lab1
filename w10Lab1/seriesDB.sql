CREATE DATABASE IF NOT EXISTS seriesDB;
USE seriesDB;


CREATE TABLE Serie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);


CREATE TABLE Temporada (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT NOT NULL,
    serie_id INT,
    FOREIGN KEY (serie_id) REFERENCES Serie(id)
);


CREATE TABLE Episodio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    temporada_id INT,
    FOREIGN KEY (temporada_id) REFERENCES Temporada(id)
);


INSERT INTO Serie (nombre) VALUES
('Breaking Bad'),
('Stranger Things'),
('The Office'),
('The Mandalorian'),
('Dark');


INSERT INTO Temporada (numero, serie_id) VALUES
(1, 1), (2, 1), (3, 1),       
(1, 2), (2, 2), (3, 2),       
(1, 3), (2, 3), (3, 3),       
(1, 4), (2, 4), (3, 4),     
(1, 5), (2, 5), (3, 5),      
(1, NULL), (2, NULL);       

INSERT INTO Episodio (titulo, numero, temporada_id) VALUES
('Episodio 1', 1, 1), ('Episodio 2', 2, 1), ('Episodio 3', 3, 1), 
('Episodio 4', 4, NULL), ('Episodio 5', 5, NULL),
('Episodio 1', 1, 2), ('Episodio 2', 2, 2), ('Episodio 3', 3, 2), 
('Episodio 4', 4, 2), ('Episodio 5', 5, 2),
('Episodio 1', 1, 3), ('Episodio 2', 2, 3), ('Episodio 3', 3, 3), 
('Episodio 4', 4, 3), ('Episodio 5', 5, NULL),
('Episodio 1', 1, NULL), ('Episodio 2', 2, 4), ('Episodio 3', 3, 4), 
('Episodio 4', 4, NULL), ('Episodio 5', 5, 4),
('Episodio 1', 1, 5), ('Episodio 2', 2, 5), ('Episodio 3', 3, 5), 
('Episodio 4', 4, 5), ('Episodio 5', 5, 5),
('Episodio 1', 1, NULL), ('Episodio 2', 2, NULL), ('Episodio 3', 3, 6), 
('Episodio 4', 4, 6), ('Episodio 5', 5, 6),
('Episodio 1', 1, 7), ('Episodio 2', 2, 7), ('Episodio 3', 3, 7), 
('Episodio 4', 4, 7), ('Episodio 5', 5, 7),
('Episodio 1', 1, 8), ('Episodio 2', 2, 8), ('Episodio 3', 3, 8), 
('Episodio 4', 4, NULL), ('Episodio 5', 5, 8),
('Episodio 1', 1, 9), ('Episodio 2', 2, 9), ('Episodio 3', 3, 9), 
('Episodio 4', 4, 9), ('Episodio 5', 5, 9),
('Episodio 1', 1, 10), ('Episodio 2', 2, 10), ('Episodio 3', 3, 10), 
('Episodio 4', 4, NULL), ('Episodio 5', 5, 10),
('Episodio 1', 1, 11), ('Episodio 2', 2, 11), ('Episodio 3', 3, NULL), 
('Episodio 4', 4, 11), ('Episodio 5', 5, NULL),
('Episodio 1', 1, NULL), ('Episodio 2', 2, 12), ('Episodio 3', 3, 12), 
('Episodio 4', 4, 12), ('Episodio 5', 5, 12),
('Episodio 1', 1, 13), ('Episodio 2', 2, 13), ('Episodio 3', 3, 13), 
('Episodio 4', 4, 13), ('Episodio 5', 5, 13),
('Episodio 1', 1, 14), ('Episodio 2', 2, NULL), ('Episodio 3', 3, 14), 
('Episodio 4', 4, 14), ('Episodio 5', 5, 14),
('Episodio 1', 1, 15), ('Episodio 2', 2, 15), ('Episodio 3', 3, 15), 
('Episodio 4', 4, 15), ('Episodio 5', 5, 15),
('Episodio sin Temporada 1', 1, NULL),
('Episodio sin Temporada 2', 2, NULL),
('Episodio sin Temporada 3', 3, NULL),
('Episodio sin Temporada 4', 4, NULL),
('Episodio sin Temporada 5', 5, NULL);

-- aparecen los resultados sin nulls
SELECT s.nombre, e.titulo,t.numero as temporada,e.numero as numero_episodio
FROM Temporada t
INNER JOIN Serie s
ON t.serie_id = s.id
INNER JOIN Episodio e
ON t.id = e.temporada_id;

-- numero de episodios por temporada por serie no nulls
SELECT s.nombre, t.numero as temporada, COUNT(e.id) as episodios_temporada
FROM Serie s
LEFT JOIN Temporada t  ON s.id = t.serie_id
LEFT JOIN Episodio e ON e.temporada_id = t.id
GROUP BY s.nombre, t.numero;

-- episodios por temporada incluida
SELECT  s.nombre, t.id AS temporada_id, t.numero AS temporada_numero, COUNT(e.id) AS cantidad_episodios
FROM Temporada t
RIGHT JOIN Episodio e ON t.id = e.temporada_id
RIGHT JOIN Serie s ON s.id = t.serie_id
GROUP BY s.nombre, t.id, t.numero;

-- numeros de episodios por  serie temporada
SELECT s.nombre AS serie_nombre, t.numero AS temporada_numero, COUNT(e.id) AS cantidad_episodios
FROM Temporada t
LEFT JOIN Serie s ON t.serie_id = s.id
LEFT JOIN Episodio e ON t.id = e.temporada_id
GROUP BY s.nombre, t.id, t.numero;
