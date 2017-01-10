# encoding: utf-8

require 'druzy/mvc'
require 'java'
require 'jrubyfx'

fxml_root File.dirname(__FILE__)
JRuby.objectspace = true

module Competence
  
  class CompetenceApp < JRubyFX::Application
 
    java_import javafx.scene.image.Image

    def start(stage)
      stage.title = 'Compétence'
      stage.icons.add(Image.new('file:'+@view.controller.model.icon))

      controller  = stage.fxml(CompetenceAppController)
      
      controller.view = @view
      @view.stage = stage
      @view.controller_app = controller
      
      @main_thread.wakeup
    end

    def init
      @view = ObjectSpace._id2ref(parameters.raw[0].to_i)
      @main_thread = ObjectSpace._id2ref(parameters.raw[1].to_i)
    end

  end

  class CompetenceAppController
    attr_accessor :view, :stage, :field

    include JRubyFX::Controller
    fxml('competence_view.fxml')

    def browse_button_clicked(event)
      Thread.new do
        @view.controller.notify_action(@view,:browse_button_clicked)
      end
    end

    def analyze_button_clicked(event)
      Thread.new do
        @view.controller.notify_action(@view,:analyze_button_clicked)
      end
    end

    def about_button_clicked(event)
      Thread.new do
        @view.controller.notify_action(@view,:about_button_clicked)
      end
    end

    def exit_button_clicked(event)
      Thread.new do
        @view.controller.notify_action(@view,:exit_button_clicked)
      end
    end

  end

  class CompetenceView < Druzy::MVC::View
    
    java_import javafx.application.Platform

    attr_accessor :stage, :controller_app

    def initialize(controller)
      super(controller)
      current = Thread.current
      Thread.new do
        CompetenceApp.launch(self.object_id.to_s,current.object_id.to_s)
      end
      sleep
      
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

    def property_change(event)
      if event.property_name == 'file'
        Platform.run_later do
          @controller_app.field.text = event.new_value
	end
      end
    end

  end
  
end
