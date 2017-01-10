# encoding: utf-8

require 'druzy/mvc'
require 'java'
require 'jrubyfx'

fxml_root File.dirname(__FILE__)
JRuby.objectspace = true

module Competence

  class AboutApp < JRubyFX::Application
    
    attr_accessor :view, :main_thread

    def start(stage)
      stage.title = 'À propos de Compétence'
      stage.icons.add(Image.new('file:'+@view.controller.model.icon))
      stage.resizable = false

      controller  = stage.fxml(AboutAppController)
      controller.view = @view
      @view.controller_app = controller
      
      stage.show
    end

  end

  class AboutAppController
    
    attr_accessor :view, :stage, :field

    include JRubyFX::Controller
    fxml('about_view.fxml')

    def exit_button_clicked(event)
      Thread.new do
        @view.controller.notify_action(@view,:exit_button_clicked)
      end
    end

  end
  
  class AboutView < Druzy::MVC::View
    
    attr_accessor :controller_app

    java_import javafx.application.Platform

    def initialize(controller)
      super(controller)
      current = Thread.current

      Platform.run_later do
        @stage = javafx.stage.Stage.new
        
	app = AboutApp.new
	app.view = self
	app.main_thread = Thread.current
	
	app.start(@stage)
      end

    end

    def display
      Platform.run_later do
        @stage.show
      end
    end

    def close
      Platform.run_later do
        @stage.close
      end
    end

  end
end

