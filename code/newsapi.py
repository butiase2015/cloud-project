import requests

def checkChoice(choice):
    if choice == "1":
        query = str(input("I would like to search for news about... "))
        return query

    elif choice == "2":
        query = str(input("I would like to search for news related to... "))
        country =str(input("in the country of... "))
        return query,country

    elif choice == "3" :
        print("Thansk for using our service ..... Bye")
        
        return (exit())


print("Hey!!! Want some news")


print("1. Search for news by Query")
print("2. Search for news by Country and Topic")
print("3. Exit")

choice = str(input("I would like to pick... "))


    


    






