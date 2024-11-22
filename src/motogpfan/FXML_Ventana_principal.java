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
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author josecarlos
 */
public class FXML_Ventana_principal implements Initializable {
    
    private static final File ARCHIVO_FRASES_MISTERIO = new File("src/main/frases_misterio.txt");
    private static final File ARCHIVO_FRASES_SERENIDAD = new File("src/main/frases_serenidad.txt");
    private static final File ARCHIVO_FRASES_VITALIDAD = new File("src/main/frases_vitalidad.txt");

    public static String fraseMisterioAleatoria = "";
    public static String fraseSerenidadAleatoria = "";
    public static String fraseVitalidadAleatoria = "";

    

    @FXML
    private Button Btn_Vitalidad;
    @FXML
    private Button Btn_Serenidad;
    @FXML
    private Button Btn_Misterio;
    @FXML
    private Button Btn_Salir;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    @FXML
    private void handleVitalidadBtnAction(ActionEvent event) throws IOException {
        fraseVitalidadAleatoria = obtenerFraseAleatoria(ARCHIVO_FRASES_VITALIDAD);
        Stage st2 = new Stage();
        Parent padre_2 = FXMLLoader.load(getClass().getResource("FXML_Ventana_Vitalidad.fxml"));

        Scene escena_2 = new Scene(padre_2);
        escena_2.getStylesheets().add("main/Estilo_vitalidad.css");

        st2.setScene(escena_2);
        st2.show();

        Stage st1 = (Stage) Btn_Misterio.getScene().getWindow();
        st1.close();
    }

    @FXML
    private void handleSerenidadBtnAction(ActionEvent event) throws IOException {
        fraseSerenidadAleatoria = obtenerFraseAleatoria(ARCHIVO_FRASES_SERENIDAD);
        Stage st2 = new Stage();
        Parent padre_2 = FXMLLoader.load(getClass().getResource("FXML_Ventana_Serenidad.fxml"));

        Scene escena_2 = new Scene(padre_2);
        escena_2.getStylesheets().add("main/Estilo_serenidad.css");

        st2.setScene(escena_2);
        st2.show();

        Stage st1 = (Stage) Btn_Misterio.getScene().getWindow();
        st1.close();
    }

    @FXML
    private void handleMisterioBtnAction(ActionEvent event) throws IOException {
        fraseMisterioAleatoria = obtenerFraseAleatoria(ARCHIVO_FRASES_MISTERIO);
        Stage st2 = new Stage();
        Parent padre_2 = FXMLLoader.load(getClass().getResource("FXML_Ventana_Misterio.fxml"));

        Scene escena_2 = new Scene(padre_2);
        escena_2.getStylesheets().add("main/Estilo_misterio.css");

        st2.setScene(escena_2);
        st2.show();

        Stage st1 = (Stage) Btn_Misterio.getScene().getWindow();
        st1.close();
    }

    @FXML
    private void handleSalirBtnAction(ActionEvent event) {
        System.exit(0);
    }
    
    
    private static String obtenerFraseAleatoria(File archivo){
        List<String> frases = new ArrayList<>();
        String fraseAleatoria = ""; 
        
        try(BufferedReader br = new BufferedReader(new FileReader(archivo))) {
            String linea;
            while((linea = br.readLine()) != null){
                frases.add(linea);
            }
            fraseAleatoria = frases.get((int) (Math.random()*9)+1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return fraseAleatoria;
    }
    
}
