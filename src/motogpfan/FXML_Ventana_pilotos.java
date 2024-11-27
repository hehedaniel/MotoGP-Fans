package motogpfan;

import javafx.event.ActionEvent;
import javafx.event.Event;
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
import java.util.ArrayList;
import java.util.List;


public class FXML_Ventana_pilotos
{

    private List<Integer> idPilotos = new ArrayList<>();

    public static int idPilotoSeleccionado = -1;

    @FXML
    private ImageView ImgView_Piloto12;
    @FXML
    private ImageView ImgView_Piloto11;
    @FXML
    private ImageView ImgView_Piloto22;
    @FXML
    private ImageView ImgView_Piloto10;
    @FXML
    private ImageView ImgView_Piloto21;
    @FXML
    private ImageView ImgView_Piloto20;
    @FXML
    private AnchorPane panePilotos;
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private ImageView ImgView_Piloto1;
    @FXML
    private ImageView ImgView_Piloto3;
    @FXML
    private ImageView ImgView_Piloto2;
    @FXML
    private ImageView ImgView_Piloto5;
    @FXML
    private ImageView ImgView_Piloto4;
    @FXML
    private ImageView ImgView_Piloto7;
    @FXML
    private ImageView ImgView_Piloto19;
    @FXML
    private ImageView ImgView_Piloto6;
    @FXML
    private ImageView ImgView_Piloto9;
    @FXML
    private ImageView ImgView_Piloto18;
    @FXML
    private ImageView ImgView_Piloto8;
    @FXML
    private ImageView ImgView_Piloto17;
    @FXML
    private ImageView ImgView_Piloto16;
    @FXML
    private ImageView ImgView_Piloto15;
    @FXML
    private ImageView ImgView_Piloto14;
    @FXML
    private ImageView ImgView_Piloto13;

    @FXML
    public void initialize() {
        ImageView[] arrayImgViewPilotos = {ImgView_Piloto1, ImgView_Piloto2, ImgView_Piloto3, ImgView_Piloto4, ImgView_Piloto5, ImgView_Piloto6, ImgView_Piloto7, ImgView_Piloto8, ImgView_Piloto9, ImgView_Piloto10, ImgView_Piloto11, ImgView_Piloto12, ImgView_Piloto13, ImgView_Piloto14, ImgView_Piloto15, ImgView_Piloto16, ImgView_Piloto17, ImgView_Piloto18, ImgView_Piloto19, ImgView_Piloto20, ImgView_Piloto21, ImgView_Piloto22};


        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/PruebaMotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT * from Piloto");
            int n = 0;

            while (rs.next()){
                idPilotos.add(rs.getInt("idPiloto"));
                arrayImgViewPilotos[n].setImage(new Image(rs.getString("foto")));
                n++;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    public void handleMenuPrincipalBtnAction(ActionEvent actionEvent) throws  IOException{
            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
            stage2.close();

    }

    @FXML
    public void handleImgViewClickedAction(Event event) throws IOException {
        String id = ((ImageView) event.getSource()).getId().split("ImgView_Piloto")[1];

        idPilotoSeleccionado = idPilotos.get(Integer.parseInt(id)-1);

        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_datos_piloto.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }
}