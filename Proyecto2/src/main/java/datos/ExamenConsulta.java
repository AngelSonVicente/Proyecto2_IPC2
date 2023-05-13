package datos;
import lombok.*;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ExamenConsulta {

    private int IdConsulta;
    private int IdExamen;
    private String Nombre;
    private float precio;
    private byte[] archivo;
    private String Estado;

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }

    public int getIdConsulta() {
        return IdConsulta;
    }

    public void setIdConsulta(int idConsulta) {
        IdConsulta = idConsulta;
    }

    public int getIdExamen() {
        return IdExamen;
    }

    public void setIdExamen(int idExamen) {
        IdExamen = idExamen;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public byte[] getArchivo() {
        return archivo;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }
}
