package motogpfan;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class FXML_datos_patrocinador
{
    @FXML
    private Label Lbl_Descripcion;
    @FXML
    private Button Btn_Volver;
    @FXML
    private Button Btn_MenuPrincipal;
    @FXML
    private ListView<String> LV_Pilotos;
    @FXML
    private ImageView ImgView_logoPatrocinador;
    @FXML
    private Label Lbl_Descripcion1;

    @FXML
    public void initialize() throws SQLException, ClassNotFoundException {
        cargarLista();
    }

    @FXML
    public void handleBtnVolverAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_patrocinadores.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }

    @FXML
    public void handleBtnMenuPrincipalAction(ActionEvent actionEvent) throws IOException {
        Stage stage = new Stage();
        stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_principal.fxml"))));
        stage.show();

        Stage stage2 = (Stage) Btn_MenuPrincipal.getScene().getWindow();
        stage2.close();
    }

    private void cargarLista() throws ClassNotFoundException, SQLException {
        Connection co;
        Statement stm;

        Class.forName("com.mysql.cj.jdbc.Driver");

        co = DriverManager.getConnection("jdbc:mysql://localhost:3306/PruebaMotoGPFan", "root", "Pestillo1@");
        stm = co.createStatement();

        // TODO: poner lo del id en el idPatrocinador y poner los datos del patrocinador (desc y img)
        ResultSet rs = stm.executeQuery("SELECT * from Piloto P JOIN Piloto_has_Patrocinador PHP ON P.idPiloto = PHP.idPiloto WHERE PHP.idPatrocinador = 2");

        ObservableList<String> items = FXCollections.observableArrayList();
        while (rs.next()) {
            items.add(rs.getString("nombre") + " " + rs.getString("apellido"));
        }

        LV_Pilotos.setItems(items);
    }
}