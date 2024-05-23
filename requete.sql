
/* Récupérer la liste de tous les employés*/
SELECT * FROM Employes
WHERE EmployeID = 1;

/*Récupérer les informations d'un employé spécifique par son ID*/
SELECT e.EmployeID, e.Nom, e.Prenom, d.NomDepartement
FROM Employes e
JOIN Departements d ON e.DepartementID = d.DepartementID
WHERE d.NomDepartement = 'Sécurité';

/*Récupérer les employés par département*/
SELECT e.Nom, e.Prenom, p.DateDebut, p.DateFin, p.TypeShift
FROM Plannings p
JOIN Employes e ON p.EmployeID = e.EmployeID;

/*Récupérer les plannings des employés*/
SELECT e.Nom, e.Prenom, f.NomFormation, ef.DateParticipation
FROM EmployeFormations ef
JOIN Employes e ON ef.EmployeID = e.EmployeID
JOIN Formations f ON ef.FormationID = f.FormationID
WHERE e.EmployeID = 1;

/*Récupérer les formations suivies par un employé*/
SELECT e.Nom, e.Prenom, p.NomPoste, p.Salaire
FROM Employes e
JOIN Postes p ON e.PosteID = p.PosteID;

/*Récupérer les employés ayant une formation spécifique*/
SELECT e.Nom, e.Prenom, f.NomFormation
FROM EmployeFormations ef
JOIN Employes e ON ef.EmployeID = e.EmployeID
JOIN Formations f ON ef.FormationID = f.FormationID
WHERE f.NomFormation = 'Sécurité Aéroportuaire';
