package senac.feednac.application.dto.output;

public record CourseSessionOutputDTO(
    Long id,
    String duration,
    String startTime,
    String endTime,
    Long classRoom,
    Long flat,
    String teacherName,
    String subjectName,
    String className
) {}
