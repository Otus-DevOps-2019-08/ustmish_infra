#!/usr/bin/python3
import sys
import json

def getInnerInventoryJson():
    contentFile = ''
    for line in open('inventory.json',encoding='utf-8'):
        contentFile += line.rstrip("\n\r")
    #f = open('inventory2.json')
    #f2 = json.load(f)
    #return json.dumps(f2)
    return contentFile
if __name__ == "__main__":
    if sys.argv[1] == "--list":
       # print(getInnerInventoryJson())
       print(getInnerInventoryJson())




