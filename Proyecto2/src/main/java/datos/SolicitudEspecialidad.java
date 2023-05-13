package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class SolicitudEspecialidad {
    private int ID;
    private int ID_medico;
    private int ID_especialidad;
    private float precio;
    private String estado;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID_medico() {
        return ID_medico;
    }

    public void setID_medico(int ID_medico) {
        this.ID_medico = ID_medico;
    }

    public int getID_especialidad() {
        return ID_especialidad;
    }

    public void setID_especialidad(int ID_especialidad) {
        this.ID_especialidad = ID_especialidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
