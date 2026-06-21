import requests
import sys

x = requests.get('https://w3schools.com/python/demopage.htm')

print(x.text)
print(sys.version)