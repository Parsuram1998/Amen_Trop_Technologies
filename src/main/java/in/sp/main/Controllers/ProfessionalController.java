package in.sp.main.Controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.Message;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.MessageRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.ServicesImpl.FileUploadServices;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/professional")
public class ProfessionalController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    
    @Autowired
    private FileUploadServices fileUploadServices;
    
    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private JobApplicationRepository applicationRepository;
    
    @Autowired
    private MessageRepository messageRepo;

    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/login";
        }

        User user = userRepository.findById(userId).orElseThrow();
       
        long totalJobs = jobRepository.countByJobTypeIn(
                java.util.Arrays.asList("PROFESSIONAL", "BOTH")
        );
        
        long appliedJobs = applicationRepository.countByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("appliedJobs", appliedJobs);

        return "professional/dashboard";
    }

    @RequestMapping(value="/create-profile", method=RequestMethod.GET)
    public String createProfilePage(){
        return "professional/create-profile";
    }

    @RequestMapping(value="/save-profile", method=RequestMethod.POST)
    public String saveProfile(
            HttpSession session,

            @RequestParam int experienceYears,

            @RequestParam String currentRole,

            @RequestParam(required = false)
            Double currentCtc,

            @RequestParam(required = false)
            Double expectedCtc,

            @RequestParam String domainLooking,

            @RequestParam String skillSet,

            @RequestParam String companyName,

            @RequestParam String companyLocation,

            @RequestParam String preferredLocations,

            @RequestParam String noticePeriod,

            @RequestParam String linkedIn,

            @RequestParam String portfolio,

            @RequestParam String qualification,

            @RequestParam String branch,

            @RequestParam(required = false)
            Integer yearOfPassout,

            @RequestParam("resume")
            MultipartFile resume
    ) {

        try {

            Long userId =
                    (Long) session.getAttribute("USER_ID");

            if(userId == null){

                return "redirect:/auth/login";
            }

            User user =
                    userRepository.findById(userId)
                    .orElseThrow();

            ProfessionalProfile profile =
                    professionalRepo
                    .findByUser(user)
                    .orElse(new ProfessionalProfile());

            // USER

            profile.setUser(user);

            // BASIC DETAILS

            profile.setExperienceYears(experienceYears);

            profile.setCurrentRole(currentRole);

            profile.setCurrentCtc(currentCtc);

            profile.setExpectedCtc(expectedCtc);

            profile.setDomainLooking(domainLooking);

            profile.setSkillSet(skillSet);

            profile.setCompanyName(companyName);

            profile.setCompanyLocation(companyLocation);

            profile.setPreferredLocations(preferredLocations);

            profile.setNoticePeriod(noticePeriod);

            profile.setLinkedIn(linkedIn);

            profile.setPortfolio(portfolio);

            profile.setQualification(qualification);

            profile.setBranch(branch);

            profile.setYearOfPassout(yearOfPassout);

            // ONLY FOR NEW PROFILE

            if(profile.getId() == null){

                profile.setVerified(false);

                profile.setApproved(false);

                profile.setActive(true);
            }

            // RESUME UPLOAD

            if(resume != null
                    && !resume.isEmpty()){

                String resumeFile =
                        fileUploadServices
                        .saveFile(resume);

                if(resumeFile != null){

                    profile.setResumePath(resumeFile);
                }
            }

            professionalRepo.save(profile);

            return "redirect:/professional/dashboard";
        }

        catch (Exception e){

            e.printStackTrace();

            return "redirect:/professional/edit-profile?error";
        }
    }    
    @RequestMapping(value="/edit-profile", method=RequestMethod.GET)
    public String editProfile(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        ProfessionalProfile profile =
                professionalRepo.findByUser(user).orElse(null);

        model.addAttribute("profile", profile);

        return "professional/edit-profile";
    }
    
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profileForm(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        ProfessionalProfile profile =
                professionalRepo.findByUser(user).orElse(null);

        // ✅ IF PROFILE EXISTS → VIEW PROFILE PAGE
        if (profile != null) {

            model.addAttribute("profile", profile);

            return "professional/view-profile";
        }

        // ✅ ELSE → CREATE PROFILE PAGE
        return "professional/create-profile";
    }
    
    @RequestMapping(value="/toggle-profile", method=RequestMethod.GET)
    public String toggleProfile(HttpSession session){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        user.setProfileActive(!user.isProfileActive());

        userRepository.save(user);

        return "redirect:/professional/dashboard"; 
    }
    
    @RequestMapping(value="/messages", method=RequestMethod.GET)
    public String viewMessages(HttpSession session, Model model){

        Long userId = (Long) session.getAttribute("USER_ID");

        if(userId == null){
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId).orElseThrow();

        List<Message> messages = messageRepo.findByReceiver(user);

        model.addAttribute("messages", messages);

        return "professional/messages";
    }
    
}