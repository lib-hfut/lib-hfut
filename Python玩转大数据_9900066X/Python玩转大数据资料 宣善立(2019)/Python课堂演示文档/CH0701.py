# CH0701.py
import requests

def getHTMLText(URLStr):
    try:
        print(URLStr)
        re = requests.get(URLStr, timeout=30)

        re.raise_for_status()
        re.encoding = 'utf-8'
        
        return re.text
    except:
        print("Error!")
# end of getHTMLText

URL = 'http://www.baidu.com'
HTMLStr = getHTMLText(URL)
print(HTMLStr)
