############################################################
# Copied this script from Engineering Man on Youtube (with minor tweeks)
# to run: 
# python scam_spam.py
# Did it to attack a scammer
############################################################

import requests
import os
import random
import string
import json

names = []
with open('scam_spam.txt', 'r') as f:
	names = f.read().strip('\r').split('\n')

char = string.digits + '!@#$@^$#%$'
chars = [i for i in char]
random.seed = (os.urandom(1024))
url = '' ## Insert link to their website here
print(chars)
count = 0

name_new = [name.split() for name in names]
name_nn = [z for x in name_new for z in x]
# print(name_nn)
# for name in names:
for i in name_nn:
	random.shuffle(chars)
	temp = ''.join(chars)
	username = i.lower() + str(random.randint(1000,1000000))
	random.shuffle(chars)
	password = ''.join(chars)

	# print('u: ' + username)
	# print('p: ' + password)
	requests.post(url, allow_redirects=False, data = {'a': username, 'b': password})
	#requests.post(url, allow_redirects=False, data = {'userId': username, 'password': password})
	#requests.post(url, allow_redirects=False, data = {'kdhkkaf': username, 'uukschk': password})
	print('Sending user ' + username + ' password ' + password)





