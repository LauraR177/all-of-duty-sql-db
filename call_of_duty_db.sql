CREATE DATABASE CallOfDutyDB;
USE CallOfDutyDB;


-- Tabla Player: Almacena información sobre los jugadores, incluyendo su nivel, experiencia y relación de bajas/muertes.
CREATE TABLE Player (
    Player_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Level INT NOT NULL,
    Experience INT NOT NULL,
    KD_Ratio FLOAT NOT NULL,
    Registration_Date DATE NOT NULL
);


-- Tabla Team: Almacena información sobre los equipos, incluyendo nombre, país y fecha de creación.
CREATE TABLE Team (
    Team_ID INT PRIMARY KEY AUTO_INCREMENT,
    Team_Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100),
    Creation_Date DATE
);


-- Tabla Player_Team (Relación Muchos a Muchos): Gestiona la relación entre los jugadores y los equipos, rastreando las fechas de ingreso y salida.
CREATE TABLE Player_Team (
    Player_ID INT,
    Team_ID INT,
    Join_Date DATE NOT NULL,
    Leave_Date DATE,
    PRIMARY KEY (Player_ID, Team_ID),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY (Team_ID) REFERENCES Team(Team_ID)
);

-- Tabla Map: Contiene los mapas disponibles en el juego.
CREATE TABLE Map (
    Map_ID INT PRIMARY KEY AUTO_INCREMENT,
    Map_Name VARCHAR(100) NOT NULL,
    Environment_Type VARCHAR(100)
);

-- Tabla Match: Almacena detalles sobre cada partida, incluyendo la fecha, el mapa y el modo de juego.
CREATE TABLE Game_Match (
    Match_ID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATETIME NOT NULL,
    Map_ID INT,
    Game_Mode VARCHAR(50) NOT NULL,
    FOREIGN KEY (Map_ID) REFERENCES Map(Map_ID)
);


-- Tabla Statistics: Registra el rendimiento del jugador en cada partida, incluyendo bajas, muertes y asistencias.
CREATE TABLE Statistics (
    Stat_ID INT PRIMARY KEY AUTO_INCREMENT,
    Player_ID INT,
    Match_ID INT,
    Kills INT NOT NULL,
    Deaths INT NOT NULL,
    Assists INT NOT NULL,
    Highest_Streak INT NOT NULL,
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY (Match_ID) REFERENCES Game_Match(Match_ID)
);


-- Tabla Item: Define los ítems del juego como armas, mejoras, especialidades.
CREATE TABLE Item (
    Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Item_Name VARCHAR(100) NOT NULL,
    Item_Type VARCHAR(50) NOT NULL
);


-- Tabla Player_Item (relación N:N entre jugadores e ítems): Registra los ítems que posee cada jugador y la fecha de adquisición.
CREATE TABLE Player_Item (
    Player_ID INT,
    Item_ID INT,
    Acquisition_Date DATE NOT NULL,
    PRIMARY KEY (Player_ID, Item_ID),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID)
);


-- Tabla Operator: Contiene los operadores disponibles en el juego.
CREATE TABLE Operator (
    Operator_ID INT PRIMARY KEY AUTO_INCREMENT,
    Operator_Name VARCHAR(100) NOT NULL,
    Faction VARCHAR(100)
);


-- Tabla Player_Operator (relación N:N entre jugadores y operadores): Relaciona operadores con jugadores.
CREATE TABLE Player_Operator (
    Player_ID INT,
    Operator_ID INT,
    Assignment_Date DATE,
    PRIMARY KEY (Player_ID, Operator_ID),
    FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
    FOREIGN KEY (Operator_ID) REFERENCES Operator(Operator_ID)
);

-- Insercion de datos 

