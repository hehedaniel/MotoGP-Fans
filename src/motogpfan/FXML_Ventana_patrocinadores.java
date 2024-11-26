package motogpfan;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class FXML_Ventana_patrocinadores
{
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private AnchorPane anchorPane;
    @FXML
    private ImageView ImgView_Patrocinador1;
    @FXML
    private ImageView ImgView_Patrocinador4;
    @FXML
    private ImageView ImgView_Patrocinador3;
    @FXML
    private ImageView ImgView_Patrocinador2;
    @FXML
    private ImageView ImgView_Patrocinador8;
    @FXML
    private ImageView ImgView_Patrocinador7;
    @FXML
    private ImageView ImgView_Patrocinador6;
    @FXML
    private ImageView ImgView_Patrocinador5;
    @FXML
    private ImageView ImgView_Patrocinador10;
    @FXML
    private ImageView ImgView_Patrocinador9;

    @FXML
    public void initialize() {

        ImageView[] arrayImgViewPatrocinadores = {ImgView_Patrocinador1, ImgView_Patrocinador2, ImgView_Patrocinador3, ImgView_Patrocinador4, ImgView_Patrocinador5, ImgView_Patrocinador6, ImgView_Patrocinador7, ImgView_Patrocinador8, ImgView_Patrocinador9,ImgView_Patrocinador10};

        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/PruebaMotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT * from Patrocinador");
            int n = 0;

            while (rs.next()){
                arrayImgViewPatrocinadores[n].setImage(new Image("https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Ducati_red_logo.svg/1931px-Ducati_red_logo.svg.png"));
                n++;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    public void handleMenuPrincipalBtnAction(ActionEvent actionEvent) {
        try{

            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
            stage2.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}