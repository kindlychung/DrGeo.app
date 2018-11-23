| fig point comment x y random inArc tries|
"Monte-Carlo PI approximation"
fig := DrGeoCanvas new fullscreen scale: 400.
fig arcCenter: 0@0 from:  1@0 to: 0@1.
fig polygon: { 0@0. 0@1. 1@1. 1@0 }.
comment := fig texte: '' a: 0@ -0.1.
random := Random seed: Time millisecondClockValue.
tries := 100.
inArc := 0.
1 to: tries do: [: try |
	x := random next.
	y := random next.
	point := (fig point: x@y) small.
	(x squared + y squared) > 1
		ifTrue: [point color: Color blue  ]
		ifFalse: [inArc := inArc + 1 ].
comment text: 'Tries: ', try asString, '
approx: ', (inArc * 4 / try) asFloat asString.
World doOneCycle.
]