INSERT INTO Game_Match (Date, Map_ID, Game_Mode) VALUES
('2025-05-01 14:00:00', 1, 'Deathmatch'),
('2025-05-02 15:00:00', 2, 'Capture the Flag'),
('2025-05-03 16:00:00', 3, 'Team Deathmatch'),
('2025-05-04 17:00:00', 4, 'Search and Destroy'),
('2025-05-05 18:00:00', 5, 'Domination'),
('2025-05-06 19:00:00', 6, 'Hardpoint'),
('2025-05-07 20:00:00', 7, 'Kill Confirmed'),
('2025-05-08 21:00:00', 8, 'Free-for-All'),
('2025-05-09 22:00:00', 9, 'Gun Game'),
('2025-05-10 23:00:00', 10, 'Infected'),
('2025-05-11 14:00:00', 11, 'Drop Zone'),
('2025-05-12 15:00:00', 12, 'Demolition'),
('2025-05-13 16:00:00', 13, 'Search and Rescue'),
('2025-05-14 17:00:00', 14, 'Grind'),
('2025-05-15 18:00:00', 15, 'Safeguard'),
('2025-05-16 19:00:00', 16, 'Uplink'),
('2025-05-17 20:00:00', 17, 'Capture the Flag'),
('2025-05-18 21:00:00', 18, 'Team Deathmatch'),
('2025-05-19 22:00:00', 19, 'Hardpoint'),
('2025-05-20 23:00:00', 20, 'Kill Confirmed'),
('2025-05-21 14:00:00', 21, 'Free-for-All'),
('2025-05-22 15:00:00', 22, 'Gun Game'),
('2025-05-23 16:00:00', 23, 'Infected'),
('2025-05-24 17:00:00', 24, 'Drop Zone'),
('2025-05-25 18:00:00', 25, 'Demolition'),
('2025-05-26 19:00:00', 26, 'Search and Rescue'),
('2025-05-27 20:00:00', 27, 'Grind'),
('2025-05-28 21:00:00', 28, 'Safeguard');

INSERT INTO Item (Item_Name, Item_Type) VALUES
('Assault Rifle X47', 'Weapon'),
('Nano Shield', 'Upgrade'),
('Stealth Boots', 'Specialty'),
('Pulse SMG 9mm', 'Weapon'),
('Thermal Scope', 'Upgrade'),
('Camouflage Cloak', 'Specialty'),
('Plasma Grenade', 'Weapon'),
('Adrenaline Shot', 'Upgrade'),
('EMP Launcher', 'Weapon'),
('Bulletproof Vest', 'Upgrade'),
('Hacking Kit', 'Specialty'),
('Sniper Rifle LZ10', 'Weapon'),
('Ammo Pack', 'Upgrade'),
('Night Vision Goggles', 'Specialty'),
('Shotgun SP-12', 'Weapon'),
('Regen Field Device', 'Upgrade'),
('Decoy Drone', 'Specialty'),
('Laser Cutter', 'Weapon'),
('Extended Magazine', 'Upgrade'),
('Thermal Camouflage', 'Specialty'),
('Submachine Gun VX4', 'Weapon'),
('Overdrive Serum', 'Upgrade'),
('Explosive Charge', 'Specialty'),
('Handgun P9 Elite', 'Weapon'),
('Kinetic Barrier', 'Upgrade'),
('Sensor Beacon', 'Specialty'),
('Crossbow SilentStrike', 'Weapon'),
('Motion Detector', 'Upgrade');

INSERT INTO Map (Map_Name, Environment_Type) VALUES
('Crossroads', 'Urban'),
('Desert Storm', 'Desert'),
('Silent Valley', 'Forest'),
('Ice Fortress', 'Arctic'),
('Warehouse Blitz', 'Industrial'),
('Mountain Pass', 'Forest'),
('Urban Siege', 'Urban'),
('Sands of War', 'Desert'),
('Frostbite', 'Arctic'),
('Factory Line', 'Industrial'),
('Concrete Jungle', 'Urban'),
('Dune Horizon', 'Desert'),
('Rainforest Hunt', 'Forest'),
('Glacier Base', 'Arctic'),
('Iron Yard', 'Industrial'),
('Metro Ambush', 'Urban'),
('Dust Tunnel', 'Desert'),
('Jungle Ruins', 'Forest'),
('Frozen Lake', 'Arctic'),
('Steel Mill', 'Industrial'),
('Night City', 'Urban'),
('Oasis Clash', 'Desert'),
('Green Maze', 'Forest'),
('Blizzard Front', 'Arctic');

