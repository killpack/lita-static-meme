require 'lita'
module Lita
  module Handlers
    class StaticMeme < Handler
      @@configured = false

      def self.default_config(config)
        config.mapping = {}
      end

      def self.mapping
        Lita.config.handlers.static_meme.mapping
      end

      def self.dispatch(robot, message)
        unless @@configured
          self.mapping.each do |regex, img_value| 
            if img_value.is_a?(Array)
              route(regex, :random, help: { regex.to_s => "respond with image" }) 
            else
              route(regex, :echo, help: { regex.to_s => "respond with image" }) 
            end
          end
          @@configured = true
        end
        super(robot, message)
      end

      def echo(response)
        img = self.class.mapping[response.pattern]
        response.reply img
      end

      def random(response)
        imgs = self.class.mapping[response.pattern]
        response.reply imgs.sample
      end

    end
    Lita.register_handler(StaticMeme)
  end
end
