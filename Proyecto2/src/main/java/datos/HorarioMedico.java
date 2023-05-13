package datos;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HorarioMedico {

private int ID;
private int IDMedico;
private String HoraInicio;
private String HoraFinal;

    public int getIDMedico() {
        return IDMedico;
    }

    public void setIDMedico(int IDMedico) {
        this.IDMedico = IDMedico;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getHoraInicio() {
        return HoraInicio;
    }

    public void setHoraInicio(String horaInicio) {
        HoraInicio = horaInicio;
    }

    public String getHoraFinal() {
        return HoraFinal;
    }

    public void setHoraFinal(String horaFinal) {
        HoraFinal = horaFinal;
    }
}
