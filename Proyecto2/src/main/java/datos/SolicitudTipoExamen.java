package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SolicitudTipoExamen {
    private int ID;
    private int IDLaboratorio;
    private int IDExamen;
    private String Nombre;
    private float precio;
    private String Estado;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getIDLaboratorio() {
        return IDLaboratorio;
    }

    public void setIDLaboratorio(int IDLaboratorio) {
        this.IDLaboratorio = IDLaboratorio;
    }

    public int getIDExamen() {
        return IDExamen;
    }

    public void setIDExamen(int IDExamen) {
        this.IDExamen = IDExamen;
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

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }
}
