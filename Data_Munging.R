##DISCLAIMER
##
##This dataset is owned and supplied by the Dutch datamining company Sentient Machine Research, and is based on real world business data. You are allowed to use this dataset and accompanying information for non commercial research and education purposes only. It is explicitly not allowed to use this dataset for commercial education or demonstration purposes. For any other use, please contact Peter van der Putten, info@smr.nl.
##
##This dataset has been used in the CoIL Challenge 2000 datamining competition. For papers describing results on this dataset, see the TIC 2000 homepage: http://www.wi.leidenuniv.nl/~putten/library/cc2000/
##----------------------------------------------------------------------------------------------------------------------------------------
##REFERENCE
##
##P. van der Putten and M. van Someren (eds). CoIL Challenge 2000: The Insurance Company Case. 
##Published by Sentient Machine Research, Amsterdam. Also a Leiden Institute of Advanced Computer Science Technical Report 2000-09. June 22, 2000.  
##----------------------------------------------------------------------------------------------------------------------------------------

#creates a temporary directory
tmpdir <- tempdir() 

#taking the url file to download
url <- 'http://archive.ics.uci.edu/ml/databases/tic/tic.tar.gz'

#removing all of the path up to and including the path separator
file <- basename(url)

#downloading file
download.file(url, file)

#Extracting files
untar(file, compressed = 'gzip', exdir = tmpdir )

#listing the file on to console
list.files(tmpdir)

#loading training dataset
train <- read.table("ticdata2000.csv", sep = "\t")

#loading test dataset
test <- read.table("ticeval2000.csv", sep = "\t")

#loading column names from DataDictionary
DataDictionary <- read.csv("DataDictionary.csv", header = F)
names(DataDictionary) <- c("DataDic")

L0 <- read.csv("L0.csv", col.names = c("L0"))
L1 <- read.csv("L1.csv", header = T)
L2 <- read.csv("L2.csv", header = T)
L3 <- read.csv("L3.csv", header = T)
L4 <- read.csv("L4.csv", header = T)

#Alternative Way to load multiple CSV files into R (Couldn't use because of training and testing data set format)
#temp = list.files(pattern="*.csv")
#myfiles = lapply(temp, read.delim)

#Converted DataDictionary into suitable format for variable names using macros
names(train) <- c("MOSTYPE Customer Subtype see L0","MAANTHUI Number of houses 1 – 10","MGEMOMV Avg size household 1 – 6",
                  "MGEMLEEF Avg age see L1","MOSHOOFD Customer main type see L2","MGODRK Roman catholic see L3","MGODPR ,rotestant",
                  "MGODOV Other religion","MGODGE No religion","MRELGE Married","MRELSA Living together","MRELOV Other relation",
                  "MFALLEEN Singles","MFGEKIND Household without children","MFWEKIND Household with ,hildren",
                  "MOPLHOOG High level education","MOPLMIDD Medium level education","MOPLLAAG Lower level education",
                  "MBERHOOG High status","MBERZELF Entrepreneur","MBERBOER Farmer","MBERMIDD Middle management",
                  "MBERARBG Skilled labourers","MBERARBO Unskilled labourers","MSKA Social class A","MSKB1 Social class B1",
                  "MSKB2 Social class B2","MSKC Social class C","MSKD Social class D","MHHUUR Rented ,ouse","MHKOOP Home owners",
                  "MAUT1 1 car","MAUT2 2 cars","MAUT0 No car","MZFONDS National Health Service","MZPART Private health insurance",
                  "MINKM30 Income < 30.000","MINK3045 Income 30-45.000","MINK4575 ,ncome 45-75.000","MINK7512 Income 75-122.000",
                  "MINK123M Income >123.000","MINKGEM Average income","MKOOPKLA Purchasing power class",
                  "PWAPART Contribution private third party insurance see L4","PWABEDR ,ontribution third party insurance (firms)",
                  "PWALAND Contribution third party insurane (agriculture)","PPERSAUT Contribution car policies",
                  "PBESAUT Contribution delivery van policies","PMOTSCO Contribution ,otorcycle/scooter policies","PVRAAUT Contribution lorry policies",
                  "PAANHANG Contribution trailer policies","PTRACTOR Contribution tractor policies","PWERKT Contribution agricultural machines policies ",
                  "PBROM Contribution moped policies","PLEVEN Contribution life insurances","PPERSONG Contribution private accident insurance policies",
                  "PGEZONG Contribution family accidents insurance policies","PWAOREG ,ontribution disability insurance policies",
                  "PBRAND Contribution fire policies","PZEILPL Contribution surfboard policies","PPLEZIER Contribution boat policies",
                  "PFIETS Contribution bicycle policies","PINBOED Contribution property insurance policies",
                  "PBYSTAND Contribution social security insurance policies","AWAPART Number of private third party insurance 1 - 12",
                  "AWABEDR Number of third ,arty insurance (firms)","AWALAND Number of third party insurane (agriculture)",
                  "APERSAUT Number of car policies","ABESAUT Number of delivery van policies","AMOTSCO Number of motorcycle/scooter policies",
                  "AVRAAUT Number of lorry policies","AAANHANG Number of trailer policies","ATRACTOR Number of tractor policies",
                  "AWERKT Number of agricultural machines policies","ABROM Number of moped policies","ALEVEN Number of life insurances",
                  "APERSONG Number of private accident insurance policies","AGEZONG Number of family accidents insurance policies",
                  "AWAOREG Number of disability insurance policies","ABRAND Number of fire policies","AZEILPL Number of surfboard policies",
                  "APLEZIER Number of boat policies","AFIETS Number of bicycle policies","AINBOED Number of property insurance policies",
                  "ABYSTAND Number of social security insurance policies","CARAVAN Number of mobile home policies 0 - 1")

