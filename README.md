# lita-static-meme

**lita-static-meme** is a handler for [Lita](https://github.com/jimmycuadra/lita) 
that allows you to respond to arbitrary regular expressions with given images.

There are [existing gems](https://github.com/wallace/lita-memegen) that dynamically
generate memes from given snippets of text, but sometimes you just want Lita to 
respond to a particular phrase with a static image. One approach would be to write
a separate handler for each phrase / image pair, but wouldn't you rather just 
specify a mapping between regular expressions and URLs? (I would!)
