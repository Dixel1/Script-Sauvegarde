# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Automatisation d'une sauvegarde #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Récupération du nombre de fichiers
nbFichiers=$(ls htdocs/ | wc -l)

# Récupération de la date du jour
horodatage=$(date +%Y%m%d%H%M%S)

# Vérification du nombre de fichiers
case $nbFichiers in

	# Cas où il y a  fichier
	0) nomFichier="Complete-"$horodatage;
	   echo "Sauvegarde complète";;
	
	# Cas où il y a 1,2,3,4 fichiers, la barre du six c'est un OU logique
	1 | 2 | 3 | 4 ) nomFichier="Differentielle-"$horodatage;
					echo "Sauvegarde différentielle "$nomFichier;;
	
	# Cas où il y a 5 fichiers
	5) nomFichier="Complete-"$horodatage;
	   echo "Sauvegarde complete "$nomFichier" et si succès destruction de l'ancienne chaîne";;
	  
	# Cas où il y a plus de 5 fichiers
	*) echo "Nombre de sauvegarde incorrect";;
esac