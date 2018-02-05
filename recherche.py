#!/usr/bin/python3
# -*- coding: UTF-8 -*-
# vim: set fileencoding=utf-8 :

import sys
import cgi
from indeed import IndeedClient
import socket, json

def main():
	client = IndeedClient(1503807284228428)
	form = cgi.FieldStorage()
	start = 0
	Entreprise = {}
	pays = "fr"
# 	region = "31"
#	recherche = "sap"
# recherche = form.getvalue("recherche")
# region = form.getvalue("region")
#	hote = "localhost"
#	port = 12345

#	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#	s.connect((hote, port))
#	print('Connection au port'.format(port))

	params = {
		'q' : recherche,
		'l' : region,
		'userip' : "1.2.3.4",
		'useragent' : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)",
		'co' : pays,
		'start': start
	}

	search_response = client.search(**params)
	keylist = search_response.keys()
	increment = search_response['end']
	totalResults = search_response['totalResults']

	del search_response['results']
# print(totalResults)
	while start < totalResults:
		params = {
		'q' : recherche,
		'l' : region,
		'userip' : "1.2.3.4",
		'useragent' : "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2)",
		'co' : pays,
		'start': start
		}
		search_response = client.search(**params)
		for offre in search_response['results']:
			del offre['formattedRelativeTime']
			del offre['formattedLocationFull']
			# del offre['noUniqueUrl']
			del offre['onmousedown']
			del offre['state']
			del offre['sponsored']
			del offre['formattedLocation']
			if offre['company'] in Entreprise:
				Entreprise[offre['company']] =  Entreprise[offre['company']] + 1
			else:
				Entreprise[offre['company']] = 1

		start = start + increment
# print(Entreprise)


#	for k in Entreprise.keys():
#		print(k, Entreprise[k])
#		s.send(k.encode('utf-8'))

#	intxt = json.dumps(Entreprise)
#	s.send(intxt.encode('utf-8'))
#	s.close()
	print(json.dumps(Entreprise, indent = 3,ensure_ascii=False))
# socket.send(Entreprise)
if __name__ == "__main__":
	if len(sys.argv) > 2:
		recherche = sys.argv[1]
		region = sys.argv[2]
	else:
		if len(sys.argv) > 1:
			recherche = sys.argv[1]
			region = ''
		else:
			print("Erreur de paramètres")
	main()
