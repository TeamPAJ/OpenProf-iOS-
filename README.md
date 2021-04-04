# OpenProf-iOS-

<img width="114" alt="Capture d’écran 2021-04-01 à 22 11 48" src="https://user-images.githubusercontent.com/73397915/113351930-e0df0d80-933b-11eb-9798-eafd31df5232.png">
Documentation officielle de l'application OpenProf

SOMMAIRE :
     
     - Introduction à l'application
     - Prérequis 
     - Installation
     - <b>L'application</b>
     - <b>Pour les développeurs</b>
     - Les cartes
     - Patchs et bugs

<h1>Introduction :</h1> 

OpenProf est une application mobile compatible iOS dont l'objectif est basé sur la chance du joueur.
En effet, l'utilisateur possède un certains nombre de gems.
<img width="62" alt="Capture d’écran 2021-04-01 à 20 21 18" src="https://user-images.githubusercontent.com/73397915/113337250-d1ee6000-9327-11eb-9dd0-b807447827b5.png">

<u>Ces gems sont indispensables pour ouvrir des caisses afin d'obtenir des cartes*</u>
   
*<p style="color: red;">[!!WARNING!! Toute représentation avec des personnalités ou croyances (religieuses ou non) n'est que pure coïncidence. 
!!Les items et photos présentes dans OpenProf sont utilisés à but interactif afin de mettre en place l'obtention aléatoire de cartes.]</p>

<img width="256" alt="Capture d’écran 2021-04-01 à 20 34 41" src="https://user-images.githubusercontent.com/73397915/113338667-b2f0cd80-9329-11eb-90d8-32228848eca5.png">

<h1>Prérequis :</h1> 

Pour pouvoir profiter de l'application, il y a certains prérequis :

 - Posséder un appareil fonctionnant sous l'OS d'Apple (iOS)
 - Posséder un modèle d'appareil au moins supérieur à l'iPhone X et +
 - Si vous êtes développeur, le logiciel XCode est indispensable pour la gestion des bugs et des patchs
 - Si vous êtes développeur, il est préferable d'utiliser XCode / Swift dernière version sour Mac OS Big Sur
 - En cas de bugs, merci d'envoyer un retour à : teamPAJ.contact@gmail.com

<h1>Installation</h1>

Si vous faites partie des utilisateurs qui remplissent les conditions émises dans la partie Prérequis,
vous pouvez désormais installer OpenProfv1.0
Pour cela, il suffira de se rendre dans la branche user-OpenProf afin de télecharger le fichier .app
Pour les développeurs, la branche dev-OpenProf contient l'ensemble des fichiers sources pour lancer OpenProf sur XCode


<h1>L'application</h1>
Voici donc une présentation plus précise de l'application, étape par étape, pour l'utilisation de l'application par un 
nouvel utilisateur : 

ÉTAPE 1 : L'utilisateur installe l'application sur son iPhone X (ou modèles supérieurs).<br>
<img width="210" alt="Capture d’écran 2021-04-02 à 23 41 55" src="https://user-images.githubusercontent.com/73397915/113456259-04be5400-940d-11eb-8bba-70f1089ea85c.png"><br>


ÉTAPE 2 : L'utilisateur lance l'application et tombe sur la page de chargement (chargement des ressources, des fichiers Swift et des textures).<br>
<img width="210" alt="Capture d’écran 2021-04-02 à 23 43 51" src="https://user-images.githubusercontent.com/73397915/113456346-4b13b300-940d-11eb-8d3b-8113ca588224.png"><br>



ÉTAPE 3 : L'utilisateur inscrit son pseudo. Ce pseudo est permanent car il est enregistré grâce à un système de sauvegarde interne (programmé manuellement en Swift à l'aide du Core Data).
Il appuie ensuite sur Jouer pour commencer le jeu.<br>
<img width="210" alt="Capture d’écran 2021-04-02 à 23 48 27" src="https://user-images.githubusercontent.com/73397915/113456639-0fc5b400-940e-11eb-89b8-035d67194918.png"><br>


