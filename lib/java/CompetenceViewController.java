import com.google.gson.Gson;
import java.util.Hashtable;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class CompetenceViewController{

  @FXML
  private TextField field;

  @FXML
  private Button browseButton;

  @FXML
  private Button analyseButton;

  @FXML
  private Button aboutButton;

  @FXML
  private Button exitButton;

  @FXML
  private void browseButtonClicked(){
    Hashtable<String,String> hash = new Hashtable<String,String>();
    hash.put("action","browse_button_clicked");
    System.out.println(new Gson().toJson(hash));
  }

  @FXML
  private void analyzeButtonClicked(){
    Hashtable<String,String> hash = new Hashtable<String,String>();
    hash.put("action","analyze_button_clicked");
    System.out.println(new Gson().toJson(hash));
  }

  @FXML
  private void aboutButtonClicked(){
    Hashtable<String,String> hash = new Hashtable<String,String>();
    hash.put("action","about_button_clicked");
    System.out.println(new Gson().toJson(hash));
  }

  @FXML
  private void exitButtonClicked(){
    Hashtable<String,Object> hash = new Hashtable<String,Object>();
    hash.put("action","exit_button_clicked");
    System.out.println(new Gson().toJson(hash));
  }
}