names(test) <- c("MOSTYPE Customer Subtype see L0","MAANTHUI Number of houses 1 – 10","MGEMOMV Avg size household 1 – 6",
                 "MGEMLEEF Avg age see L1","MOSHOOFD Customer main type see L2","MGODRK Roman catholic see L3","MGODPR ,rotestant",
                 "MGODOV Other religion","MGODGE No religion","MRELGE Married","MRELSA Living together","MRELOV Other relation",
                 "MFALLEEN Singles","MFGEKIND Household without children","MFWEKIND Household with ,hildren",
                 "MOPLHOOG High level education","MOPLMIDD Medium level education","MOPLLAAG Lower level education",
                 "MBERHOOG High status","MBERZELF Entrepreneur","MBERBOER Farmer","MBERMIDD Middle management",
                 "MBERARBG Skilled labourers","MBERARBO Unskilled labourers","MSKA Social class A","MSKB1 Social class B1",
                 "MSKB2 Social class B2","MSKC Social class C","MSKD Social class D","MHHUUR Rented ,ouse","MHKOOP Home owners",
                 "MAUT1 1 car","MAUT2 2 cars","MAUT0 No car","MZFONDS National Health Service","MZPART Private health insurance",
                 "MINKM30 Income < 30.000","MINK3045 Income 30-45.000","MINK4575 ,ncome 45-75.000","MINK7512 Income 75-122.000",
                 "MINK123M Income >123.000","MINKGEM Average income","MKOOPKLA Purchasing power class",
                 "PWAPART Contribution private third party insurance see L4","PWABEDR ,ontribution third party insurance (firms)",
                 "PWALAND Contribution third party insurane (agriculture)","PPERSAUT Contribution car policies",
                 "PBESAUT Contribution delivery van policies","PMOTSCO Contribution ,otorcycle/scooter policies","PVRAAUT Contribution lorry policies",
                 "PAANHANG Contribution trailer policies","PTRACTOR Contribution tractor policies","PWERKT Contribution agricultural machines policies ",
                 "PBROM Contribution moped policies","PLEVEN Contribution life insurances","PPERSONG Contribution private accident insurance policies",
                 "PGEZONG Contribution family accidents insurance policies","PWAOREG ,ontribution disability insurance policies",
                 "PBRAND Contribution fire policies","PZEILPL Contribution surfboard policies","PPLEZIER Contribution boat policies",
                 "PFIETS Contribution bicycle policies","PINBOED Contribution property insurance policies",
                 "PBYSTAND Contribution social security insurance policies","AWAPART Number of private third party insurance 1 - 12",
                 "AWABEDR Number of third ,arty insurance (firms)","AWALAND Number of third party insurane (agriculture)",
                 "APERSAUT Number of car policies","ABESAUT Number of delivery van policies","AMOTSCO Number of motorcycle/scooter policies",
                 "AVRAAUT Number of lorry policies","AAANHANG Number of trailer policies","ATRACTOR Number of tractor policies",
                 "AWERKT Number of agricultural machines policies","ABROM Number of moped policies","ALEVEN Number of life insurances",
                 "APERSONG Number of private accident insurance policies","AGEZONG Number of family accidents insurance policies",
                 "AWAOREG Number of disability insurance policies","ABRAND Number of fire policies","AZEILPL Number of surfboard policies",
                 "APLEZIER Number of boat policies","AFIETS Number of bicycle policies","AINBOED Number of property insurance policies",
                 "ABYSTAND Number of social security insurance policies")
