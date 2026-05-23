package in.sp.main.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.InternshipCertificate;
import in.sp.main.Entities.Message;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.InternshipCertificateRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.MessageRepository;
import in.sp.main.Repositories.UserRepository;
import in.sp.main.Services.FresherProfileService;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/fresher")
public class FresherController {

    @Autowired
    private FresherProfileService fresherProfileService;
    
    @Autowired
    private FresherProfileRepository fresherProfileRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private JobApplicationRepository applicationRepository;

    @Autowired
    private InternshipCertificateRepository certificateRepository;

    @Autowired
    private MessageRepository messageRepo;
    
    @RequestMapping(value="/dashboard", method=RequestMethod.GET)
    public String dashboard(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        long totalJobs = jobRepository.countByJobTypeIn(
                java.util.Arrays.asList("FRESHER", "BOTH")
        );

        long appliedJobs = applicationRepository.countByUser(user);

        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("appliedJobs", appliedJobs);

        FresherProfile profile = fresherProfileRepository.findByUser(user).orElse(null);

        System.out.println("USER ID: " + user.getId());
        System.out.println("PROFILE ID: " + (profile != null ? profile.getId() : "null"));
        System.out.println("APPROVED: " + (profile != null && profile.isCertificateApproved()));
        System.out.println("PATH: " + (profile != null ? profile.getCertificatePath() : "null"));

        InternshipCertificate certificate =
                certificateRepository
                .findByUser(user)
                .orElse(null);

        boolean showCertificate = false;
        String certificatePath = null;

        if(certificate != null
                && certificate.getFilePath() != null
                && !certificate.getFilePath().isEmpty()){

            showCertificate = true;

            certificatePath = certificate.getFilePath();

            System.out.println("SHOW CERTIFICATE: true");
            System.out.println("PATH: " + certificatePath);

        }
        else{

            System.out.println("SHOW CERTIFICATE: false");
        }

        model.addAttribute("showCertificate", showCertificate);

        model.addAttribute("certificatePath", certificatePath);

        System.out.println("SHOW CERTIFICATE: " + showCertificate);
        model.addAttribute("user", user);
      
        model.addAttribute("certificatePath", certificatePath);

        return "fresher/dashboard";
    }
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profileForm(HttpSession session) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        FresherProfile profile = fresherProfileRepository.findByUser(user).orElse(null);

        // ✅ IF PROFILE EXISTS → VIEW PAGE
        if (profile != null) {
            return "redirect:/fresher/viewprofile";
        }

        // ✅ ELSE → CREATE PROFILE PAGE
        return "fresher/profile";
    }

   @RequestMapping(value = "/profile", method = RequestMethod.POST)
   public String saveProfile(
           HttpSession session,
           @RequestParam String skillSet,
           @RequestParam String domainInterested,
           @RequestParam(required = false) Double tenth,
           @RequestParam(required = false) Double twelfth,
           @RequestParam(required = false) Double degree,
           @RequestParam String preferredLocations,
           @RequestParam(required = false, defaultValue = "false") boolean readyForBond,
           @RequestParam(required = false) MultipartFile resume,
           @RequestParam(required = false) MultipartFile video,
           @RequestParam(required = false) MultipartFile photo,
           @RequestParam(required = false) MultipartFile aadhar
   ) {

       try {
           fresherProfileService.saveProfile(
                   session,
                   skillSet,
                   domainInterested,
                   tenth,
                   twelfth,
                   degree,
                   preferredLocations,
                   readyForBond,
                   resume,
                   video,
                   photo,
                   aadhar
           );
       } catch (Exception e) {
           e.printStackTrace();
           return "error"; // create error.jsp if needed
       }

       return "redirect:/fresher/dashboard";
   }
    @RequestMapping(value = "/viewprofile", method = RequestMethod.GET)
    public String viewProfile(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        FresherProfile profile = fresherProfileRepository
                .findByUser(user)
                .orElse(null);

        model.addAttribute("profile", profile);

        return "fresher/view-profile";
    }
    
    @RequestMapping(value = "/edit-profile", method = RequestMethod.GET)
    public String editProfile(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("USER_ID");

        if (userId == null) {
            return "redirect:/auth/login";
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        FresherProfile profile = fresherProfileRepository
                .findByUser(user)
                .orElse(null);

        model.addAttribute("profile", profile);

        return "fresher/edit-profile";
    }
    
   
    @RequestMapping(value="/download-certificate", method=RequestMethod.GET)
    @GetMapping("/certificate/{fileName}")
    @ResponseBody
    public ResponseEntity<Resource> downloadCertificate(
            @PathVariable String fileName) throws Exception {

        Path path = Paths.get(
                System.getProperty("user.dir")
                + "/certificates/"
                + fileName
        );

        Resource resource =
                new UrlResource(path.toUri());

        if(!resource.exists()){

            throw new RuntimeException("File not found");
        }

        return ResponseEntity.ok()
                .header(
                        HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + fileName + "\""
                )
                .contentType(MediaType.APPLICATION_PDF)
                .body(resource);
    }
    
    @RequestMapping(value="/toggle-profile", method=RequestMethod.GET)
    public String toggleProfile(HttpSession session){

        Long userId = (Long) session.getAttribute("USER_ID");

        User user = userRepository.findById(userId).orElseThrow();

        user.setProfileActive(!user.isProfileActive());

        userRepository.save(user);

        return "redirect:/fresher/dashboard";
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

        return "fresher/messages";
    }
}