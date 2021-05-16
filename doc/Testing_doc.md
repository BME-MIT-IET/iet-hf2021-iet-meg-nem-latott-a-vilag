# Tesztelés Dokumentáció

## Beüzemelés
A beüzemelés node-on keresztül történt, a projekt alapból már tartalmazott mochajs-el készült teszteket tehát a saját test-case eimet is azzal írtam az egyszerűség kedvéért.

A teszt kódlefedettségének méréséhez hozzáadtam az https://istanbul.js.org -t a projekthez, és beállítottam, hogy lefusson a teszten.

## Struktúra
A mocha tesztek a test mappában az url.test.js fileban találhatóak, és futtathatóak az  `npm run test` paranccsal.

## Tesztek

Új tesztek hozzáadásával javítottuk a tesztelés kódlefedettségét.

Átnéztük a kódot és értelmezük hol lehetett még további teszteket hozzáadni olyan részekhez amik soha nem hívódnak meg.

Ilyen részek voltak:
 - isEmptyQuery() függvény
 - amennyiben a query üres tömböt kap megfelelően alakítja-e át és a végeredmény egy üres query string lesz-e
 - az URL-t megfelelő részekre bont-e fel a program amikkel utána tovább dolgozik
 - az elérési útban található karaktereket megfelelően kódolni tudja-e (encoding)
 - az elérési út visszalakításánál (decode) érzékeli-e ha nem létező két vagy három hex hosszú karakterkódokat talál, ilyen esetekben megfelelően jár-e el

Ezek implementálásával majdnem teljessé tettük a kódlefedettséget és minden fő alkotóelemét teszteltük a programnak.