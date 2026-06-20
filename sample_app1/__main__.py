import requests

x = requests.get("https://httpbin.org/bytes/1")

print(x.text.encode().hex())