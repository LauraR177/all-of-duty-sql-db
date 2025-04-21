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
