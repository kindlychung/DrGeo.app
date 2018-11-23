| canvas s mobile pen convertFactor|
canvas := DrGeoCanvas new fullscreen axesOn gridOn.
s := canvas segment: 0@0 to: 30@0.
mobile := canvas pointOnCurve:	 s at: 0.
convertFactor := 180 / Float halfPi.
pen := canvas 
	point: [ :item | Point r: 0.2 * item point x degrees: item point x * convertFactor ]
	parent: mobile.
canvas locusOf: pen when: mobile.
canvas