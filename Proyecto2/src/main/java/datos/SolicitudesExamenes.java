package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SolicitudesExamenes {

    private int ID;
    private int IDPaciente;
    private int IDLaboratorio;
    private float porcentaje;
    private String FechaSolicitud;
    private String FechaFinalizado;
    private float Precio;
    private String Estado;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDPaciente() {
        return IDPaciente;
    }

    public void setIDPaciente(int IDPaciente) {
        this.IDPaciente = IDPaciente;
    }

    public int getIDLaboratorio() {
        return IDLaboratorio;
    }

    public void setIDLaboratorio(int IDLaboratorio) {
        this.IDLaboratorio = IDLaboratorio;
    }

    public float getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(float porcentaje) {
        this.porcentaje = porcentaje;
    }

    public String getFechaSolicitud() {
        return FechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        FechaSolicitud = fechaSolicitud;
    }

    public String getFechaFinalizado() {
        return FechaFinalizado;
    }

    public void setFechaFinalizado(String fechaFinalizado) {
        FechaFinalizado = fechaFinalizado;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float precio) {
        Precio = precio;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }
}
