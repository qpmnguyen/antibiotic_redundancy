from bs4 import BeautifulSoup
import wget 
import os 
with open("files.txt") as file:
	links = file.read()

soup = BeautifulSoup(links, 'html.parser')

for link in soup.find_all('a'): 
	url = link.get('href')
	name = url.replace('https://pubs.broadinstitute.org/diabimmune/data/14', '')
	if name in os.listdir("."):
		continue
	else: 
		filename = wget.download(url)
		print(filename)