INSERT INTO Operator (Operator_Name, Faction) VALUES
('Viper', 'Shadow Corps'),
('Falcon', 'Ghost Unit'),
('Hawk', 'Iron Legion'),
('Wraith', 'Phantom Division'),
('Specter', 'Night Wolves'),
('Blaze', 'Firestorm'),
('Nova', 'Stellar Ops'),
('Reaper', 'Deadlock'),
('Echo', 'Strike Team 9'),
('Maverick', 'Wolf Pack'),
('Saber', 'Crimson Guard'),
('Raven', 'Black Talon'),
('Zephyr', 'Tempest'),
('Bullet', 'Steel Vultures'),
('Ghost', 'Silent Force'),
('Jaguar', 'Jungle Fang'),
('Phoenix', 'Ashen Flame'),
('Striker', 'Thunder Squad'),
('Frost', 'Glacier Unit'),
('Talon', 'Sky Watch'),
('Hammer', 'Forge Battalion'),
('Siren', 'Echo Division'),
('Cobra', 'Venom Core'),
('Shade', 'Dark Horizon'),
('Bishop', 'Order 77'),
('Drake', 'Iron Eagles'),
('Lynx', 'Stealth Recon'),
('Storm', 'Lightning Cell');

INSERT INTO Player (Name, Level, Experience, KD_Ratio, Registration_Date) VALUES
('Lucas Martínez', 45, 10234, 1.23, '2022-04-10'),
('Ana Gómez', 12, 3400, 0.95, '2023-01-25'),
('Carlos Núñez', 76, 80500, 2.11, '2021-11-02'),
('Laura Torres', 30, 15340, 1.10, '2022-09-15'),
('Pedro Sánchez', 55, 40200, 1.78, '2023-02-01'),
('Camila Herrera', 20, 7600, 0.87, '2022-06-19'),
('Javier Ríos', 68, 98000, 2.30, '2021-10-12'),
('Elena Ruiz', 33, 19800, 1.15, '2022-08-07'),
('Mateo Díaz', 88, 110500, 2.67, '2021-07-30'),
('Isabella León', 40, 24800, 1.48, '2023-03-21'),
('Daniel Paredes', 25, 12300, 1.03, '2022-12-11'),
('Lucía Flores', 60, 61000, 2.05, '2021-12-24'),
('Miguel Varela', 15, 4500, 0.75, '2023-05-18'),
('Sara Méndez', 52, 48800, 1.65, '2022-03-09'),
('Diego Ortega', 34, 20700, 1.20, '2023-04-04'),
('Valentina Cordero', 70, 94000, 2.44, '2021-06-28'),
('Tomás Larraín', 47, 33000, 1.42, '2022-11-30'),
('Paula Benítez', 19, 8200, 0.91, '2023-01-10'),
('Gabriel Palma', 82, 102000, 2.51, '2021-09-01'),
('Martina Vidal', 29, 17600, 1.08, '2022-10-22'),
('Nicolás Araya', 64, 77000, 2.00, '2021-08-14'),
('Julieta Fuentes', 41, 26900, 1.55, '2022-05-16'),
('Andrés Pino', 22, 9800, 0.85, '2023-02-27'),
('Renata Lagos', 38, 22500, 1.33, '2022-07-08'),
('Cristóbal Salas', 50, 45500, 1.70, '2023-03-03'),
('Florencia Mora', 16, 5800, 0.90, '2022-01-20'),
('Sebastián Contreras', 91, 113000, 2.80, '2021-05-11'),
('Antonia Riquelme', 36, 21300, 1.25, '2022-04-27'),
('Ignacio Venegas', 59, 58900, 1.95, '2021-07-05');

