| canvas s mobile pen convertFactor locus|
canvas := DrGeoCanvas new fullscreen axesOn gridOn scale: 0.1.
s := canvas segment: 0@0 to: 40@0.
mobile := canvas pointOnCurve:	 s at: 0.
convertFactor := 180 / Float halfPi.
pen := canvas 
	point: [ :item | Point r: item point x squared  degrees: item point x * convertFactor ]
	parent: mobile.
locus := canvas locusOf: pen when: mobile.