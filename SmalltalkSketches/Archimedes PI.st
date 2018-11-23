| sketch circle polygon sides piText radius |
sketch := DrGeoCanvas new fullscreen.
radius := 5.
circle := sketch circleCenter: 0@0 radius: radius.
sides := sketch freeValue: 3.
polygon := sketch regularPolygonCenter: 0@0 vertex: radius@0  sides: sides.
piText := sketch text: '' at: 0@0.
sketch do: [
	4 to:  500 do: [: i | |digit delta approx fraction|
		approx := polygon mathItem length / (2 * radius).
		delta := Float pi - approx.
		digit := 10 raisedTo: delta abs log asInteger abs.
		fraction := (approx * digit) asInteger / digit.
		sides value: i.
		piText text: 'Approximation PI (',i printString,' sides): ' , approx printString, '
', fraction printString.
		sketch update.
		(Delay forMilliseconds: (i > 20 ifTrue: [0] ifFalse: [500])) wait]
]
