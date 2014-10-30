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
DataDictionary <- read.csv("DataDictionary.csv", header = T)

L0 <- read.csv("L0.csv", header = T)
L1 <- read.csv("L1.csv", header = T)
L2 <- read.csv("L2.csv", header = T)
L3 <- read.csv("L3.csv", header = T)
L4 <- read.csv("L4.csv", header = T)

#Alternative Way to load multiple CSV files into R (Couldn't use because of training and testing data set format)
#temp = list.files(pattern="*.csv")
#myfiles = lapply(temp, read.delim)

#Converted DataDictionary into suitable format for variable names using macros
names(train) <- c("Customer Subtype see L0","Number of houses 1 – 10","Avg size household 1 – 6",
                  "Avg age see L1","Customer main type see L2","Roman catholic see L3","Protestant","Other religion",
                  "No religion","Married","Living together","Other relation","Singles","Household without children",
                  "Household with children","High level education","Medium level education","Lower level education",
                  "High status","Entrepreneur","Farmer","Middle management","Skilled labourers","Unskilled labourers",
                  "Social class A","Social class B1","Social class B2","Social class C","Social class D","Rented house",
                  "Home wners","1 car","2 cars","No car","National Health Service","Private health insurance",
                  "Income < 30.000","Income 30-45.000","Income 45-75.000","Income 75-122.000","41 MINK123M Income >123.000",
                  "Average ncome","Purchasing power class","Contribution private third party insurance see L4",
                  "Contribution third party insurance (firms)","Contribution third party insurane (agriculture)",
                  "Contribution car olicies","Contribution delivery van policies","Contribution motorcycle/scooter policies",
                  "Contribution lorry policies","Contribution trailer policies","Contribution tractor policies",
                  "Contribution gricultural machines policies ","Contribution moped policies","Contribution life insurances",
                  "Contribution private accident insurance policies","Contribution family accidents insurance policies",
                  "Contribution disability insurance policies","Contribution fire policies","Contribution surfboard policies",
                  "Contribution boat policies","Contribution bicycle policies","Contribution property nsurance policies",
                  "Contribution social security insurance policies","Number of private third party insurance 1 - 12",
                  "Number of third party insurance (firms)","Number of third party insurane (agriculture)",
                  "Number of car policies","Number of delivery van policies","Number of motorcycle/scooter policies",
                  "Number of lorry policies","Number of trailer policies","Number of tractor policies",
                  "Number of gricultural machines policies","Number of moped policies","Number of life insurances",
                  "Number of private accident insurance policies","Number of family accidents insurance policies",
                  "Number of disability nsurance policies","Number of fire policies","Number of surfboard policies",
                  "Number of boat policies","Number of bicycle policies","Number of property insurance policies",
                  "Number of social security nsurance olicies","Number of mobile home policies 0 - 1")

names(test) <- c("Customer Subtype see L0","Number of houses 1 – 10","Avg size household 1 – 6",
                 "Avg age see L1","Customer main type see L2","Roman catholic see L3","Protestant","Other religion",
                 "No religion","Married","Living together","Other relation","Singles","Household without children",
                 "Household with children","High level education","Medium level education","Lower level education",
                 "High status","Entrepreneur","Farmer","Middle management","Skilled labourers","Unskilled labourers",
                 "Social class A","Social class B1","Social class B2","Social class C","Social class D","Rented house",
                 "Home wners","1 car","2 cars","No car","National Health Service","Private health insurance",
                 "Income < 30.000","Income 30-45.000","Income 45-75.000","Income 75-122.000","41 MINK123M Income >123.000",
                 "Average ncome","Purchasing power class","Contribution private third party insurance see L4",
                 "Contribution third party insurance (firms)","Contribution third party insurane (agriculture)",
                 "Contribution car olicies","Contribution delivery van policies","Contribution motorcycle/scooter policies",
                 "Contribution lorry policies","Contribution trailer policies","Contribution tractor policies",
                 "Contribution gricultural machines policies ","Contribution moped policies","Contribution life insurances",
                 "Contribution private accident insurance policies","Contribution family accidents insurance policies",
                 "Contribution disability insurance policies","Contribution fire policies","Contribution surfboard policies",
                 "Contribution boat policies","Contribution bicycle policies","Contribution property nsurance policies",
                 "Contribution social security insurance policies","Number of private third party insurance 1 - 12",
                 "Number of third party insurance (firms)","Number of third party insurane (agriculture)",
                 "Number of car policies","Number of delivery van policies","Number of motorcycle/scooter policies",
                 "Number of lorry policies","Number of trailer policies","Number of tractor policies",
                 "Number of gricultural machines policies","Number of moped policies","Number of life insurances",
                 "Number of private accident insurance policies","Number of family accidents insurance policies",
                 "Number of disability nsurance policies","Number of fire policies","Number of surfboard policies",
                 "Number of boat policies","Number of bicycle policies","Number of property insurance policies",
                 "Number of social security nsurance olicies")
