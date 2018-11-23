| figure a b c m1 m2|
figure := DrGeoCanvas nouveau.
figure pleinEcran; afficherGrille; afficherAxes.
a := figure segmentDe: 2@ 3 a: 0@0.
a nommer: 'a'.
b := figure segmentDe: 0@0 a: -1@2.
b nommer: 'b'.
c := figure segmentDe: -1@2 a: 2@3.
c nommer: 'c'.
m1 := (figure mediatrice: a) couleur: Color red.
m2 := (figure mediatrice: b) couleur: Color red.
(figure mediatrice: c) couleur: Color red.
figure cercleCentre: (figure intersectionDe: m1 et: m2) passantPar: 0@0.
(figure point: 0@0) montrer
