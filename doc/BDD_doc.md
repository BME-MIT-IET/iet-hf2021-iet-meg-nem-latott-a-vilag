# BDD Dokumentáció

## Beüzemelés
A beüzemelés node-on keresztül történt, ami automatikusan betette a cucumber.js-t a fejlesztői függőségek közé. Létrehoztam egy új
parancsot bdd-test néven, amivel a cucumber tesztjeit lehet végrahajtani(`npm run bdd-test`). A parancs a cucumber.js fájl alapján futtatja a teszteket, ott lehet
konfigurálni.

## Report
A cucumber futtatáskor csinál egy html reportot, ami `test/reports` mappában lesz megtalálható.

## Struktúra
A bdd tesztek a test/features mappában találhatóak, valamint az itt található step_definitions mappában vannak a lépések megvalósításai is.

A README.md leírása alapján készítettem el a feature-ket. Mivel ez nem egy nagy projekt, ezért sikerült a teljes viselkedést letesztelnem
Tesztelt feautue-k
- paraméterek manipulása
- host manipulálása
- path manipulálása
- hash manipulálása
- port változtatása
- protocol változtatása
- auth(jelszó és felhasználónév)
- query
- encode és decode