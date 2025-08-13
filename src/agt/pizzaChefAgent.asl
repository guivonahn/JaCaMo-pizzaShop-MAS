
+!requestIngredient(Item)
    <- .send(supplier, achieve, checkSupply(Item));
    .print("sent request for ingredient ", Item).

+!removeIngredients
    : stock(cheese, X) & X >= 1
    & stock(tomato, Y) & Y >= 1
    & stock(dough, Z) & Z >= 1
    <- .send(supplier, achieve, removeSupply(cheese));
    .send(supplier, achieve, removeSupply(tomato));
    .send(supplier, achieve, removeSupply(dough)).

+!check_all
    <- !requestIngredient(cheese);
    !requestIngredient(tomato);
    !requestIngredient(dough).

+!canMakePizza
    : stock(cheese, X) & X >= 1
    & stock(tomato, Y) & Y >= 1
    & stock(dough, Z) & Z >= 1
    <- +canMakePizza;
    .print("canMakePizza").


+!makePizza
    : canMakePizza
    <- !removeIngredients;
    !check_all; 
    .send(customer, achieve, receivedPizza);
    .print("sent pizza");
    -canMakePizza;
    !canMakePizza.

+!makePizza
    : not(canMakePizza)
    <- .send(customer, achieve, notReceived).

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }
