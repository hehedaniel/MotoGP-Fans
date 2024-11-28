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

public class FXML_Ventana_equipos
{

    public static int idEquipoSeleccionado = -1;

    @FXML
    private ImageView ImgView_Equipo5;
    @FXML
    private ImageView ImgView_Equipo4;
    @FXML
    private ImageView ImgView_Equipo3;
    @FXML
    private ImageView ImgView_Equipo2;
    @FXML
    private ImageView ImgView_Equipo1;
    @FXML
    private AnchorPane paneEquipos;
    @FXML
    private ImageView ImgView_Equipo9;
    @FXML
    private ImageView ImgView_Equipo10;
    @FXML
    private ImageView ImgView_Equipo8;
    @FXML
    private ImageView ImgView_Equipo7;
    @FXML
    private ImageView ImgView_Equipo6;
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private ImageView ImgView_Equipo11;

    @FXML
    public void initialize() throws ClassNotFoundException, SQLException{
        ImageView[] arrayImgViewEquipos = {ImgView_Equipo1, ImgView_Equipo2, ImgView_Equipo3, ImgView_Equipo4, ImgView_Equipo5, ImgView_Equipo6, ImgView_Equipo7, ImgView_Equipo8, ImgView_Equipo9,ImgView_Equipo10, ImgView_Equipo11};

        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/MotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT nombre from Equipo");
            int n = 0;

            while (rs.next()){
                String nombre = rs.getString("nombre").toLowerCase();

                String ruta = "assets/Equipo/" + nombre.replace(" ", "_") + ".png";

                arrayImgViewEquipos[n].setImage(new Image(ruta));
                n++;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    public void handleBtnMenuPrincipalAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }

    @FXML
    public void handleImgViewClickedAction(Event event) throws IOException {
        String id = ((ImageView) event.getSource()).getId().split("ImgView_Equipo")[1];

        idEquipoSeleccionado = Integer.parseInt(id);

        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_datos_equipo.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }
}