INSERT INTO Player_Item (Player_ID, Item_ID, Acquisition_Date) VALUES
(1, 5, '2023-08-10'),
(2, 8, '2023-09-12'),
(3, 1, '2023-10-05'),
(4, 12, '2023-11-22'),
(5, 15, '2023-12-03'),
(6, 7, '2024-01-18'),
(7, 18, '2024-02-09'),
(8, 3, '2024-03-11'),
(9, 9, '2024-04-25'),
(10, 6, '2024-05-14'),
(11, 13, '2024-06-07'),
(12, 4, '2024-06-29'),
(13, 17, '2024-07-20'),
(14, 2, '2024-08-11'),
(15, 21, '2024-09-03'),
(16, 10, '2024-09-24'),
(17, 23, '2024-10-15'),
(18, 11, '2024-11-05'),
(19, 20, '2024-11-27'),
(20, 14, '2024-12-18'),
(21, 19, '2025-01-09'),
(22, 22, '2025-01-30'),
(23, 16, '2025-02-21'),
(24, 25, '2025-03-14'),
(25, 24, '2025-04-04'),
(26, 27, '2025-04-25'),
(27, 26, '2025-05-05'),
(28, 28, '2025-05-08');

INSERT INTO Player_Operator (Player_ID, Operator_ID, Assignment_Date) VALUES
(1, 1, '2025-05-01'),
(1, 2, '2025-05-02'),
(2, 3, '2025-05-03'),
(2, 4, '2025-05-04'),
(3, 5, '2025-05-05'),
(3, 6, '2025-05-06'),
(4, 7, '2025-05-07'),
(4, 8, '2025-05-08'),
(5, 9, '2025-05-09'),
(5, 10, '2025-05-10'),
(6, 11, '2025-05-11'),
(6, 12, '2025-05-12'),
(7, 13, '2025-05-13'),
(7, 14, '2025-05-14'),
(8, 15, '2025-05-15'),
(8, 16, '2025-05-16'),
(9, 17, '2025-05-17'),
(9, 18, '2025-05-18'),
(10, 19, '2025-05-19'),
(10, 20, '2025-05-20'),
(11, 21, '2025-05-21'),
(11, 22, '2025-05-22'),
(12, 23, '2025-05-23'),
(12, 24, '2025-05-24'),
(13, 25, '2025-05-25'),
(13, 26, '2025-05-26'),
(14, 27, '2025-05-27'),
(14, 28, '2025-05-28');

INSERT INTO Player_Team (Player_ID, Team_ID, Join_Date, Leave_Date) VALUES
(1, 1, '2025-05-01', '2025-06-01'),
(1, 2, '2025-06-02', '2025-07-01'),
(2, 1, '2025-05-03', '2025-06-03'),
(2, 3, '2025-06-04', '2025-07-04'),
(3, 2, '2025-05-05', '2025-06-05'),
(3, 4, '2025-06-06', '2025-07-06'),
(4, 1, '2025-05-07', '2025-06-07'),
(4, 5, '2025-06-08', '2025-07-08'),
(5, 2, '2025-05-09', '2025-06-09'),
(5, 3, '2025-06-10', '2025-07-10'),
(6, 4, '2025-05-11', '2025-06-11'),
(6, 5, '2025-06-12', '2025-07-12'),
(7, 1, '2025-05-13', '2025-06-13'),
(7, 2, '2025-06-14', '2025-07-14'),
(8, 3, '2025-05-15', '2025-06-15'),
(8, 4, '2025-06-16', '2025-07-16'),
(9, 5, '2025-05-17', '2025-06-17'),
(9, 1, '2025-06-18', '2025-07-18'),
(10, 2, '2025-05-19', '2025-06-19'),
(10, 3, '2025-06-20', '2025-07-20'),
(11, 4, '2025-05-21', '2025-06-21'),
(11, 5, '2025-06-22', '2025-07-22'),
(12, 1, '2025-05-23', '2025-06-23'),
(12, 2, '2025-06-24', '2025-07-24'),
(13, 3, '2025-05-25', '2025-06-25'),
(13, 4, '2025-06-26', '2025-07-26'),
(14, 5, '2025-05-27', '2025-06-27'),
(14, 1, '2025-06-28', '2025-07-28');

