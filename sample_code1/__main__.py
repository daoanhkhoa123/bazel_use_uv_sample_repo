import requests
import sys
import numpy as np

x = requests.get('https://w3schools.com/python/demopage.htm')

print(x.text)
print(sys.version)
print(np.random.randint(5, 10))