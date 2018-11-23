| canvas s mobile pen convertFactor locus|
canvas := DrGeoCanvas new fullscreen axesOn gridOn.
s := canvas segment: 0@0 to: 10@0.
mobile := canvas pointOnCurve:	 s at: 0.
convertFactor := 180 / Float halfPi.
pen := canvas 
	point: [ :item | Point r: item point x sqrt degrees: item point x * convertFactor ]
	parent: mobile.
locus := canvas locusOf: pen when: mobile.
canvas symmetry: locus center: 0@0