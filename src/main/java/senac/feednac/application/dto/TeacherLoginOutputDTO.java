package senac.feednac.application.dto;

import java.util.List;

public record TeacherLoginOutputDTO(
            Long id,
            String name,
            String email,
            String telephone,
            List<String> subjects
) {}
