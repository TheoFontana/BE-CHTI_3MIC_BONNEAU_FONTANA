# PROJET CHTI – Partie assembleur
## INSA Toulouse – 3 MIC-IR-C1
## Bonneau Clémentine
## Fontana Théo

Ce projet vise à mettre en place un jeu de tir laser sur cibles. À l’aide de six pistolets lasers (pour un maximum de six joueurs), le but du jeu sera de tirer sur des cibles, et d’obtenir en fin de partie les scores de chacun des joueurs. Afin de différencier les différents pistolets, chacun d’entre eux a une fréquence différente qui le caractérise

## Objectif 1 : Calcul de dft en simulation

Notre code se trouve dans le dossier [Objectif_1](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/Objetif_1)
### Partie 2.1 : Prérequis :
Au niveau des tables de trigo, nous avons obtenu les valeurs :
-	Min : 0x3FFF0001, en notation 2.30
-	Max : 0x40006114, en notation 2.30

### Calcul de la dft :

Nous avons validé les tests effectués avec le jeu de test.

Pour tester notre résultat :
*	Ajouter des points d’arrêts aux lignes 56 et 64 dans le fichier Calcul_DFT_M2
*	Observez respectivement la parties réelles et imaginaires de la DFT, renvoyées dans R0 par la fonction calcul_somme.

## Objectif 2 : dft en temps réel et gestion des scores

Notre code se trouve dans le dossier [Objectif_2](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/Objetif_2)
### Pour tester notre programme :
* Choisissez un scénario de test via la fonction ```Init_TimingADC_ActiveADC_ff()``` en jouant sur le paramètre ```Duree_Ech_ticks```
* Ajouter ```compteur_occurences[.]``` et ```scores[.]``` dans le logic analyser en tant que variables analogiques comprises respectivement entre 0 et 21, puis 0 et 10.
* Lancer le programme et observer

Exemple de résultat obtenu

![](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/blob/master/Screenshots/Objectif_2.png)
## Objectif 3 : Gestion du son
### Prérequis – Signal carré :
Notre code se trouve dans le dossier [Objectif_3/Prerequis_Signal_carre](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/Objetif_3/Prerequis_Signal_carre)

Pour observer notre signal carré :

* Dans le logic analyser, afficher la variable ```portb.1```, en bit (car nous modifions le bit n°1).
* Lancer le programme

![](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/blob/master/Screenshots/Objectif_3.1.png)
### Gestion du son :
Notre code se trouve dans le dossier [Objectif_3](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/Objetif_3)

Pour observer notre spectre de son :
* Dans le logic analyser, ajouter la variable ```TIM3_CCR3```, en variable analogique, sur une plage de 0 à 719. 
* Lancer le programme

![](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/blob/master/Screenshots/Objectif_3.2.png)

Pour vérifier le temps entre deux échantillons : 

* Mettre un point d’arrêt sur la ligne 22 du fichier son.s.
* Lancer le programme une première fois, jusqu’au point d’arrêt
* Réinitialiser le temps t1 du debbuguer
* Relancer le programme jusqu’au point d’arrêt

La variable t1 affiche bien 91us.

## Objectif 4 : Projet final

Notre code se trouve dans le dossier [Objectif_4](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/Objetif_4)

Pour tester notre programme complet : 
* Dans le logic analyser, afficher les variables présentées pour vérifier l’objectif 2 ( ```compteur_occurences[.]``` et ```scores[.]```), et l’objectif 3 : ```TIM3_CCR3```. 

![](https://github.com/TheoFontana/BE-CHTI_3MIC_BONNEAU_FONTANA/blob/master/Screenshots/Objectif_4.png)

Le son se déclenche bien à chaque fois qu’un score est incrémenté. Nous avons pris un son court (N), pour remplacer le bruit de verre, afin d’éviter une surcharge visuelle.
