require_relative 'analyze_model'

require 'druzy/mvc'

module Competence

  class Analyse < Druzy::MVC::Controller
  
    def initialize(kwargs={})
      if kwargs[:model] == nil
	initialize(:model => AnalyzeModel.new)
      else
	super(kwargs[:model])
      end

    end
  end
end
