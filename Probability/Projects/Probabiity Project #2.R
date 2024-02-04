Game1=sample(seq(1:6),100,replace = TRUE)
Game1
table(Game1==6)
Game1=sample(seq(1:6),200,replace = TRUE)
Game1
table(Game1==6)
Game1=sample(seq(1:6),400,replace = TRUE)
Game1
table(Game1==6)
Game1=sample(seq(1:6),500,replace = TRUE)
Game1
table(Game1==6)
Game1=sample(seq(1:6),800,replace = TRUE)
Game1
table(Game1==6)
Game1=sample(seq(1:6),1000,replace = TRUE)
Game1
table(Game1==6)

Game2=rbinom(n=100,4,1/6)
Game2
table(Game2>0)
Game2=rbinom(n=200,4,1/6)
Game2
table(Game2>0)
Game2=rbinom(n=400,4,1/6)
Game2
table(Game2>0)
Game2=rbinom(n=500,4,1/6)
Game2
table(Game2>0)
Game2=rbinom(n=800,4,1/6)
Game2
table(Game2>0)
Game2=rbinom(n=1000,4,1/6)
Game2
table(Game2>0)


Game3=rbinom(n=100,24,1/36)
Game3
table(Game3>0)
Game3=rbinom(n=200,24,1/36)
Game3
table(Game3>0)
Game3=rbinom(n=400,24,1/36)
Game3
table(Game3>0)
Game3=rbinom(n=500,24,1/36)
Game3
table(Game3>0)
Game3=rbinom(n=800,24,1/36)
Game3
table(Game3>0)
Game3=rbinom(n=1000,24,1/36)
Game3
table(Game3>0)










