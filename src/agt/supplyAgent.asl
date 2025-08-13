+!checkSupply(Item)
        <- checkStock(Item, N);
        .print(Item, N);
        !sendStock(Item, N).

+!sendStock(Item, N)
        <- .send(pizzaChef, tell, stock(Item, N)).

+!addSupply(Item)
        <- addStock(Item);
        .print("added stock ", Item).

+!removeSupply(Item)
        <- removeStock(Item).

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }