system("hostname", intern=TRUE)

cat("              Cores     memory(GB)\n")
cat("Anvil login: ", 8*32, "     ", 8*32*512, "\n")
cat("Anvil sub-c: ", (1000+32+16)*128, "  ", (1000*256+32*1000+16*512)*128, "\n")

dat <- read.csv("/anvil/projects/tdm/data/disney/flight_of_passage.csv")

head(dat)
flight_of_passage <- dat
rm(dat)