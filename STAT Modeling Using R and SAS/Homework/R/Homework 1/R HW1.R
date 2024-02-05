f=file.choose()
ojjuice=read_table(f)
cols(
   run = col_double(),
   sweetness = col_double(),
   pectin = col_double()
 )
ojjuice
print(as_tibble((ojjuice)),n=24)
ggplot(ojjuice, aes(x=pectin, y=sweetness)) + geom_point()
ggplot(ojjuice, aes(x = pectin)) + geom_histogram(bins = 10)
#scewed to the right
ggplot(ojjuice,aes(y=pectin))+geom_boxplot()


g=file.choose()
tests=read_table(g)
cols(
  gender = col_character(),
  CAS = col_double(),
  CARS = col_double()
)
tests
tests %>% count(gender)
ggplot(tests,aes(x=gender,y=CAS))+geom_boxplot()
tests %>% group_by(gender) %>% summarize(m=median(CAS))
tests %>% summarise_if(is.numeric,c(mean,sd))
ggplot(tests,aes(x=CAS,y=CARS,colour=gender))+geom_point()





