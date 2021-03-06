|canvas curveBlock curve w R A F S f Phi phi s pMobile pCurve time|canvas := DrGeoCanvas new.R := canvas float:  1 at: -10@5 from: 0 to: 10 name: 'R'. A := canvas float: 1 at: -10@4 from: 0 to: 10 name:  'A'.F := canvas integer: 3 at: -10@3 from: 0 to: 10 name: 'F' showValue: true.S := canvas float: 0 at: -10@2 from: 0 to: 3 name: 'S'.f := canvas float: 0.2 at: -10@1 from:  0 to: 1 name: 'f'.Phi := canvas float: 0 at: -10@0 from: 0 to: Float twoPi name: 'Φ'.phi := canvas float: 0 at: -10@ -1 from: 0 to: Float twoPi name: 'φ'.s := canvas segment: -10@ -3 to: -5@ -3.pMobile := canvas pointOnCurve: s at: 0.time := 0.w := [:theta :t | A value * (F  value * theta + (S value  * t) + Phi value) sin * (f value * t + phi value) cos].curveBlock := [:mobile | |wValue thetaValue x y |	thetaValue := mobile abscissa * Float twoPi.	wValue := w value: thetaValue value: time. 	x := (R value + wValue) * thetaValue cos.	y := (R value + wValue) * thetaValue sin.	x @ y].pCurve := canvas point: curveBlock parent: pMobile.curve := canvas locusOf: pCurve when: pMobile.curve large; color: Color blue.canvas do: [	1 to: 1000 by: 0.03 do: [:t |		time := t.		canvas update.		(Delay forMilliseconds: 100) wait]]