package motogpfan;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class FXML_Datos_piloto
{
    @FXML
    private ImageView ImgView_Bandera;
    @FXML
    private Button Btn_Volver;
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private Label Lbl_Peso;
    @FXML
    private Label Lbl_Equipo;
    @FXML
    private Label Lbl_Altura;
    @FXML
    private AnchorPane paneDatosPiloto;
    @FXML
    private Label Lbl_NombreCompleto;
    @FXML
    private Label Lbl_Numero;
    @FXML
    private ImageView ImgView_ImgPiloto;

    @FXML
    public void initialize() {

        int idPilotoMostrar = FXML_Ventana_pilotos.idPilotoSeleccionado;

        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/MotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT * from Piloto WHERE idPiloto = " + idPilotoMostrar + ";");

            rs.next();

            Lbl_Peso.setText(rs.getString("peso")+ " kg");
            Lbl_Equipo.setText(rs.getString("idEquipo"));
            Lbl_Altura.setText(rs.getString("altura")+ " cm");
            Lbl_NombreCompleto.setText(rs.getString("nombre") + " " + rs.getString("apellido"));
            Lbl_Numero.setText(rs.getString("idPiloto"));
            ImgView_ImgPiloto.setImage(new Image(rs.getString("foto")));
            ImgView_Bandera.setImage(new Image(rs.getString("pais")));
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    public void handleMenuPrincipalBtnAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }

    @FXML
    public void handleVolverBtnAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_pilotos.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }
}