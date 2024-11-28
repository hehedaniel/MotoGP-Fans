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

public class FXML_datos_equipo
{
    @FXML
    private ImageView ImgView_Piloto1;
    @FXML
    private ImageView ImgView_LogoEquipo;
    @FXML
    private ImageView ImgView_Piloto2;
    @FXML
    private AnchorPane paneDatosEquipo;
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private Label Lbl_descripcionEquipo;

    @FXML
    public void initialize() {
        int idEquipoMostrar = FXML_Ventana_equipos.idEquipoSeleccionado;

        Connection co;
        Statement stm;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/MotoGPFan", "root", "Pestillo1@");
            stm = co.createStatement();

            ResultSet rs = stm.executeQuery("SELECT * from Equipo WHERE idEquipo = " + idEquipoMostrar + ";");

            rs.next();

            Lbl_descripcionEquipo.setText(rs.getString("descripcion"));

            String nombre = rs.getString("nombre").toLowerCase();

            String ruta = "assets/Equipo/" + nombre.replace(" ", "_") + ".png";

            ImgView_LogoEquipo.setImage(new Image(ruta));

            rs.close();

            ImageView[] imageViews = {ImgView_Piloto1, ImgView_Piloto2};
            ResultSet rsPilotos = stm.executeQuery("SELECT * FROM Piloto WHERE idEquipo = " + idEquipoMostrar + ";");

            int cont = 0;

            while (rsPilotos.next()) {
                if(cont >= 2) break;

                imageViews[cont].setImage(new Image(rsPilotos.getString("foto")));

                cont++;
            }

            rsPilotos.close();

            stm.close();
            co.close();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @FXML
    public void handleBtnMenuPrincipal(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }
}