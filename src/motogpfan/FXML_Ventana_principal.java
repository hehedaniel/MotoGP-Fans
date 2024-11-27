/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/javafx/FXMLController.java to edit this template
 */
package motogpfan;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author josecarlos
 */
public class FXML_Ventana_principal implements Initializable {
    @FXML
    private Button Btn_Salir;
    @FXML
    private Button Btn_Pilotos;
    @FXML
    private Button Btn_Patrocinadores;
    @FXML
    private Button Btn_Equipos;
    @FXML
    private AnchorPane panePrincipal;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    @FXML
    private void handleSalirBtnAction(ActionEvent event) {
        System.exit(0);
    }


    @FXML
    public void handleEquiposBtnAction(ActionEvent actionEvent) {
        try{

            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_equipos.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_Equipos.getScene().getWindow();
            stage2.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void handlePilotosBtnAction(ActionEvent actionEvent) {
        try{

            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_pilotos.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_Pilotos.getScene().getWindow();
            stage2.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    public void handlePatrocinadoresBtnAction(ActionEvent actionEvent) {
        try{

            Stage stage = new Stage();
            stage.setScene(new Scene(FXMLLoader.load(getClass().getResource("FXML_Ventana_patrocinadores.fxml"))));
            stage.show();

            Stage stage2 = (Stage) Btn_Patrocinadores.getScene().getWindow();
            stage2.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
