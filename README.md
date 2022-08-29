# FantasyGroundsXMLConverter

> Fantasy Grounds XML converter
https://amerisun.me/fantasy-grounds-xml-to-json-converter/

This is a piece of software that will take character exports from Fantasy Grounds and convert the XML to whatever format the XSL it's using 
outputs to.  There is an embeded XSL but this software will work with any XSL provided.

Specifically the embeded one with the applciation uses an XSL parser that transforms the data to JSON to be 
used in this https://darylbuckle.dev/dnd-character-sheets/stats website.  

This software is only XSL 1.0 compliant because of Dot Net not updating their internal implementation of XSL.  If anyone knows any better XSL parser 
that works with Dot Net and is good freeware, please reach out as I would love to have XSL 3.0 support.  There are quite a few libraries but most of them 
are rather expensive for a free software like this.

## Version 1.0
- First iteration deployed


