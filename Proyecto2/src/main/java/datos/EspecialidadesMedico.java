package datos;

import lombok.*;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class EspecialidadesMedico {


    private int IDMedico;
    private int IDEspecialidad;
    private String Nombre;
    private float Precio;

    public int getIDMedico() {
        return IDMedico;
    }

    public void setIDMedico(int IDMedico) {
        this.IDMedico = IDMedico;
    }

    public int getIDEspecialidad() {
        return IDEspecialidad;
    }

    public void setIDEspecialidad(int IDEspecialidad) {
        this.IDEspecialidad = IDEspecialidad;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float precio) {
        Precio = precio;
    }
}
