; (0) Cocina -> Mesa
; (1) Mesa -> Cocina
(deffacts pedidos
    (platos 3 direccion 0 mesa 3)
    (platos 2 direccion 0 mesa 2)
    (platos 4 direccion 1 mesa 3)
    (platos 2 direccion 1 mesa 1))

(defrule servirPlato
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test < x 4)
    (test (= y 0))
    =>
    (retract ?pedido))

(defrule recogerPlato
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test < x 4)
    (test (= y 1))
    =>
    (retract ?pedido))

(defrule demasiadosPlatos
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    test(> x 4)
    =>
    (assert (platos 4 direccion ?y mesa ?z))
    (assert (platos (- ?x 4) direccion ?y mesa ?z))
    (retract ?pedido))