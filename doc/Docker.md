# Docker dokumentáció

## Cél
Mivel a választott projectünk egy NodeJS-ben és böngészőben is futtatható library, a docker által megvalósítható funkcionalitás eléggé szűk volt. Mivel a deployment nem éppenséggel fontos kérdés a librarynél, ezért úgy gondoltam más irányból tekinthetnék a problémára. A docker egyik fő jellemzője, hogy azonos futtató környezetet biztosít, így elősegítve a szoftver verzióbeli, illetve rendszer beli különbségekből adódó problémák elkerülését. A tesztelés során sokat javíthat a munka minőségén, ha csak a kódban található problémákra kell fókuszálnunk, és nem a rendszer beliekre.

## Megvalósítás
Az image létrehozásához a `node:14`-es minta image-t használtam, ugyanis ezt a long term support verziót használjuk mindannyian. A docker működéséből adódóan lépésenként cacheli a végrehajtott munkát, ezért kell kezdenünk a project függőségeinek telepítésével, hogy ne kelljen minden egyes alkalommal lefutnia ennek a lépésnek. A `package.json`-t ezért másoljuk be előbb, ugyanis ha a dependencia telepítés előtt másolnánk be a repository tartalmát a dependenciák cache érvénytelenítve lenne.

## Teszt erermények eljutattása a felhasználóhoz
Mivel a dockerből kiolvasni a logokat jelentősen kényelmetlenebb lenne minden változtatás után, ezért ki kellett találnom valami egyszerű módszert a teszteredmények továbbításához. A legjobban elérhető módszer az egyértelműen a webböngésző, szóval telepítettem egy egyszerű `http-server` nevű csomagot a Node package manager segítségével. A servert csak el kell indítani a megfelelő mappával paraméterként és már ki is szolgálja a mappa tartalmát.

## Eredmények kiszolgálható formába történő átalakítása
Mivel egy terminálra érkező kimenetet kell kijeleznem egy webböngészőben, a terminál kimenetet kell kiírnom egy html file-ba. A böngészők a html szabványt követik, de ha egy fileba csak szöveget írunk semmi féle szabványos html kód nélkül, a böngésző akkor is kijelzi a szöveget, csupán formázatlanul teszi ezt.

## Végső lépések
- A kódon lefuttatjuk a "build" lépést ami mindösszesen a kód minify-olását jelenti.
- Tesztek lefuttatása.
  * Tesztek futattása npm és MochaJS segítségével.
  * A tesztek kimenetét bele pipe-oljuk a sed nevű utility eszközbe, és beillesztünk soronként egy sortörést, hogy ne legyenek ömlesztve a böngészőben a tesztesetek. A sed kimenetét kiírjuk a tesztesetek megjelenítésére szánt file-ba.
  ```bash
  npm test | sed 's/$/\<br \/\>/' > /app/test/index.html
  ```
- Az előző lépéshez hasonlóan lefuttatjuk a BDD teszteket és hozzáfűzzük a file végéhez.
  ```bash
  npm run bdd-test | sed 's/$/\<br \/\>/' >> /app/test/index.html
  ```
- Ezek után kiszolgáljuk a `test` mappát lokálisan a 8081-es porton.
  ```bash
  http-server /app/test/ -p 8081
  ```
- Utolsó teendőnk megnyitni a külvilág felé a 8081-es portot a docker konténerből.
  ```dockerfile
  EXPOSE 8081
  ```

## Helper scriptek
Írtam három helper scriptet a munkafolyamat meggyorsításához.

### builddocker.sh
- Egyetlen lépésben buildelem a docker image-t `domurl-test` néven.
  ```bash
  docker build -t domurl-test .
  ```

### rundocker.sh
- Buildelem a docker image-t, mivel minden egyes kód változásnál szükséges az image fájlban lévő kódbázis frissítése a repository-ból, amit csak a build folyamatában tudunk megtenni.
  ```bash
  docker build -t domurl-test .
  ```
- Kényelemből kijelzem az aktuálisan futó konténereket, hogyha futna még egy előző buildből származó példány.
  ```bash
  docker container ls
  ```
- Eltávolítom a korábbi példányt, ugyanis a docker hibára fut, ha azonos port-ot próbálunk kikérni többször egymás után. A hiba abból ered, hogy egy portot csak egy program foglalhat le magának, amit már megtettünk az előző futtatásnál. 
  ```bash
  docker rm -f domurl-test
  ```
- Futtatom az elkészült image-ünket. Célszerű detached módban futtatni a konténert, ugyanis így nem blokkolja a kliens terminálunkat. Elnevezzük a konténert, majd futtatáskor az expose-olt portot leképezzük a külvilág felé az azonos portra. Végül megadjuk az image-ünk nevét.
  ```bash
  docker run -d --name domurl-test -p 8081:8081 domurl-test
  ```
- Végül még egy kényelmi funkció. Ha lefutott a docker run parancsunk, megnyitjuk a webserveren található html filet a böngészőben. Ez a parancs csak linux rendszereken működik.
  ```bash
  xdg-open http://localhost:8081/
  ```

### killdocker.sh
- Kiíratom az aktuálisan futó konténereket diagnosztika miatt.
  ```bash
  docker container ls
  ```
- Törlöm a konténert, hogy helyet adjak egy későbbi újabb verziónak.
  ```bash
  docker rm -f domurl-test
  ```