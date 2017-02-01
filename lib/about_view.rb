# encoding: utf-8

require 'druzy/mvc'
require 'rjb'

Rjb::load

module Competence

  class AboutView < Druzy::MVC::View

    URL = Rjb::import('java.net.URL')
    JFXPanel = Rjb::import('javafx.embed.swing.JFXPanel')
    FXMLLoader = Rjb::import('javafx.fxml.FXMLLoader')
    Image = Rjb::import('javafx.scene.image.Image')
    Scene = Rjb::import('javafx.scene.Scene')
    JFrame = Rjb::import('javax.swing.JFrame')

    def initialize(controller)
      super(controller)

      @url_fxml = 'file:'+File.dirname(__FILE__)+'/about_view.fxml'


      @frame = JFrame.new('À propos')
      @frame.set_size(600,400)
      @frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)

      @panel = JFXPanel.new

      puts 1
      url = URL.new(@url_fxml)
      p 1.1
      p FXMLLoader.load(url)
      puts 2
      scene = Scene.new(root)
      p 3
      @image = scene.lookup('#image')

      p 4
      @exit_button = scene.lookup('#exit_button')
      @exit_button.setOnAction do
        Thread.new do
          @controller.notify_action(self,:exit_button_clicked)
        end
      end

      @panel.scene = scene

      @frame.add(@panel)

    end

    def display
      @frame.visible = true
      @swing = Thread.new do
        sleep
      end
    end

    def close
      @frame.dispose
      @swing.wakeup
    end

  end
end

if $0 == __FILE__
  view = Competence::AboutView.new(nil)
  view.display
  Thread.list.each{|t| t.join if t!=Thread.current}
end
