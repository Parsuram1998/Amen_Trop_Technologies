package in.sp.main.ServicesImpl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entities.College;
import in.sp.main.Enums.CollegeStatus;
import in.sp.main.Repositories.CollegeRepository;
import in.sp.main.Services.CollegeService;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeRepository collegeRepository;

    @Override
    public College registerCollege(College college) {

    	college.setStatus(CollegeStatus.PENDING);
        college.setRegisteredAt(LocalDateTime.now());

        return collegeRepository.save(college);
    }

    @Override
    public List<College> getAllColleges() {
        return collegeRepository.findAll();
    }

    @Override
    public College getCollegeById(Long id) {
        return collegeRepository.findById(id).orElse(null);
    }

    @Override
    public void approveCollege(Long id) {

        College college = getCollegeById(id);

        if (college != null) {

        	college.setStatus(CollegeStatus.APPROVED);
            college.setApprovedAt(LocalDateTime.now());
            college.setActive(true);

            collegeRepository.save(college);

        }

    }
    
    @Override
    public void rejectCollege(Long id) {

        College college = getCollegeById(id);

        if (college != null) {

        	college.setStatus(CollegeStatus.REJECTED);
            college.setActive(false);

            collegeRepository.save(college);

        }

    }
    

    @Override
    public boolean isTpoEmailExists(String email) {
        return collegeRepository.existsByTpoEmail(email);
    }

    @Override
    public List<College> getPendingColleges() {

        return collegeRepository.findByStatus(CollegeStatus.PENDING);

    }

    @Override
    public List<College> getApprovedColleges() {

    	return collegeRepository.findByStatus(CollegeStatus.APPROVED);

    }
    
    @Override
    public List<College> searchCollege(String keyword) {

        return collegeRepository
                .findByCollegeNameContainingIgnoreCase(keyword);

    }
    
    @Override
    public void updateRemarks(Long id, String remarks) {

        College college = getCollegeById(id);

        if (college != null) {

            college.setRemarks(remarks);

            collegeRepository.save(college);

        }

    }
    
    @Override
    public List<College> getRejectedColleges() {

        return collegeRepository.findByStatus(
                CollegeStatus.REJECTED);

    }
}