
include requete.sql

/* Création de la Base de Données */
CREATE DATABASE GestionPersonnelAeroport;
GO

USE GestionPersonnelAeroport;
GO

/*Table Employés*/
CREATE TABLE Employes (
    EmployeID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(50) NOT NULL,
    Prenom NVARCHAR(50) NOT NULL,
    DateNaissance DATE NOT NULL,
    Adresse NVARCHAR(100),
    Ville NVARCHAR(50),
    CodePostal NVARCHAR(10),
    Telephone NVARCHAR(15),
    Email NVARCHAR(50),
    DateEmbauche DATE NOT NULL,
    DepartementID INT,
    PosteID INT,
    FOREIGN KEY (DepartementID) REFERENCES Departements(DepartementID),
    FOREIGN KEY (PosteID) REFERENCES Postes(PosteID)
);

/*Table Départements*/
CREATE TABLE Departements (
    DepartementID INT PRIMARY KEY IDENTITY(1,1),
    NomDepartement NVARCHAR(50) NOT NULL
);

/*Table Postes*/
CREATE TABLE Postes (
    PosteID INT PRIMARY KEY IDENTITY(1,1),
    NomPoste NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    Salaire DECIMAL(10, 2) NOT NULL
);


/*Table Plannings*/
CREATE TABLE Plannings (
    PlanningID INT PRIMARY KEY IDENTITY(1,1),
    EmployeID INT NOT NULL,
    DateDebut DATETIME NOT NULL,
    DateFin DATETIME NOT NULL,
    TypeShift NVARCHAR(20) CHECK (TypeShift IN ('Matin', 'Après-midi', 'Nuit')),
    FOREIGN KEY (EmployeID) REFERENCES Employes(EmployeID)
);

/*Table Formations*/
CREATE TABLE Formations (
    FormationID INT PRIMARY KEY IDENTITY(1,1),
    NomFormation NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    DateFormation DATE NOT NULL
);


/*Table EmployeFormations*/
CREATE TABLE EmployeFormations (
    EmployeID INT NOT NULL,
    FormationID INT NOT NULL,
    DateParticipation DATE NOT NULL,
    PRIMARY KEY (EmployeID, FormationID),
    FOREIGN KEY (EmployeID) REFERENCES Employes(EmployeID),
    FOREIGN KEY (FormationID) REFERENCES Formations(FormationID)
);

/*Insertion de Départements*/
INSERT INTO Departements (NomDepartement) VALUES
('Sécurité'),
('Contrôle Aérien'),
('Service Client'),
('Maintenance');

/*Insertion de Postes*/
INSERT INTO Postes (NomPoste, Description, Salaire) VALUES
('Agent de Sécurité', 'Assure la sécurité des passagers et des installations.', 2500.00),
('Contrôleur Aérien', 'Gère le trafic aérien pour assurer des vols sûrs et efficaces.', 3500.00),
('Agent de Service Client', 'Fournit une assistance et un support aux passagers.', 2200.00),
('Technicien de Maintenance', 'Effectue la maintenance des installations aéroportuaires.', 3000.00);

/*Insertion d'Employés*/
INSERT INTO Employes (Nom, Prenom, DateNaissance, Adresse, Ville, CodePostal, Telephone, Email, DateEmbauche, DepartementID, PosteID) VALUES
('Dupont', 'Jean', '1985-01-15', '123 Rue de la Paix', 'Paris', '75001', '0123456789', 'jean.dupont@example.com', '2020-06-01', 1, 1),
('Martin', 'Lucie', '1990-03-22', '456 Avenue des Champs', 'Lyon', '69002', '0987654321', 'lucie.martin@example.com', '2019-09-15', 2, 2),
('Durand', 'Paul', '1987-07-30', '789 Boulevard Voltaire', 'Marseille', '13001', '0234567890', 'paul.durand@example.com', '2018-11-20', 3, 3),
('Legrand', 'Sophie', '1983-05-10', '101 Rue Lafayette', 'Lille', '59000', '0345678901', 'sophie.legrand@example.com', '2021-01-10', 4, 4);

/*Insertion de Plannings*/
INSERT INTO Plannings (EmployeID, DateDebut, DateFin, TypeShift) VALUES
(1, '2023-06-01 08:00:00', '2023-06-01 16:00:00', 'Matin'),
(2, '2023-06-01 16:00:00', '2023-06-01 24:00:00', 'Après-midi'),
(3, '2023-06-01 00:00:00', '2023-06-01 08:00:00', 'Nuit'),
(4, '2023-06-02 08:00:00', '2023-06-02 16:00:00', 'Matin');


/*Insertion de Formations*/
INSERT INTO Formations (NomFormation, Description, DateFormation) VALUES
('Sécurité Aéroportuaire', 'Formation sur les procédures de sécurité.', '2023-07-01'),
('Contrôle du Trafic Aérien', 'Formation sur la gestion du trafic aérien.', '2023-08-15'),
('Service Client', 'Formation sur les techniques de service client.', '2023-09-10'),
('Maintenance Aéroportuaire', 'Formation sur la maintenance des équipements.', '2023-10-05');

/*Insertion de Participations aux Formations*/
INSERT INTO EmployeFormations (EmployeID, FormationID, DateParticipation) VALUES
(1, 1, '2023-07-01'),
(2, 2, '2023-08-15'),
(3, 3, '2023-09-10'),
(4, 4, '2023-10-05');
