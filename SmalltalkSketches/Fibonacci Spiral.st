|canvas shape alfa fibo a b m s|
canvas := DrGeoCanvas new fullscreen.
alfa := (canvas freeValue: -90 degreesToRadians) hide.
shape := [:c :o :f| | e p |
	e := (canvas rotate: o center: c angle: alfa) hide.
	(canvas arcCenter: c from: o to: e) large.
	p := canvas translate: e vector: (canvas vector: c to: o) hide.
	(canvas polygon: { c. o. p hide. e }) name: f.
	e].
fibo := [ ].
fibo := [ :f :o :c :k | | e f1 f2 f3 c2|
"f1: term Fn-1, f2: term Fn, o & c: origin and center of spiral arm
e: extremity of the spiral arm"
	f1 := f first.
	f2 := f second.
	f3 := f1 + f2.
	e := shape value: c value: o value: f3.	
	c2 := (canvas scale: c center: e factor: f3 / f2) hide.
	k > 0 ifTrue: [ fibo value: {f2. f3} value: e value: c2 value: k - 1 ]].

a := canvas point: 1@0.
b := canvas point: -1 @0.
m := (canvas middleOf: a and: b) hide.
s := shape value: m value: a value: 1.
shape value: m value: s value: 1.
fibo value: {1. 2} value: b value: a value: 10
