package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ListaExamenes {
    private int IDSolicitud;
    private int IDExamen;
    private  String Nombre;
    private float Precio;
    private  String Estado;
    private byte[] Archivo;

    public byte[] getArchivo() {
        return Archivo;
    }

    public void setArchivo(byte[] archivo) {
        Archivo = archivo;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String estado) {
        Estado = estado;
    }

    public int getIDSolicitud() {
        return IDSolicitud;
    }

    public void setIDSolicitud(int IDSolicitud) {
        this.IDSolicitud = IDSolicitud;
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
