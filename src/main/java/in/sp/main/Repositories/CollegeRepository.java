package in.sp.main.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.Entities.College;
import in.sp.main.Enums.CollegeStatus;

@Repository
public interface CollegeRepository extends JpaRepository<College, Long> {

    boolean existsByTpoEmail(String tpoEmail);

    List<College> findByStatus(CollegeStatus rejected);

    List<College> findByCollegeNameContainingIgnoreCase(String collegeName);
    
   

}