require_relative 'competence/version'
require_relative 'competence_model'

require 'druzy/mvc'

module Competence
  class Competence < Druzy::MVC::Controller
    def initialize(kwargs={})
      if kwargs[:model]==nil
	initialize(:model => CompetenceModel.new)
      else
	super(kwargs[:model])
      end
    end
  end
end
