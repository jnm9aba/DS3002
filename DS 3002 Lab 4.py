

import json
import requests


stock = input("What is the abbreviation for the stock? ")
stock = stock.split(',')
url = "https://yfapi.net/v6/finance/quote"


headers = {
    'x-api-key': "hrNpLLHA6ekM2pJQ8UYQ3ZOiIW46Qvq3gc5UcTae"
    }

for x in stock:
    try:
        querystring = {"symbols":x}
        response = requests.request("GET",url,
                                    headers=headers,params=querystring)
        stock_json= response.json()
        stockPrice = stock_json['quoteResponse']['result'][0][
                'regularMarketPrice']
        longName = stock_json['quoteResponse']['result'][0]['longName']
        print(longName+": "+str(stockPrice))
    except KeyError:
        print(x+" is not a valid stock.")
    except IndexError:
        print(x+" is not a valid stock.")
        
# Sources
        
# Had help from Joe von Storch
        
# https://stackoverflow.com/questions/23294658/asking-the-user-for-
#input-until-they-give-a-valid-response
        
# https://stackoverflow.com/questions/7378091/taking-multiple-inputs-from-user
#-in-python
        
# https://www.geeksforgeeks.org/taking-input-in-python/
