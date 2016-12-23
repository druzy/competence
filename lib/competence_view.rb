# encoding: utf-8

require 'druzy/mvc'
require 'java'

module Competence

  class CompetenceView < Druzy::MVC::View
    
    java_import java.awt.event.ActionListener
    java_import java.awt.event.WindowAdapter
    java_import java.awt.GridBagConstraints
    java_import java.awt.GridBagLayout
    java_import javax.swing.JButton
    java_import javax.swing.JFrame
    java_import javax.swing.JTextField
    java_import javax.swing.SwingUtilities
    java_import javax.swing.UIManager
    
    CENTER = GridBagConstraints.const_get(:CENTER)
    LAST_LINE_END = GridBagConstraints.const_get(:LAST_LINE_END)
    HORIZONTAL = GridBagConstraints.const_get(:HORIZONTAL)
    PAGE_START = GridBagConstraints.const_get(:PAGE_START)
    REMAINDER = GridBagConstraints.const_get(:REMAINDER)
    
    INSETS = java.awt.Insets.new(5,5,5,5)
    
    def initialize(controller)
      super(controller)
      SwingUtilities.invoke_and_wait do
        
	UIManager.set_look_and_feel(UIManager.get_system_look_and_feel_class_name)

	@grid = GridBagLayout.new

	@main_frame = JFrame.new
	@main_frame.set_title('Compétence')
	@main_frame.set_layout(@grid)
	@main_frame.add_window_listener(Class.new(WindowAdapter) do
	  
	  def initialize(controller)
	    super()
	    @controller = controller
	  end
	  
	  def windowClosing(event)
	    Thread.new do
	      @controller.notify_action(self,:cross_clicked)
	    end
	  end
	end.new(@controller))
       
	@field = JTextField.new(30)

	@browse_button = JButton.new('parcourir')
	@browse_button.add_action_listener(Class.new do
	  def initialize(controller)
	    @controller = controller
          end
	  
	  def actionPerformed(event)
            Thread.new do
	      @controller.notify_action(self,:browse_button_clicked)
	    end
	  end
	end.new)

	@exit_button = JButton.new('fermer')
	@exit_button.add_action_listener(Class.new do
	   def initialize(controller)
	    @controller = controller
          end

          def actionPerformed(event)
	    Thread.new do
	      @controller.notify_action(self,:exit_button_clicked)
	    end
	  end
	end.new)

	@about_button = JButton.new('à propos')
	@about_button.add_action_listener(Class.new do
	  def initialize(controller)
	    @controller = controller
          end

	  def actionPerformed(event)
	    Thread.new do
	      @controller.notfy_action(self,:about_button_clicked)
	    end
	  end
	end.new)
	
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
      SwingUtilities.invoke_later do
        @main_frame.set_visible(true)
      end
    end

    def close
      SwingUtilities.invoke_later do
	@main_frame.dispose
      end
    end
  end
  
end
