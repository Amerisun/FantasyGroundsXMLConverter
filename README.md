# FantasyGroundsXMLConverter

> Fantasy Grounds XML converter
https://amerisun.me/fantasy-grounds-xml-to-json-converter/

This is a piece of software that will take character exports from Fantasy Grounds and convert the XML to whatever format the XSL it's using 
outputs to.  There is an embeded XSL but this software will work with any XSL provided.

Specifically the embedded one with the application uses an XSL parser that transforms the data to JSON to be 
used in this https://darylbuckle.dev/dnd-character-sheets/stats website.  

This software is only XSL 1.0 compliant because Dot Net has not updated their internal implementation of XSL in a very long time.  If anyone knows of a good open sourced or free C# .NET 6.0 XSL 3.0 parser, please reach out as I would love to have XSL 3.0 support.  There are quite a few libraries but most of them are rather expensive.

## Version 1.0
- First iteration deployed


