+-------------------+
|     Employes      |
+-------------------+
| EmployeID (PK)    |
| Nom               |
| Prenom            |
| DateNaissance     |
| Adresse           |
| Ville             |
| CodePostal        |
| Telephone         |
| Email             |
| DateEmbauche      |
| DepartementID (FK)|
| PosteID (FK)      |
+-------------------+
         |
         |                      +----------------------+
         |                      |      Postes          |
         |                      +----------------------+
         |                      | PosteID (PK)         |
         +--------------------->| NomPoste             |
         |                      | Description          |
         |                      | Salaire              |
         |                      +----------------------+
         |
         |                      +----------------------+
         |                      |   Departements       |
         |                      +----------------------+
         +--------------------->| DepartementID (PK)   |
                                | NomDepartement       |
                                +----------------------+
         |
         |                      +----------------------+
         |                      |     Plannings        |
         |                      +----------------------+
         +--------------------->| PlanningID (PK)      |
                                | EmployeID (FK)       |
                                | DateDebut            |
                                | DateFin              |
                                | TypeShift            |
                                +----------------------+
         |
         |                      +----------------------+
         |                      |     Formations       |
         |                      +----------------------+
         |                      | FormationID (PK)     |
         |                      | NomFormation         |
         +--------------------->| Description          |
                                | DateFormation        |
                                +----------------------+
         |
         |                      +----------------------+
         |                      |  EmployeFormations   |
         |                      +----------------------+
         +--------------------->| EmployeID (FK, PK)   |
                                | FormationID (FK, PK) |
                                | DateParticipation    |
                                +----------------------+
