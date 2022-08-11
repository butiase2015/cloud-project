import requests
import urllib.parse
import base64
key ="NTczZWUwZDVmMmZjNDFiYmE3N2E4YjVlMjQyYmMwMjI="

def checkChoice(choice):
    if choice == "1":
        query = str(input("I would like to search for news about... "))
        URL="https://newsapi.org/v2/everything?q="+str(urllib.parse.quote(query))+"&from=2022-08-11&sortBy=publishedAt&apiKey="+str(base64.b64decode(key).decode("utf-8"))
    
        return URL

    elif choice == "2":
        query = str(input("I would like to search for news related to... "))
        country =str(input("in the country of... "))

        URL="https://newsapi.org/v2/top-headlines?country="+urllib.parse.quote(country)+"&category="+urllib.parse.quote(query)+"&apiKey="+base64.b64decode(key)

        return URL

    elif choice == "3" :
        print("Thansk for using our service ..... Bye")
        
        return (exit())
    else:
        print("Invalid choice")
        checkChoice(choice)



print("Hey!!! Want some news")


print("1. Search for news by Query")
print("2. Search for news by Country and Topic")
print("3. Exit")

choice = str(input("I would like to pick... "))

final=checkChoice(choice)

r= requests.get(url=final)
data = r.json()
for item in data[articles]:
    print (item)


#print(data)


    


    






