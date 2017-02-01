import com.google.gson.Gson;
import java.util.Hashtable;
import java.util.Scanner;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.layout.VBox;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class CompetenceView extends Application{

  private Stage stage;

  @Override
  public void init(){
    new Thread(){
      public void run(){
        Scanner scanner = new Scanner(System.in);
        Hashtable<String,Object> hash=new Gson().fromJson(scanner.nextLine(),Hashtable.class);
        while (!hash.get("action").equals("exit")){
          if (hash.get("action").equals("display")){
            Platform.runLater(() -> CompetenceView.this.stage.show());
          }

          hash=new Gson().fromJson(scanner.nextLine(),Hashtable.class);
        }

        Platform.runLater(() -> CompetenceView.this.stage.close());
      }
    }.start();

  }

  @Override
  public void start(Stage stage){
    this.stage = stage;
    this.stage.setTitle("Compétence");
    try{
      VBox root = (VBox)FXMLLoader.load(getClass().getResource("competence_view.fxml"));
      Scene scene = new Scene(root);
      this.stage.setScene(scene);

    }catch(Exception e){
      e.printStackTrace();
    }
  }

  @Override
  public void stop(){
    Hashtable<String,String> hash = new Hashtable<String,String>();
    hash.put("action","exit");
    System.out.println(new Gson().toJson(hash));
  }

  public static void main(String[] args){

    launch(args);
  }
}
