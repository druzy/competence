require 'druzy/mvc'
require 'java'
require '/usr/share/java/swingx.jar'

module Competence
  class AnalyzeView < Druzy::MVC::View
    
    java_import java.awt.event.WindowAdapter
    java_import java.awt.GridBagConstraints
    java_import java.awt.GridBagLayout
    java_import javax.swing.JButton
    java_import javax.swing.JFrame
    java_import javax.swing.SwingUtilities
    java_import org.jdesktop.swingx.JXTreeTable

    def initialize(controller)
      super(controller)

      SwingUtilities.invoke_and_wait do
        
	@analyze_frame = JFrame.new
	@analyze_frame.layout = GridBagLayout.new
	@analyze_frame.add_window_listener(Class.new(WindowAdapter) do
	  def initialize(view)
	    super()
	    @view = view
	  end
          
	  def windowClosing(event)
	    Thread.new do
	      @view.controller.notify_action(@view,:cross_clicked)
	    end
	  end
	end.new(self))

        @tree_table = JXTreeTable.new

	@exit_button = JButton.new('Fermer')

        c = GridBagConstraints.new
	c.gridx = 0
	c.gridy = 0
	@analyze_frame.add(@tree_table,c)

	c = GridBagConstraints.new
	c.gridx = 0
	c.gridy = 1
	@analyze_frame.add(@exit_button,c)

	@analyze_frame.pack
      end
    end

    def display
      @analyze_frame.visible = true
    end

    def close
      @analyze_frame.dispose
    end
  end
end
