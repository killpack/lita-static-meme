require 'spec_helper'

describe Lita::Handlers::StaticMeme, lita_handler: true do

  context "with a mapping configuration object" do
    before do
      Lita.config.handlers.static_meme.mapping = { 
        /deal with it/i => ["http://i.imgur.com/ykDuU.gif", "http://i.imgur.com/3PWHn.gif"],
        /ship it/i => "https://skitch-img.s3.amazonaws.com/20111026-r2wsngtu4jftwxmsytdke6arwd.png"
      }
    end

    context "for atomic mappings" do
      it "replies to the given regex with the given image" do
        send_message("ship it")
        expect(replies.last).to include("https://skitch-img.s3.amazonaws.com/20111026-r2wsngtu4jftwxmsytdke6arwd.png")
      end
    end

    context "for array mappings" do
      it "replies to the given regex with a random image from the array" do
        send_message("deal with it")
        expect(replies.last).to satisfy { |reply| ["http://i.imgur.com/ykDuU.gif", "http://i.imgur.com/3PWHn.gif"].include? reply }
      end
    end
  end
end
