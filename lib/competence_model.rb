require 'druzy/mvc'

module Competence
  class CompetenceModel < Druzy::MVC::Model
   
    attr_reader :icon, :file

    def initialize
      super()

      @icon = File.dirname(__FILE__)+'/image/icon.png'
      @file = ''
    end

    def file=(file)
      old, @file = @file, file
      fire_property_change(Druzy::MVC::PropertyChangeEvent.new(self,'file',old,@file))
    end
  end
end
