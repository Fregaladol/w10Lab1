CREATE DATABASE IF NOT EXISTS tvDB;

USE tvDB;

CREATE TABLE canales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    idioma VARCHAR(50),
    fundacion YEAR,
    tipo VARCHAR(50),
    sitio_web VARCHAR(100)
);

CREATE TABLE programas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    duracion INT, -- en minutos
    horario_emision TIME,
    canal_id INT,
    FOREIGN KEY (canal_id) REFERENCES canales(id)
);


INSERT INTO canales (nombre, pais, idioma, fundacion, tipo, sitio_web) VALUES
('Canal 24H', 'España', NULL, 1997, 'Noticias', 'https://www.rtve.es/24h'),
('TV Mexicana', 'México', 'Español', 2001, 'Público', NULL),
('NewsOne', 'USA', 'Inglés', 1985, 'Privado', 'https://www.newsone.com'),
('UK Broadcast', 'UK', 'Inglés', 1990, 'Público', NULL),
('Dutch Media', 'Holanda', 'Neerlandés', NULL, 'Estatal', 'https://dutchmedia.nl'),
('Canal', 'España', NULL, NULL, 'Independiente', NULL); 

INSERT INTO programas (titulo, genero, duracion, horario_emision, canal_id) VALUES
('Telediario 24H', 'Noticias', 60, '20:00:00', 1),
('Noticias al Día', 'Noticias', 45, '19:00:00', 2),
('Evening News', 'Noticias', NULL, '18:30:00', NULL),
('UK Today', NULL, 50, '21:00:00', 4),
('Het Nieuws', 'Noticias', 40, '18:00:00', 5),
('Informe Especial', 'Reportaje', NULL, NULL, NULL); 


-- Queries INNER, LEFT JOIN y RIGHT JOIN 

-- Muestra resultados obviando los que no tengan canal_id
SELECT p.titulo, p.horario_emision, p.duracion, p.canal_id, c.nombre, c.idioma
FROM programas p
INNER JOIN canales c
ON c.id = p.canal_id;

-- Muestra todos los resultados aun que sean null
SELECT p.titulo, p.horario_emision, p.duracion, p.canal_id, c.nombre, c.idioma
FROM programas p
LEFT JOIN canales c
ON c.id = p.canal_id;

-- Aparecen los canales que tienen programa... aparecen los canales sin programa
SELECT p.titulo, p.horario_emision, p.duracion, p.canal_id, c.nombre, c.idioma
FROM programas p
RIGHT JOIN canales c
ON c.id = p.canal_id;