# encoding: utf-8

require 'druzy/mvc'
require 'java'

module Competence
  class CompetenceView < Druzy::MVC::View
    
    java_import java.awt.GridBagConstraints
    CENTER = GridBagConstraints.const_get(:CENTER)
    LAST_LINE_END = GridBagConstraints.const_get(:LAST_LINE_END)
    HORIZONTAL = GridBagConstraints.const_get(:HORIZONTAL)
    PAGE_START = GridBagConstraints.const_get(:PAGE_START)
    REMAINDER = GridBagConstraints.const_get(:REMAINDER)
    
    INSETS = java.awt.Insets.new(5,5,5,5)
    def initialize(controller)
      super(controller)
      

      javax.swing.SwingUtilities.invoke_and_wait do
        
	javax.swing.UIManager.set_look_and_feel(javax.swing.UIManager.get_system_look_and_feel_class_name)

	@grid = java.awt.GridBagLayout.new

	@main_frame = javax.swing.JFrame.new
	@main_frame.set_title('Compétence')
	@main_frame.set_layout(@grid)
	@main_frame.add_window_listener(Class.new(java.awt.event.WindowAdapter){
	  def windowClosed(event)
	    puts event
	  end
	})
       
	@field = javax.swing.JTextField.new(30)

	@browse_button = javax.swing.JButton.new('parcourir')

	@exit_button = javax.swing.JButton.new('fermer')

	@about_button = javax.swing.JButton.new('à propos')
	
	c = GridBagConstraints.new
        c.gridx = 0
	c.gridy = 0
	c.fill = HORIZONTAL
	c.insets = INSETS
	c.anchor = PAGE_START
	c.weightx = 1.0
	c.weighty = 0.0
	@main_frame.add(@field,c)

        c = GridBagConstraints.new
	c.gridx = 1
	c.gridy = 0
	c.insets = INSETS
	c.weightx = 0.0
	c.weighty = 0.0
	@main_frame.add(@browse_button,c)

        c = GridBagConstraints.new
	c.gridx = 0
	c.gridy = 1
	c.anchor = LAST_LINE_END
	c.insets = INSETS
	c.weightx = 1.0
	c.weighty = 1.0
        @main_frame.add(@about_button,c)

	c = GridBagConstraints.new
	c.gridx = 1
	c.gridy = 1
	c.anchor = LAST_LINE_END
	c.insets = INSETS
	c.weightx = 0.0
	c.weighty = 1.0
	@main_frame.add(@exit_button,c)

	@main_frame.pack
 
      end
      
    end

    def display
      javax.swing.SwingUtilities.invoke_later do
        @main_frame.set_visible(true)
      end
    end
  end
end
