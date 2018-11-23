| canvas  triangle |
canvas := DrGeoCanvas new fullscreen.
triangle := [  ].
triangle := [ :a :b :c :k | | ca m mn n bo o p|
	canvas segment: a to: b.
	canvas segment: b to: c.
	ca := canvas segment: c to: a.
	m := (canvas middleOf: a and: b) hide.
	mn := (canvas perpendicular: ca at: m) hide.
	n := (canvas intersectionOf: mn and: ca) hide.
	bo := (canvas perpendicular: ca at: b) hide.
	o := (canvas intersectionOf: bo and: ca) hide.
	p := (canvas middleOf: b and: o)  hide.
	k > 0 ifTrue: [ 
		triangle value: a value: n value: m value: k - 1.
		triangle value: o value: n value: m value: k - 1.
		triangle value: m value: p value: o value: k - 1.
		triangle value: m value: p value: b value: k - 1.		
		triangle value: b value: o value: c value: k - 1]
	 ].
triangle 
	value: ((canvas point: -6@0) name: 'A') lock
	value: ((canvas point: 6@0) name: 'B') lock
	value: ((canvas point: 6@6) name: 'C') lock
	value: 3