# uni_pdf

Used for checking :

1. Whether pdf has password
2. validate correct password against custom input

## How to use
There are only 2 methods you can use

    Future<bool> isEncrypted(String filePath)
    Future<bool> isPasswordCorrect(String filePath, String password)

I guess they are self explanatory in nature. 
