# c61028de7d2a8fa77255182651175990755be1c1 encoding: utf-8
# @@ 1

########################### DO NOT MODIFY THIS FILE ###########################
#       This file was automatically generated by JRubyFX-fxmlloader on        #
# 2017-01-02 16:04:11 +0100 for /media/druzy/dock/programmation/ruby/competence/competence/lib/competence_view.fxml
########################### DO NOT MODIFY THIS FILE ###########################

module JRubyFX
  module GeneratedAssets
    class AOT799c6ba9b0337a7d628155eb76edc2e81fc142ab
      include JRubyFX
          def __build_via_jit(__local_fxml_controller, __local_namespace, __local_jruby_ext)
      __local_fx_id_setter = lambda do |name, __i|
        __local_namespace[name] = __i
        __local_fxml_controller.instance_variable_set(("@#{name}").to_sym, __i)
      end

build(Java::JavafxSceneLayout::VBox) do
 __local_jruby_ext[:on_root_set].call(self) if __local_jruby_ext[:on_root_set]
 getChildren.add(build(Java::JavafxSceneLayout::HBox) do
  getChildren.add(build(Java::JavafxSceneLayout::AnchorPane) do
   getChildren.add(build(Java::JavafxSceneControl::TextField) do
    setId("field")
    __local_fx_id_setter.call("field", self)
    setLayoutX(19.0)
    setLayoutY(36.0)
    Java::JavafxSceneLayout::AnchorPane.setLeftAnchor(self, 14.0)
    Java::JavafxSceneLayout::AnchorPane.setRightAnchor(self, 14.0)
    Java::JavafxSceneLayout::AnchorPane.setTopAnchor(self, 14.0)
   end)
   setPrefHeight(200.0)
   setPrefWidth(200.0)
   Java::JavafxSceneLayout::HBox.setHgrow(self, Java::javafx::scene::layout::Priority::ALWAYS)
  end)
  getChildren.add(build(Java::JavafxSceneLayout::AnchorPane) do
   getChildren.add(build(Java::JavafxSceneControl::Button) do
    setId("browse_button")
    __local_fx_id_setter.call("browse_button", self)
    setLayoutX(309.0)
    setLayoutY(145.0)
    setMnemonicParsing(false)
    setText("Parcourir")
    setOnAction(EventHandlerWrapper.new(__local_fxml_controller, "browse_button_clicked"))
    Java::JavafxSceneLayout::AnchorPane.setRightAnchor(self, 14.0)
    Java::JavafxSceneLayout::AnchorPane.setTopAnchor(self, 14.0)
   end)
   Java::JavafxSceneLayout::HBox.setHgrow(self, Java::javafx::scene::layout::Priority::NEVER)
  end)
  setPrefHeight(100.0)
  setPrefWidth(200.0)
  Java::JavafxSceneLayout::VBox.setVgrow(self, Java::javafx::scene::layout::Priority::ALWAYS)
 end)
 getChildren.add(build(Java::JavafxSceneLayout::AnchorPane) do
  getChildren.add(build(Java::JavafxSceneControl::Button) do
   setId("analyze_button")
   __local_fx_id_setter.call("analyze_button", self)
   setLayoutX(524.0)
   setLayoutY(11.0)
   setMnemonicParsing(false)
   setText("Analyser")
   setOnAction(EventHandlerWrapper.new(__local_fxml_controller, "analyze_button_clicked"))
   Java::JavafxSceneLayout::AnchorPane.setBottomAnchor(self, 0.0)
   Java::JavafxSceneLayout::AnchorPane.setRightAnchor(self, 14.0)
   Java::JavafxSceneLayout::AnchorPane.setTopAnchor(self, 14.0)
  end)
  setPrefHeight(45.0)
  setPrefWidth(600.0)
  Java::JavafxSceneLayout::VBox.setVgrow(self, Java::javafx::scene::layout::Priority::NEVER)
 end)
 getChildren.add(build(Java::JavafxSceneLayout::HBox) do
  getChildren.add(build(Java::JavafxSceneLayout::AnchorPane) do
   getChildren.add(build(Java::JavafxSceneControl::Button) do
    setId("about_button")
    __local_fx_id_setter.call("about_button", self)
    setLayoutX(448.0)
    setLayoutY(14.0)
    setMnemonicParsing(false)
    setText("À propos")
    setOnAction(EventHandlerWrapper.new(__local_fxml_controller, "about_button_clicked"))
    Java::JavafxSceneLayout::AnchorPane.setRightAnchor(self, 14.0)
   end)
   setPrefHeight(57.0)
   setPrefWidth(538.0)
   Java::JavafxSceneLayout::HBox.setHgrow(self, Java::javafx::scene::layout::Priority::ALWAYS)
  end)
  getChildren.add(build(Java::JavafxSceneLayout::AnchorPane) do
   getChildren.add(build(Java::JavafxSceneControl::Button) do
    setId("exit_button")
    __local_fx_id_setter.call("exit_button", self)
    setLayoutX(-1.0)
    setLayoutY(34.0)
    setMnemonicParsing(false)
    setText("Fermer")
    setOnAction(EventHandlerWrapper.new(__local_fxml_controller, "exit_button_clicked"))
    Java::JavafxSceneLayout::AnchorPane.setBottomAnchor(self, 14.0)
    Java::JavafxSceneLayout::AnchorPane.setRightAnchor(self, 14.0)
    Java::JavafxSceneLayout::AnchorPane.setTopAnchor(self, 14.0)
   end)
   Java::JavafxSceneLayout::HBox.setHgrow(self, Java::javafx::scene::layout::Priority::NEVER)
  end)
  setPrefHeight(54.0)
  setPrefWidth(600.0)
  Java::JavafxSceneLayout::VBox.setVgrow(self, Java::javafx::scene::layout::Priority::NEVER)
 end)
 setMaxHeight(-Infinity)
 setMaxWidth(-Infinity)
 setMinHeight(-Infinity)
 setMinWidth(-Infinity)
 setPrefHeight(135.0)
 setPrefWidth(600.0)
end
    end

      def hash
        "c61028de7d2a8fa77255182651175990755be1c1"
      end
      def compiled?
        true
      end
    end
  end
end