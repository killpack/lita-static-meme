# lita-static-meme

**lita-static-meme** is a handler for [Lita](https://github.com/jimmycuadra/lita) 
that allows you to respond to arbitrary regular expressions with given images.

There are [existing gems](https://github.com/wallace/lita-memegen) that dynamically
generate memes from given snippets of text, but sometimes you just want Lita to 
respond to a particular phrase with a static image. One approach would be to write
a separate handler for each phrase / image pair, but wouldn't you rather just 
specify a mapping between regular expressions and URLs? (I would!)

## Installation

As per usual, add that puppy to your Gemfile:

`gem 'lita-static-meme', github: 'killpack/lita-static-meme'`

## Configuration

```
Lita.configure do |config|
  ...
  config.handlers.static_meme.mapping = {
    /ship it/i => "https://skitch-img.s3.amazonaws.com/20111026-r2wsngtu4jftwxmsytdke6arwd.png", # specify a single response image...
    /deal with it/i => ["http://i.imgur.com/ykDuU.gif", "http://i.imgur.com/3PWHn.gif"] # ...or a set to randomly choose from
  }
  ...
end
```

## Usage
Given the configuration above:
`jordan_killpack`: `blah blah blah she should just deal with it`
`Lita`: ![DEAL WITH IT](http://i.imgur.com/ykDuU.gif)
