package senac.feednac.infraestructure.repository;

import org.springframework.stereotype.Service;
import senac.feednac.domain.Teacher;
import senac.feednac.infraestructure.converter.TeacherConverter;

@Service
public class TeacherRepository {

    private TeacherJPARepository jpaRepository;

    public TeacherRepository(TeacherJPARepository jpaRepository) {
        this.jpaRepository = jpaRepository;
    }

    public Teacher findIdByUsernameAndPassword(String username, String password) {
        var teacherEntity = this.jpaRepository.findIdByUsernameAndPassword(username, password);

        if (teacherEntity.isPresent()) {
            return teacherEntity.map(TeacherConverter::toTeacher).get();
        }

        return null;
    }
}
