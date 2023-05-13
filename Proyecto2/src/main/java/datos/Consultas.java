package datos;
import lombok.*;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Consultas {


    private int ID;
    private  int  IdPaciente;
    private int IdMedico;
    private int IdEspecialidad;
    private float porcentaje;
    private String FechaCreacion;
    private String FechaAgendada;
    private float precio;
    private String informe;
    private String estado;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIdPaciente() {
        return IdPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        IdPaciente = idPaciente;
    }

    public int getIdMedico() {
        return IdMedico;
    }

    public void setIdMedico(int idMedico) {
        IdMedico = idMedico;
    }

    public int getIdEspecialidad() {
        return IdEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        IdEspecialidad = idEspecialidad;
    }

    public float getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(float porcentaje) {
        this.porcentaje = porcentaje;
    }

    public String getFechaCreacion() {
        return FechaCreacion;
    }

    public void setFechaCreacion(String fechaCreacion) {
        FechaCreacion = fechaCreacion;
    }

    public String getFechaAgendada() {
        return FechaAgendada;
    }

    public void setFechaAgendada(String fechaAgendada) {
        FechaAgendada = fechaAgendada;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getInforme() {
        return informe;
    }

    public void setInforme(String informe) {
        this.informe = informe;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
