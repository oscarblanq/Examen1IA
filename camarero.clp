; (0) Cocina -> Mesa
; (1) Mesa -> Cocina
(deffacts pedidos
    (platos 3 direccion 0 mesa 3)
    (platos 2 direccion 0 mesa 2)
    (platos 4 direccion 1 mesa 3)
    (platos 2 direccion 1 mesa 1))

(defrule servirPlato
    ?pedido <- (platos ?x direccion ?y mesa ?z)
    (test (= y 0)))

(defrule recogerPlato)
