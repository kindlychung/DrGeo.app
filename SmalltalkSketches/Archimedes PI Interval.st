| sketch circle ray1 ray2 tangent1 tangent2 points angle radius innerPolygon outerPolygon computePolygons|
sketch := DrGeoCanvas new fullscreen.
radius := 5.       
circle := sketch circleCenter: 0@0 radius: radius.
circle large color: Color red.
computePolygons := [ ].
computePolygons := [:sides  |
angle := Float twoPi  / sides.
points ifNotNil: [ points do: [ :point | sketch domain deleteMathItem: point mathItem ] ].
points := Array new: sides.
points at: 1 put: (sketch point: radius@0) hide.
2 to: sides do: [:i | 
	points at: i put: (sketch rotate: (points at: i - 1) center: 0@0 angle: angle) hide].
ray1 := (sketch ray: 0@0 to: (sketch middleOf: points first and: points second) hide) dotted.
tangent1 := (sketch perpendicular: ray1 at: (sketch altIntersectionOf: circle and: ray1) hide) dotted.
ray2 := (sketch ray: 0@0 to: (sketch middleOf: points second and: points third) hide) dotted.
tangent2 := (sketch perpendicular: ray2 at: (sketch altIntersectionOf: circle and: ray2) hide) dotted.
outerPolygon := sketch 
	regularPolygonCenter: 0@0 
	vertex: (sketch intersectionOf: tangent1 and: tangent2) hide 
	sides: sides.
innerPolygon := (sketch regularPolygonCenter: 0@0 vertex: radius@0 sides: sides) opaque color: Color white.
sketch 
	text: (String streamContents: [:s |
		s nextPutAll: 'Sides: '; print: sides;  cr;
		nextPutAll:  ((innerPolygon mathItem length / (2 * radius)) printShowingDecimalPlaces: 4); 
		nextPutAll: ' < π < ';
		nextPutAll: ((outerPolygon mathItem length / (2 * radius)) printShowingDecimalPlaces: 4)])
	at: 0@0].

sketch do: [ 
	3 to: 20 do: [ :mySide | 
		computePolygons value: mySide.
		sketch update.
		(Delay forMilliseconds: 500) wait].
]
