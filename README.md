<h1>📋 Contexte du projet</h1>
Création d'un site web d'une base de données de cinéma

<h1>🎯 Objectifs pédagogiques</h1>

- Créer une interface utilisateur responsive et intuitive
- Implémenter un CRUD complet (Create, Read, Update, Delete)
- Gérer une base de données MySQL avec PHP
- Utiliser JavaScript pour des interactions dynamiques
- Pratiquer l'architecture MVC

<h1>📝 Consignes</h1>

- Afficher la liste des films
- Afficher la liste des acteurs
- Afficher la liste des réalisateurs
- Afficher les détails de chaque film
- Afficher les détails de chaque acteur
- Afficher les détails de chaque réalisateur
- Trouver les films par genre
- Trouver les acteurs par rôle
- Ajouter un genre
- Ajouter un acteur
- Ajouter un film

<h1>🔧 Technologies utilisées</h1>

<h2>Languages</h2>

- HTML5
- CSS3
- PHP 8
- Javascript
- SQL

<h2>Outils</h2>

- VSCode
- Laragon

<h1>💡 Concepts clés abordés</h1>

HTML/CSS
- Sémantique HTML5
- Flexbox et Grid
- Media queries
- Variables CSS

JavaScript
- Événements

PHP
- PDO et requêtes préparées
- Architecture MVC

SQL
- CRUD
- Clés primaires
- Clés étrangères

<h1>📦 Installation et configuration</h1>

<h2>Configuration de la base de données</h2>

- Cloner le repository
- Démarrer Laragon
- Accéder à HeidiSQL
- Charger le fichier SQL script_cinema.sql

<h2>Configuration du projet</h2>

 Modifier les informations de connexion dans Connect.php
- const HOST = "localhost";
- const DB = "cinema";
- const USER = "root";
- const PASS = "";

<h1>🚀 Structure du projet</h1>


Projet/  
│  
├── controller/  
|   ├── CinemaController/  
├── model/  
|   ├── Connect.php/  
├── public/  
│   ├── css/  
│   │   ├── style.css  
│   ├── img/  
│   │   ├── logo.png  
│   └── js/  
│       ├── main.js  
├── view/  
│   ├── accueil.php  
│   ├── addActeur.php  
│   ├── addFilm.php  
│   ├── addGenre.php  
│   ├── detailsActeur.php  
│   ├── detailsFilm.php  
│   ├── detailsGenre.php  
│   ├── detailsRealisateur.php  
│   ├── detailsRole.php  
│   ├── listActeurs.php  
│   ├── listFilms.php  
│   ├── listGenres.php  
│   ├── listRealisateurs.php  
│   ├── listRoles.php  
│   ├── resultsSearch.php  
│   └── template.php  
├──  index.php  
│  
├── SQL/  
│   ├── requete.sql  
│   └── script_cinema.sql  
│  
├── MCD_cinema.loo/  
├── preview_MCD_cinema..png/  
│  
└── README.md  

<h1>✨ Démonstration</h1>
<h2>Captures d'écran</h2>

![image](https://github.com/user-attachments/assets/eaa6fe2b-9f29-4bbb-aba4-62015f714bb5)
![image](https://github.com/user-attachments/assets/adbf4d22-93de-4bbd-9ff3-ccf0d18871a6)
![image](https://github.com/user-attachments/assets/67c8bd1f-8401-4ee5-8968-9d2fa92f4002)
![image](https://github.com/user-attachments/assets/c47551a2-3bf6-4842-a56f-7c49ad051634)
![image](https://github.com/user-attachments/assets/a80002bf-781d-4d8c-aca1-b87f04f81571)
![image](https://github.com/user-attachments/assets/ddefd3b7-7855-417d-9d72-bae558b163d0)
![image](https://github.com/user-attachments/assets/67af2f0d-5f74-46f9-a533-a7da8545de9b)
![image](https://github.com/user-attachments/assets/f2e31f75-9d89-448d-8fb7-7505133d6c97)
![image](https://github.com/user-attachments/assets/22e12072-2bdb-411c-a8df-11037db06b40)
![image](https://github.com/user-attachments/assets/b6b45d20-62c8-42c1-81a2-ae52133f58f5)







