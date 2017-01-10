require 'druzy/mvc'

module Competence
  class AboutModel < Druzy::MVC::Model
    
    attr_reader :icon, :message

    def initialize
      super()

      @icon = File.dirname(__FILE__)+'/image/icon.png'
      @message_file = File.dirname(__FILE__)+'/about.html'
      f = File.open(@message_file)
      @message = f.read
      f.close
    end
  end
end
