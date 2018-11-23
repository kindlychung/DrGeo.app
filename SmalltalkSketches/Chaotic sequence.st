| canvas r  u |

canvas := DrGeoCanvas new fullscreen axesOn scale: 100.
canvas centerTo: 4@ -2.
r := canvas float: 0.8 at: 0 @ -1 from: 0 to: 4 name: 'r' showValue: true.
u := canvas pointOnCurve: (canvas segment: 0@0 to: 0@1) at: 0.7.
u name: '0'.

1 to: 100 do: [ :n | | v |
	v := canvas  " v sequence term "
		point: [ :previous | | value |
			value := previous point y.	" value of the previous sequence term "
			n / 5 @ (r value * value * (1 - value)) ]
		parent: u.
	v name: n.
	(canvas segment: u to: v) dotted.
	u color: (n even ifTrue: [Color blue] ifFalse: [Color red]).
	u := v ]
