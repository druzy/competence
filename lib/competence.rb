require_relative 'about'
require_relative 'about_view'
require_relative 'analyze'
require_relative 'analyze_view'
require_relative 'competence/version'
require_relative 'competence_model'

require 'druzy/mvc'
require 'rjb'

module Competence
  class Competence < Druzy::MVC::Controller

    FileChooser = Rjb::import('javafx.stage.FileChooser')

    def initialize(kwargs={})
      if kwargs[:model]==nil
	       initialize(:model => CompetenceModel.new)
      else
	       super(kwargs[:model])
      end
    end

    def notify_action(view,action,kwargs={})
      if action == :cross_clicked
        view.close
      elsif action == :browse_button_clicked

        dialog = FileChooser.new
        res = dialog.show_open_dialog(nil)
    	  if res != nil
    	    file = res.to_s
    	    @model.file = file
    	  end
	    elsif action == :analyze_button_clicked
        analyze = Analyse.new
      	analyze.add_view(AnalyzeView.new(analyze))
      	analyze.display_views
      elsif action == :about_button_clicked
      	about = About.new
      	about.add_view(AboutView.new(about))
        puts 'prout'
      	about.display_views
      elsif action == :exit_button_clicked
        notify_action(view,:cross_clicked)
      end
    end
  end
end
