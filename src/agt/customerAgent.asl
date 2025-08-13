+!wantPizza
        <- .send(pizzaChef, achieve, makePizza).

+!receivedPizza
    : true
    <- .print("pizza received").

+!notReceived
    : true
    <- .print("not received pizza").

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }
    