INSERT INTO Statistics (Player_ID, Match_ID, Kills, Deaths, Assists, Highest_Streak) VALUES
(1, 101, 25, 10, 5, 10),
(2, 102, 20, 12, 7, 8),
(3, 103, 30, 8, 10, 12),
(4, 104, 15, 14, 6, 5),
(5, 105, 18, 10, 8, 9),
(6, 106, 22, 9, 11, 11),
(7, 107, 17, 13, 4, 6),
(8, 108, 27, 5, 15, 14),
(9, 109, 24, 11, 9, 10),
(10, 110, 19, 12, 8, 7),
(11, 111, 23, 7, 6, 13),
(12, 112, 21, 8, 10, 9),
(13, 113, 16, 14, 5, 4),
(14, 114, 28, 6, 12, 16),
(1, 115, 30, 10, 14, 13),
(2, 116, 22, 11, 9, 8),
(3, 117, 25, 9, 11, 11),
(4, 118, 20, 13, 7, 6),
(5, 119, 18, 15, 6, 5),
(6, 120, 21, 12, 10, 8),
(7, 121, 19, 14, 4, 7),
(8, 122, 29, 5, 13, 15),
(9, 123, 24, 10, 9, 10),
(10, 124, 18, 13, 8, 6),
(11, 125, 22, 8, 11, 12),
(12, 126, 20, 9, 7, 9),
(13, 127, 17, 12, 5, 4),
(14, 128, 27, 7, 14, 14);

INSERT INTO Team (Team_Name, Country, Creation_Date) VALUES
('Alpha Squad', 'United States', '2020-01-15'),
('Bravo Force', 'United Kingdom', '2019-11-23'),
('Delta Wolves', 'Canada', '2021-03-07'),
('Echo Strike', 'Australia', '2020-06-30'),
('Foxtrot Legion', 'Germany', '2018-08-19'),
('Gamma Team', 'France', '2019-10-02'),
('Hammerhead', 'Russia', '2021-05-13'),
('Icarus Brigade', 'Brazil', '2022-02-25'),
('Jaguar Squadron', 'South Korea', '2020-04-10'),
('Kilo Operators', 'Japan', '2018-09-12'),
('Lima Recon', 'India', '2021-07-14'),
('Maverick Rangers', 'Mexico', '2022-01-20'),
('Night Hawks', 'Italy', '2021-12-05'),
('Omen Task Force', 'China', '2022-04-02'),
('Phantom Warriors', 'Israel', '2020-11-11'),
('Quicksilver Group', 'Spain', '2021-06-22'),
('Raven Strike', 'South Africa', '2020-03-15'),
('Sentinel Elite', 'Netherlands', '2019-12-01'),
('Thunderclap Team', 'New Zealand', '2021-08-28'),
('Viper Strike', 'Turkey', '2021-10-17'),
('Wolverine Brigade', 'Sweden', '2020-07-24'),
('Xtreme Operators', 'Argentina', '2022-03-30'),
('Yeti Hunters', 'Norway', '2020-05-18'),
('Zulu Command', 'Poland', '2021-09-06'),
('Vanguard Force', 'Egypt', '2019-10-30'),
('Strike Core', 'South Africa', '2020-02-20'),
('Tornado Squadron', 'Greece', '2021-04-05'),
('Forgotten Temple', 'Old Ruins'),
('Beneath the Streets', 'Sewer System'),
('Molten Fields', 'Volcanic Terrain'),
('Aether Skies', 'Sky Fortress');


INSERT INTO Statistics (Player_ID, Match_ID, Kills, Deaths, Assists, Highest_Streak) VALUES
(1, 141, 25, 10, 5, 10),
(2, 142, 20, 12, 7, 8),
(3, 143, 30, 8, 10, 12),
(4, 144, 15, 14, 6, 5),
(5, 145, 18, 10, 8, 9),
(6, 146, 22, 9, 11, 11),
(7, 147, 17, 13, 4, 6),
(8, 148, 27, 5, 15, 14),
(9, 149, 24, 11, 9, 10),
(10, 150, 19, 12, 8, 7),
(11, 151, 23, 7, 6, 13),
(12, 152, 21, 8, 10, 9),
(13, 153, 16, 14, 5, 4),
(14, 154, 28, 6, 12, 16),
(1, 155, 30, 10, 14, 13),
(2, 156, 22, 11, 9, 8),
(3, 157, 25, 9, 11, 11),
(4, 158, 20, 13, 7, 6),
(5, 159, 18, 15, 6, 5),
(6, 160, 21, 12, 10, 8),
(7, 161, 19, 14, 4, 7),
(8, 162, 29, 5, 13, 15),
(9, 163, 24, 10, 9, 10),
(10, 164, 18, 13, 8, 6),
(11, 165, 22, 8, 11, 12),
(12, 166, 20, 9, 7, 9),
(13, 167, 17, 12, 5, 4),
(14, 168, 27, 7, 14, 14);


