package motogpfan;

import javafx.event.ActionEvent;
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
    @javafx.fxml.FXML
    private ImageView ImgView_Bandera;
    @javafx.fxml.FXML
    private Button Btn_Volver;
    @javafx.fxml.FXML
    private Button Btn_MenuPrincipal;
    @javafx.fxml.FXML
    private Label Lbl_Peso;
    @javafx.fxml.FXML
    private Label Lbl_Equipo;
    @javafx.fxml.FXML
    private Label Lbl_Altura;
    @javafx.fxml.FXML
    private AnchorPane paneDatosPiloto;
    @javafx.fxml.FXML
    private Label Lbl_NombreCompleto;
    @javafx.fxml.FXML
    private Label Lbl_Numero;
    @javafx.fxml.FXML
    private ImageView ImgView_ImgPiloto;

    @javafx.fxml.FXML
    public void initialize() {

        //Pillo un teorico id del componente padre
        //        int idPilotoMostrar = FXML_Ventana_pilotos.idPilotoMostrar;

        //        Peticion a bbdd y recogemos los pulotos

        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/PruebaMotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT * from Piloto WHERE idPiloto = 93");

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

    @javafx.fxml.FXML
    public void handleMenuPrincipalBtnAction(ActionEvent actionEvent) {
        try{
//            Parent root;
//            Segun ernesto

//            root = FXMLLoader.load(getClass().getResource("Ventana_principal.fxml"));
//            Scene scene = new Scene(root);

//            Stage stage = new Stage();
//            stage.setScene(scene);
//            stage.show();
//
//            Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
//            stage2.close();

//            Probar

            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
            stage2.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @javafx.fxml.FXML
    public void handleVolverBtnAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_pilotos.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }
}