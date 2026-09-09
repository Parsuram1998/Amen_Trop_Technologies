package in.sp.main.Services;

import java.util.List;

import in.sp.main.Entities.College;

public interface CollegeService {

    College registerCollege(College college);

    List<College> getAllColleges();

    College getCollegeById(Long id);

    void approveCollege(Long id);

    void rejectCollege(Long id);

    boolean isTpoEmailExists(String email);

    List<College> getPendingColleges();

    List<College> getApprovedColleges();

    List<College> searchCollege(String keyword);
    
    void updateRemarks(Long id, String remarks);

    

    List<College> getRejectedColleges();
}