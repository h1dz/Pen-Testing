seasons = ['Summer', 'Winter', 'Spring', 'Autumn']
months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'Sepetember', 'October', 'November', 'Decemeber']
years = ['1980', '1981', '1982', '1983', '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992', '1993', '1994', '1995', '1996', '1997', '1998', '1999', '2000', '2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023']
#Will generate a wordlist with the month + the year
with open('MonthAndYear.txt', 'w') as wordlist:
	for month in months:
		for year in years:
			password = month + year
			wordlist.write(f'{password}\n')
#Will generate a wordlist with the season + the year
with open('SeasonAndYear.txt', 'w') as wordlist:
	for season in seasons:
		for year in years:
			password = season + year
			wordlist.write(f'{password}\n')
