# OpenProf-iOS-

<img width="114" alt="Capture d’écran 2021-04-01 à 22 11 48" src="https://user-images.githubusercontent.com/73397915/113351930-e0df0d80-933b-11eb-9798-eafd31df5232.png">
Documentation officielle de l'application OpenProf

SOMMAIRE :
     
     - Introduction à l'application
     - Prérequis 
     - Installation
     - <b>L'application</b>
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


<h1> Les focntionnalités </h1>
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
En cliquant sur le coffre, l'utilisateur obtient les gems gratuits qui s'ajoutent automatiquement (tout en se sauvegardant) à son inventaire de gems.<br>

ÉTAPE 5 : Après être passé par la boutique, il va arriver sur la page "principale" de l'application OpenProf. En effet, c'est ici qu'on retrouve les principales informations : nom d'utilisateur, nombre de gems, carte obtenue après avoir cliquée sur la caisse, système d'obtention de carte avec sauvegarde. C'est donc ici que l'opening ( = ouverture) de coffres va se faire. Pour info, 1 coffre =  2gems consommés. À chaque clic sur la caisse, un algorithme de probabilité est lancé pour déterminer la récompense du joueur. <b>Plus la carte est rare, plus le joueur gagne de l'XP</b><br>
<img width="210" alt="Capture d’écran 2021-04-03 à 00 00 37" src="https://user-images.githubusercontent.com/73397915/113457628-9085af80-9410-11eb-9845-7bf1fa683bf9.png"><br>

Dès que l'utilisateur n'a plus de gems, le bouton Obtenir devient automatiquement un bouton "Boutique" et l'achat de coffre devient impossible.<br>
<img width="210" alt="Capture d’écran 2021-04-03 à 00 08 31" src="https://user-images.githubusercontent.com/73397915/113457702-bf038a80-9410-11eb-9ae4-0a812ecded4a.png"><br>

ÉTAPE 6 :



<h1>Les cartes</h1>
Voici donc pour l'instant les cartes disponibles dans le jeu : <br>
<p><img alt="" src="https://user-images.githubusercontent.com/73397915/113458180-e4dd5f00-9411-11eb-9e9c-da6ff2fd47b8.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458210-ee66c700-9411-11eb-8ed2-abf43cc48d61.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458433-8369c000-9412-11eb-84e2-f28e915600ae.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458219-f4f53e80-9411-11eb-8f88-5a91548fb072.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458223-f888c580-9411-11eb-9115-f139f33755cd.png" width="80">
<img alt="" src="https://user-images.githubusercontent.com/73397915/113458229-fc1c4c80-9411-11eb-8362-21efb2287404.png" width="80"></p>



<h1>Patchs et bugs</h1>


Il sera très probable que, lors de l'utilisation de l'application, vous rencontriez des bugs.
Tout au long du développement de l'application, notre équipe développement (on est deux zbi) a établie une liste de bugs
en fonction de leur probabilité d'apparation : 

   - Erreur mémoire [Peu probable] : enregistrement de l'état de sauvegarde ; nb de cartes, de gemmes, etc... (Core Data de l'app)
   - Erreur logicielle [Probable] : compteur de gems freeze, boutique qui charge infiniment, niveau de l'utilisateur qui freeze.

Certains patchs ont été effectués afin de corriger un bon nombre de bugs liés à la sauvegarde du jeu. D'autres patchs visaient à ajouter des fonctionnalités sans impacter le système de sauvegarde.


