; (0) Cocina -> Mesa
; (1) Mesa -> Cocina
(deffacts pedidos
    (platos 3 direccion 0 mesa 3)
    (platos 2 direccion 0 mesa 2)
    (platos 4 direccion 1 mesa 3)
    (platos 2 direccion 1 mesa 1))

(defrule servirPlato
    (declare (salience 2))
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test (< x 4))
    (test (= y 0))
    =>
    (retract ?pedido))

(defrule recogerPlato
    (declare (salience 2))
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test (< x 4))
    (test (= y 1))
    =>
    (retract ?pedido))

(defrule demasiadosPlatos
    (declare (salience 2))
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test (> x 4))
    =>
    (assert (platos 4 direccion ?y mesa ?z))
    (assert (platos (- ?x 4) direccion ?y mesa ?z))
    (retract ?pedido))

(defrule final
    (declare (salience 1))
    =>
    (halt))