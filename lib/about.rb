require 'druzy/mvc'

require_relative 'about_model'

module Competence
 
  class About < Druzy::MVC::Controller
    def initialize(kwargs={})
      if kwargs[:model] == nil
        initialize(:model => AboutModel.new)
      else
        super(kwargs[:model])
      end
    end

    def notify_action(view, action, kwargs={})
      if action == :cross_clicked
        view.close
      elsif action == :exit_button_clicked
        view.close
      end
    end
  end
end
