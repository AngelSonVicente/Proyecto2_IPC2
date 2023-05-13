package datos;

import java.sql.SQLException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class HorariosDisponibles {

    public static ArrayList<String> buscarHorariosDisponibles(String IDMedico, String fecha) {
        // Obtener horario del medico
        ArrayList<HorarioMedico> horariosMedico = Listar.HorarioMedico(IDMedico);

        // Obtener consultas agendadas para ese día
        ArrayList<Consultas> consultas = Listar.ConsultasMF(fecha, IDMedico);

        // Crear lista de horarios disponibles
        ArrayList<String> horariosDisponibles = new ArrayList<>();

        // Recorrer horario del medico y comprobar disponibilidad
        for (HorarioMedico horario : horariosMedico) {
            LocalTime horaInicio = LocalTime.parse(horario.getHoraInicio());
            LocalTime horaFin = LocalTime.parse(horario.getHoraFinal());
            LocalTime horaActual = horaInicio;

            // Recorrer horas dentro del horario del medico
            while (horaActual.isBefore(horaFin.plusSeconds(1))) {
                boolean disponible = true;

                // Comprobar si la hora está dentro de alguna consulta agendada
                for (Consultas consulta : consultas) {
                    LocalTime horaConsulta = LocalTime.parse(consulta.getFechaAgendada().substring(11));

                    if (horaActual.equals(horaConsulta)) {
                        disponible = false;
                        break;
                    }
                }

                // Si la hora no está en ninguna consulta, se agrega a la lista de horarios disponibles
                if (disponible) {
                    horariosDisponibles.add(horaActual.format(DateTimeFormatter.ofPattern("HH:mm")));
                }

                // Avanzar una hora
                horaActual = horaActual.plusHours(1);
            }
        }

        return horariosDisponibles;
    }
}
