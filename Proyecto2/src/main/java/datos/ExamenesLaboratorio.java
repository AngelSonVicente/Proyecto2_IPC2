package datos;
import lombok.*;
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ExamenesLaboratorio {
    private int IDLaboratorio;
    private int IDExamen;
    private String Nombre;
    private float Precio;

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
        return Precio;
    }

    public void setPrecio(float precio) {
        Precio = precio;
    }
}
