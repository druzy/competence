require 'druzy/mvc'
require 'java'
require 'jrubyfx'

fxml_root File.dirname(__FILE__)

module Competence
  
  class AnalyzeApp < JRubyFX::Application    
  end
	
  class AnalyzeAppController
	include JRubyFX::Controller
        fxml('about_view.fxml')
	
  end
  class AnalyzeView < Druzy::MVC::View
    
    

    def initialize(controller)
      super(controller)

      
    end

    def display
      @analyze_frame.visible = true
    end

    def close
      @analyze_frame.dispose
    end
  end
end
