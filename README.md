# ruches-doc

## Application web pour gérer des ruches.

Développée avec Spring Boot, elle fonctionne sous Tomcat avec une base Postgresql.

Elle est sous license gpl version 3.

Le projet Eclipse Maven vous permet de générer le fichier war.

Utiliser sql/structure.sql pour créer la base Postgresql et sql/ruches_donnes_min.sql pour l'initialiser. Utilisateur admin, mot de passe admin.
 
## Fonctionnalités
Prérequis : les ruches et les hausses doivent être identifiées par un nom.
* Ruches
    * Liste
        * Création (Nom, Active, Poids, Type, Date d'acquisition, Latitude, Longitude, Commentaire)
    * Détail d'une ruche
        * Modifier, Cloner, Ajout/Retrait/Réordonner des hausses, Changer de rucher, Supprimer
        * Événements
            * Liste
            * Création : Commentaire, Pesée, Cadre
* Types de ruche
    * Liste
        * Création (Nom, Cadres max)
    * Modifier	
* Essaims
    * Liste
        * Création (Nom, Reine marquée, Date de naissance, Actif, Date d'acquisition, Commentaire, Souche, Agressivité, Propreté)
        * Traitement d'un lot
        * Ajout de sucre par lot
        * Statistiques
    * Détail d'un essaim
        * Modifier, Cloner, Associer avec une ruche, Supprimer, [Graphe de descendance](docs/images/grapheDeDescendance.png), Disperser
        * Événements
            * Liste
            * Création : Commentaire, Sucre, Traitement
* Hausses
    * Liste
       * Création (Nom, Active, Date d'acquisition, Poids, Nombre de cadres, Nombre de cadres max, Commentaire)
    * Détail d'une hausse 
       * Modifier, Cloner, Supprimer
       * Événements
          * Liste
          * Création : Commentaire, Remplissage
* Ruchers
    * Liste
        * Création (Nom, Actif, Contact, Latitude, Longitude, Altitude, Distance et Temps de parcours en voiture à partir du Dépôt, Adresse, Ressource, Commentaire)
        * Carte Google, IGN ou OpenStreetMap des ruchers
        * Statistiques
        * Transhumances : affiche les déplacements de ruches dans les ruchers
    * Détail d'un rucher
        * Modifier, Météo, Ajouter des ruches, Supprimer, Historique (des ruches)
        * Carte Google, IGN ou OpenStreetMap des ruches d'un rucher
        * Événements	
            * Liste
            * Création : Commentaire
            * Transhumances : affiche les déplacements de ruches dans le rucher
* Récoltes
    * Liste
       * Création (Date, Type de miel, Poids de miel, Commentaire)
       * Statistiques production essaim/récolte
    * Détail d'une récolte
        * Modifier, Choix des hausses, Retrait des hausses, [Statistiques (camenbert)](docs/images/recolteStatEssaim.png), Supprimer    
* Événements
    * Liste
        * Création (Date, Type d'événement, Ruche, Essaim, Rucher, Hausse, Valeur, Commentaire)
    * Détail d'un événement
        * Modifier, supprimer
* Personnes (authentification, contacts de rucher)
    * Liste
        * Création (Nom, Prénom, Email, Adresse, Login, Password, Rôles, Active)
    * Détail d'une personne
        * Modifier, supprimer
* Préférences
    * Afficher les inactifs
    * Afficher latitude/longitude
    * Date décalée pour saisie des événements après visite
* Infos affiche des statistiques et des alertes permettant de prévoir des actions correctives à réaliser.


Les événements permettent de saisir avec une date les actions qui ont été réalisées dans les ruchers. Ces événements peuvent être saisis après visite en utilisant la date décalée (menu préférences), évitant ainsi de saisir une date pour chaque événement.

Les types d'événements sont :  
* pour les ruchers, ruches, essaims et hausses : commentaires (avec possibilité de notification par email)
* pour des ruches : pesée et modification des cadres 
* pour des essaims : ajout de sucre  et traitement (varroa).
* pour des hausses : remplissage

Les ruches, essaims, hausses, ruchers et personnes peuvent être rendus actifs ou inactfs pour qu'ils n'apparaissent plus dans les listes.
Une option du menu préférences permet d'afficher les éléments inactifs.
        
Les listes peuvent être exportées au format CSV ou PDF, imprimées, triées, filtrées, paginées. Les colonnes peuvent être masquées/affichées.

Carte des ruchers
* elle permet de déplacer les ruchers
* en cliquant sur un rucher on affiche un lien vers la carte des ruches du rucher et la liste des ruches.

Carte d'un rucher
* elle permet de déplacer ses ruches.
* un clic sur une ruche affiche un lien vers le détail de cette ruche et vers son essaim ainsi que la liste des hausses.
* le chemin optimal de parcours des ruches est affiché. On peut [exporter ce parcours](docs/images/exportKmlGgEarth.png) et la position des ruches au format GPX ou KML.
* mesures de longueur, surface et d'azimut (cartes IGN et OSM)
* pour les cartes IGN on peut dessiner un profil, calculer une altitude et afficher les parcelles cadastrales.
* cercles pour matérialiser les distances de butinage
* des outils de dessin de polygones, de polylignes, de marqueurs avec des textes que l'on peut afficher dans des popups. Ces dessins peuvent être enregistrés en base de donnée.
* géolocalisation GPS avec dépose d'un marqueur sur la carte.

## Nos clients, ils nous font confiance !   :-)
https://les-abeilles-de-la-lisette.fr/wordpress/


