# SonarCloud dokumentáció

## Cél
A SonarCloud nevű statikus analízis eszközt próbáltam telepíteni a repositoryra így elérve, hogy minden pull request létrehozásakor lefusson az analízis. Az eszköz segített volna elkerülni, hogy akármilyen codesmell vagy esetleges egyértelmű szemantikai hiba kerüljön a main ágra. 

## Probléma
Mivel a repository a tanszék organizationjében található, így nem volt jogosultságom hozzáadni a SonarCloud-hoz. Sajnos hozzáférés nélkül nem tudtuk beüzemelni az eszközt. Az így keletkező hiányt a lokálisan futtatható SonarLint eszközzel, és a CodeQL nevű felhő alapú szolgáltatásssal pótoltuk.