-- Vistas

USE CallOfDutyDB;

-- Vista1: jugadores con KD_Ratio > 1.7
CREATE VIEW TopPlayers AS
SELECT Name, KD_Ratio, Level FROM Player WHERE KD_Ratio > 1.7;


-- Vista2:  equipos creados después de agosto 2020.
CREATE VIEW ActiveTeams AS
SELECT Team_Name, Country, Creation_Date FROM Team WHERE Creation_Date > '2020-08-01';

-- Vista3:  detalles de jugador + equipo + fecha de unión.
CREATE VIEW PlayerTeamDetails AS
SELECT p.Name, t.Team_Name, pt.Join_Date
FROM Player p
JOIN Player_Team pt ON p.Player_ID = pt.Player_ID
JOIN Team t ON pt.Team_ID = t.Team_ID;

-- Vista4: resumen de kills, deaths, assists, streaks por jugador
CREATE VIEW PlayerStatisticsSummary AS
SELECT p.Name, s.Kills, s.Deaths, s.Assists, s.Highest_Streak
FROM Player p
JOIN Statistics s ON p.Player_ID = s.Player_ID;

-- Vista5: cuenta cuántos jugadores tiene cada equipo.
CREATE VIEW TeamPerformance AS
SELECT t.Team_Name, COUNT(pt.Player_ID) AS TotalPlayers
FROM Team t
JOIN Player_Team pt ON t.Team_ID = pt.Team_ID
GROUP BY t.Team_Name;

--Funciones 

USE CallOfDutyDB;

-- Función 1:Retorna el nivel promedio de todos los jugadores
DELIMITER //
CREATE FUNCTION GetAverageLevel()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
  DECLARE avg_level DECIMAL(5,2);
  SELECT AVG(Level) INTO avg_level FROM Player;
  RETURN avg_level;
END //
DELIMITER ;

SELECT GetAverageLevel() AS avg_level;


-- Función 2: Devuelve el nombre del equipo de un jugador 
DELIMITER //
CREATE FUNCTION GetPlayerTeam(playerId INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE teamName VARCHAR(100);
  SELECT Team_Name INTO teamName
  FROM Team
  WHERE Team_ID = (SELECT Team_ID FROM Player_Team WHERE Player_ID = playerId LIMIT 1);
  RETURN teamName;
END //
DELIMITER ;

SELECT GetPlayerTeam(10) AS teamName;

--Procedimientos

USE CallOfDutyDB;

-- Procedimiento1: Ordenar tabla Player por cualquier campo y ordenamiento
-- Uso: CALL SortPlayers('Name', 'ASC');

DELIMITER //
CREATE PROCEDURE SortPlayers(
  IN sortField VARCHAR(100),
  IN sortOrder VARCHAR(4)
)
BEGIN
  SET @query = CONCAT('SELECT * FROM Player ORDER BY ', sortField, ' ', sortOrder);
  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL SortPlayers('Name', 'DESC');


-- Procedimiento 2: Insertar un nuevo jugador en la tabla Player

DELIMITER //
CREATE PROCEDURE AddPlayer(
  IN pname VARCHAR(100),
  IN plevel INT,
  IN pexp INT,
  IN pkdr FLOAT,
  IN pregdate DATE
)
BEGIN
  INSERT INTO Player (Name, Level, Experience, KD_Ratio, Registration_Date)
  VALUES (pname, plevel, pexp, pkdr, pregdate);
END //
DELIMITER ;

CALL AddPlayer('Laura RR',50,469,1.4,'2025-04-15');

SELECT * FROM Player;
