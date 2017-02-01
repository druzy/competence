# encoding: utf-8

require 'druzy/mvc/java_view'

module Competence

  class CompetenceView < Druzy::MVC::JavaView

    def initialize(controller)
      super(controller, File.dirname(__FILE__)+'/java', 'CompetenceView')

    def property_change(event)

    end

  end

end