ÉTAPE 4 : L'utilisateur arrive tout d'abord sur la boutique du jeu. C'est normal ! En effet, il a l'occasion de récupérer 100 gems gratuites afin de pouvoir ouvrir les caisses (l'utilisateur commence au départ à 0 gems, cette caisse gratuite est donc indispensable !)
En cliquant sur le bouton "Gratuit", l'utilisateur obtient les gems gratuits qui s'ajoutent automatiquement (tout en se sauvegardant) à son inventaire de gems.<br>
<img width="210" alt="Capture d’écran 2021-04-04 à 14 13 59" src="https://user-images.githubusercontent.com/73397915/113508373-02184780-9550-11eb-9d5b-184acf4d91a7.png">.    <img width="210" alt="Capture d’écran 2021-04-04 à 14 14 54" src="https://user-images.githubusercontent.com/73397915/113508410-23793380-9550-11eb-97bd-864116b18280.png">



ÉTAPE 5 : Après être passé par la boutique, il va arriver sur la page "principale" de l'application OpenProf. En effet, c'est ici qu'on retrouve les principales informations : nom d'utilisateur, nombre de gems, carte obtenue après avoir cliquée sur la caisse, système d'obtention de carte avec sauvegarde. C'est donc ici que l'opening ( = ouverture) de coffres va se faire. Pour info, 1 coffre =  2gems consommés. À chaque clic sur la caisse, un algorithme de probabilité est lancé pour déterminer la récompense du joueur. <b>Plus la carte est rare, plus le joueur gagne de l'XP</b>
<h3>Le coffre côute 2 gems, et, à chaque ouverture de coffre, si l'utilisateur décide de garder la carte (avec le bouton "Obtenir"), il gagne de l'XP, suivant la rareté de la carte !</h3>
<br>
<img width="210" alt="Capture d’écran 2021-04-04 à 14 18 43" src="https://user-images.githubusercontent.com/73397915/113508504-ad290100-9550-11eb-97d9-7c34e861fa93.png">
<br>

Dès que l'utilisateur n'a plus de gems, le bouton Obtenir devient automatiquement un bouton "Boutique" et l'achat de coffre devient impossible.<br>
<img width="210" alt="Capture d’écran 2021-04-03 à 00 08 31" src="https://user-images.githubusercontent.com/73397915/113457702-bf038a80-9410-11eb-9ae4-0a812ecded4a.png"><br>

ÉTAPE 6 : La page Profil est disponible en cliquant sur la médaille (en haut à gauche sur la vue Accueil).
Cette page permet à l'utilisateur de garder un oeil sur son niveau.!<br>
<img width="210" alt="Capture d’écran 2021-04-04 à 14 27 38" src="https://user-images.githubusercontent.com/73397915/113508736-ea41c300-9551-11eb-8bcf-3015f8113db2.png"><br>


<h1>Pour les développeurs</h1>
Vous êtes développeurs, et vous aimeriez comprendre la structure de l'application ? Voici un condensé de ce qu'il faut savoir : 
- Comment a été programmé OpenProf ?
OpenProf a été programmé en Swift (langage de programmation de la firme Apple) à l'aide de l'IDE spécialisé en programmation iOS Xcode.<br>

- À quoi correspondent les fichiers présents dans le Git ?<br>
Chaque fichier joue un rôle primordial dans le bon fonctionnement de l'application : <br>
--> Premièrement le dossier <b>Base.lprof</b> contient les fichiers qui servent à faire le "visuel de l'application", ils ont l'extension <b>.storyboard</b>
Il n'y en a que deux : <u>Main.storyboard</u> qui contient tous les visuels des vues présentes dans l'application (Boutique, Accueil, Profil, etc). Le deuxième fichier est <u>LaunchScreen.storyboard</u>, qui correspond au visuel de la vue de l'écran de chargement (la vue qui s'affiche dès qu'on lance l'application).<br>
<br>--> Deuxièmement, on a un dossier <b>OpenProf.xcdatamodel</b> contenant un fichier <u>content</u>. Ce dossier gère le Core Data Model. En programmation mobile, il est impératif de stocker des informations propres à chaque utilisateur dans une base de donnée directement intégrée au téléphone. En iOS, c'est le Core Data.
Dans le fichier content, on retrouve, <b>comme en programmation web</b>, des tables de données : User qui stocke des valeurs comme le nom de l'utilisateur, Cards, qui stocke les cartes débloquées par l'utilisateur et leur nombre, etc.<br>
<br>--> Troisièmement, le dossier <b>OpenProf.xcodeproj</b>, qui contient les fichiers de configuration du projet qui héberge l'application.<br>
<br>--> Quatrièmement, on retrouve que des fichiers <b>.swift</b>. <h4>Ce sont les plus intéressants !</h4> Ils contiennent tous le code permettant de construire 
les différentes focntionnalités de l'app OpenProf comme : la fonction de tirages aléatoires (randomNumber), gestion du nombre de cartes, ajout de gemmes au clique sur des boutons (Listeners), etc.
Chaque fichier swift <b>représente une classe objet définissant la vue sur laquelle le code va s'appliquer</b>. Par exemple, le fichier StoreViewController définit la classe StoreViewController héritant de classes parentes indispensables (UIViewController), et qui est liée à la vue de la boutique. <br>Elle va donc contenir l'ensemble des méthodes qui permettent de configurer les différentes fonctionnalités de la boutique. Pour ce qui est des autres classes : <br>
<ul> 
     <li><u>CardsViewController</u> : liée à la vue des cartes (collection de cartes), elle contient des méthodes permettant de communiquer avec la vue Accueil 
          pour "écouter" si l'utilisateur a gardé la carte ou non, et compter le nombre.</li>
     <li><u>LoginViewController</u> : liée à la vue de Login (la vue qui vient après le chargement, où l'on demande le pseudo de l'utilisateur, s'il a déjà été entré, l'input n'apparaît pas).</li>
     <li><u>SaleViewController</u> :  encore en cours de développement (à cause de bugs inattendus), elle correspond à la vue "Marché" (bloquée dans le jeu pour le moment), permettant de vendre les cartes en échange de gems.</li>
     <li>etc.</li>


</ul><br>

<h1>Les cartes</h1>
Voici donc pour l'instant les cartes disponibles dans le jeu : <br>

<p><img alt="" src="https://user-images.githubusercontent.com/73397915/113458180-e4dd5f00-9411-11eb-9e9c-da6ff2fd47b8.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458210-ee66c700-9411-11eb-8ed2-abf43cc48d61.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458433-8369c000-9412-11eb-84e2-f28e915600ae.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458219-f4f53e80-9411-11eb-8f88-5a91548fb072.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458223-f888c580-9411-11eb-9115-f139f33755cd.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458229-fc1c4c80-9411-11eb-8362-21efb2287404.png" width="80"></p>

<h1>Collection de cartes</h1>
Comme expliqué précédemment, l'utilisateur a le choix entre garder (avec le bouton "Obtenir") ou laisser (en cliquant une nouvelle fois sur le coffre) la carte ouverte. S'il la garde, il augmente automoatiquement sa collection de cartes.<br>
<img width="210" alt="Capture d’écran 2021-04-04 à 14 36 40" src="https://user-images.githubusercontent.com/73397915/113508946-2d506600-9553-11eb-9e33-6a0470dc7da3.png"><br>

<h1>Easter Egg</h1>
<p>Parmi les différentes fonctionnalités, certaines restent encore inconnues, avec des cartes secrètes. À vous de trouver un moyen de les débloquer !</p>


<h1>Patchs et bugs</h1>
Il sera possible que, lors de l'utilisation de l'application, vous rencontriez un ou plusieurs bugs.
Tout au long du développement de l'application, nous avons établie une liste de bugs
en fonction de leur probabilité d'apparation : 

   - Erreur mémoire [Très Peu probable] : enregistrement de l'état de sauvegarde ; nb de cartes, de gemmes, etc... (Core Data de l'app)
   - Erreur logicielle [Peu Probable] : compteur de gems freeze, boutique qui charge infiniment, niveau de l'utilisateur qui freeze.

Certains patchs ont été effectués afin de corriger un bon nombre de bugs liés à la sauvegarde du jeu. D'autres patchs visaient à ajouter des fonctionnalités sans impacter le système de sauvegarde.


