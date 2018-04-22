#! /usr/bin/python
# print ('To jest moj tekst w pythonie')


import paramiko #pobranie biblioteki
m=paramiko.SSHClient() #definiuje obiekt do komunikacji
type(m)

m.set_missing_host_key_policy(paramiko.AutoAddPolicy())
m.connect('localhost', username='tester01', password='sroda2018')
a,b,c=m.exec_command('cat /proc/cpuinfo') #wywolywanie komendy
wynik = b.read()
lista_elementow = wynik.split('\n')
# print m,


for el in lista_elementow:
    if el.find('tester01')>=0:
        print ('user exists')
        break
else:
    print 'user not found'


for el in lista_elementow:
    if el.find('tgsdgsdgsdgsd')>=0:
        print 'user exists'
        break
else:
    print ('user not found')



import re
for el in lista_elementow:
    if re.search('tester01',el):
        print ('user exists')
        break
else:
    print 'user not found'
