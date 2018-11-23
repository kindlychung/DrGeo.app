| canvas koch |
canvas := DrGeoCanvas new fullscreen. 
koch := [ ].
koch := [ :a :b :k | |ab c d v |
	k > 0 ifTrue: [ 
		ab := (canvas segment: a to: b) hide.
		c := (canvas pointOnCurve: ab at: 1 / 3) hide.
		d := (canvas pointOnCurve: ab at: 2 / 3) hide.
		v := (canvas 
		altIntersectionOf: (canvas perpendicularBisector: ab) hide 
		and: (canvas circleCenter: c to: d) hide) hide.
		koch value: a value: c value: k - 1. 
		koch value: c value: v value: k - 1. 
		koch value: v value: d value: k - 1.
		koch value: d value: b value: k - 1].
	canvas segment: a to: b].
koch 
	value: ((canvas point: -8@3) name: 'A')
	value: ((canvas point: 8@3) name: 'B')
	value: 5
