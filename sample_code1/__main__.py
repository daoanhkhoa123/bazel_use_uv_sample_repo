import requests

# Send a GET request
response = requests.get('https://httpbin.org/get', params={'search': 'python'})

# Check if the request was successful
if response.status_code == 200:
    # Print the raw text data
    print(response.text)
    
    # Parse and print response as JSON if applicable
    data = response.json()
    print(data)
