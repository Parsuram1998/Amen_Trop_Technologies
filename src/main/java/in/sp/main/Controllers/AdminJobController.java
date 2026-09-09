package in.sp.main.Controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.Job;
import in.sp.main.Entities.JobApplication;
import in.sp.main.Entities.JobUpdate;
import in.sp.main.Entities.ProfessionalProfile;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.JobApplicationRepository;
import in.sp.main.Repositories.JobRepository;
import in.sp.main.Repositories.JobUpdateRepository;
import in.sp.main.Repositories.ProfessionalProfileRepository;
import in.sp.main.Services.JobMailService;
import in.sp.main.Services.MailService;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminJobController {

    @Autowired
    private JobRepository jobRepository;
    
    @Autowired
    private JobApplicationRepository applicationRepository;
    
    @Autowired
    private FresherProfileRepository fresherRepo;

    @Autowired
    private ProfessionalProfileRepository professionalRepo;
    
    @Autowired
    private MailService mailService;
    
    @Autowired
    private JobMailService jobMailService;
    
    @Autowired
    private JobUpdateRepository jobUpdateRepo;
    
    @RequestMapping(value="/jobs", method=RequestMethod.GET)
    public String jobs(Model model){

        model.addAttribute("jobs", jobRepository.findAll());

        return "admin/jobs";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String jobs(HttpSession session, Model model){

        Object roleObj = session.getAttribute("ROLE");

        if (roleObj == null) {
            return "redirect:/auth/login";
        }

        String role = roleObj.toString();

        List<Job> jobs;

        if(role.equalsIgnoreCase("FRESHER")){
            jobs = jobRepository.findByJobTypeInIgnoreCase(
                    List.of("FRESHER","BOTH")
            );
        }else{
            jobs = jobRepository.findByJobTypeInIgnoreCase(
                    List.of("PROFESSIONAL","BOTH")
            );
        }

        model.addAttribute("jobs", jobs);

        return "jobs/list";
    }

    @RequestMapping(value="/create-job", method=RequestMethod.GET)
    public String createJobPage(){
        return "admin/create-job";
    }

    @RequestMapping(value="/save-job", method=RequestMethod.POST)
    public String saveJob(
            @RequestParam String title,
            @RequestParam String companyName,
            @RequestParam String location,
            @RequestParam String domain,
            @RequestParam String description,
            @RequestParam String eligibility,
            @RequestParam int minExperience,
            @RequestParam double minPercentage,
            @RequestParam String jobType,
            @RequestParam(required=false) boolean strictApply,
            @RequestParam(required = false) boolean bondRequired,
            @RequestParam(required = false) String eligibleBranch,
            @RequestParam(required = false) Integer eligibleYearOfPassout,
            Model model){

        boolean exists = jobRepository
                .existsByTitleAndCompanyNameAndLocation(
                        title,
                        companyName,
                        location);

        if(exists){

            model.addAttribute("error",
                    "Job already exists for this company and location");

            return "admin/create-job";
        }

        Job job = new Job();

        job.setTitle(title);
        job.setCompanyName(companyName);
        job.setLocation(location);
        job.setDomain(domain);
        job.setDescription(description);
        job.setEligibility(eligibility);
        job.setMinExperience(minExperience);
        job.setMinPercentage(minPercentage);
        job.setJobType(jobType);
        job.setStrictApply(strictApply);
        job.setCreatedAt(LocalDateTime.now());
        job.setBondRequired(bondRequired);
        
        job.setEligibleBranch(eligibleBranch);

        job.setEligibleYearOfPassout(
                eligibleYearOfPassout
        );
        
        Job savedJob = jobRepository.save(job);
        jobMailService.sendJobNotification(savedJob);

        return "redirect:/admin/jobs";
    }

    @RequestMapping(value="/job-applicants", method=RequestMethod.GET)
    public String jobApplicants(@RequestParam Long jobId,
                                @RequestParam(required = false) String skill,
                                @RequestParam(required = false) String role,
                                @RequestParam(required = false) Integer minExperience,
                                @RequestParam(required = false) Double minDegree,
                                Model model){

        Job job = jobRepository.findById(jobId).orElseThrow();

        List<JobApplication> apps = applicationRepository.findByJob(job);

        if (role != null && !role.trim().isEmpty()) {
            apps = apps.stream()
                    .filter(a -> a.getUser().getRole().name().equalsIgnoreCase(role))
                    .toList();
        }

        if (skill != null && !skill.trim().isEmpty()) {
            String searchSkill = skill.toLowerCase();

            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getSkillSet() != null
                            && fp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null
                            && pp.getSkillSet() != null
                            && pp.getSkillSet().toLowerCase().contains(searchSkill);
                }

                return false;
            }).toList();
        }

        if (minExperience != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("PROFESSIONAL".equalsIgnoreCase(u.getRole().name())) {
                    ProfessionalProfile pp = professionalRepo.findByUser(u).orElse(null);
                    return pp != null && pp.getExperienceYears() >= minExperience;
                }

                return true;
            }).toList();
        }

        if (minDegree != null) {
            apps = apps.stream().filter(a -> {
                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(u.getRole().name())) {
                    FresherProfile fp = fresherRepo.findByUser(u).orElse(null);
                    return fp != null
                            && fp.getDegreePercentage() != null
                            && fp.getDegreePercentage() >= minDegree;
                }

                return true;
            }).toList();
        }

        model.addAttribute("job", job);
        model.addAttribute("applications", apps);

        return "admin/job-applicants";
    }
    
    @RequestMapping(value="/download-applicants", method=RequestMethod.GET)
    public void downloadApplicants(@RequestParam Long jobId,
                                   @RequestParam(required = false) String skill,
                                   @RequestParam(required = false) String role,
                                   @RequestParam(required = false) String minExperience,
                                   @RequestParam(required = false) String minDegree,
                                   HttpServletResponse response) throws Exception {

        Job job = jobRepository.findById(jobId)
                .orElseThrow();

        List<JobApplication> apps =
                applicationRepository.findByJob(job);

        // SAFE FILTER VALUES

        final Integer expFilter;

        if(minExperience != null
                && !minExperience.trim().isEmpty()){

            expFilter = Integer.parseInt(minExperience);

        }
        else{

            expFilter = null;
        }

        final Double degFilter;

        if(minDegree != null
                && !minDegree.trim().isEmpty()){

            degFilter = Double.parseDouble(minDegree);

        }
        else{

            degFilter = null;
        }

        // ROLE FILTER

        if (role != null
                && !role.trim().isEmpty()) {

            apps = apps.stream()
                    .filter(a ->
                            a.getUser()
                            .getRole()
                            .name()
                            .equalsIgnoreCase(role))
                    .toList();
        }

        // SKILL FILTER

        if (skill != null
                && !skill.trim().isEmpty()) {

            String searchSkill =
                    skill.toLowerCase();

            apps = apps.stream().filter(a -> {

                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(
                        u.getRole().name())) {

                    FresherProfile fp =
                            fresherRepo
                            .findByUser(u)
                            .orElse(null);

                    return fp != null
                            && fp.getSkillSet() != null
                            && fp.getSkillSet()
                            .toLowerCase()
                            .contains(searchSkill);
                }

                if ("PROFESSIONAL".equalsIgnoreCase(
                        u.getRole().name())) {

                    ProfessionalProfile pp =
                            professionalRepo
                            .findByUser(u)
                            .orElse(null);

                    return pp != null
                            && pp.getSkillSet() != null
                            && pp.getSkillSet()
                            .toLowerCase()
                            .contains(searchSkill);
                }

                return false;

            }).toList();
        }

        // EXPERIENCE FILTER

        if (expFilter != null) {

            apps = apps.stream().filter(a -> {

                User u = a.getUser();

                if ("PROFESSIONAL".equalsIgnoreCase(
                        u.getRole().name())) {

                    ProfessionalProfile pp =
                            professionalRepo
                            .findByUser(u)
                            .orElse(null);

                    return pp != null
                            && pp.getExperienceYears()
                            >= expFilter;
                }

                return true;

            }).toList();
        }

        // DEGREE FILTER

        if (degFilter != null) {

            apps = apps.stream().filter(a -> {

                User u = a.getUser();

                if ("FRESHER".equalsIgnoreCase(
                        u.getRole().name())) {

                    FresherProfile fp =
                            fresherRepo
                            .findByUser(u)
                            .orElse(null);

                    return fp != null
                            && fp.getDegreePercentage() != null
                            && fp.getDegreePercentage()
                            >= degFilter;
                }

                return true;

            }).toList();
        }

        // EXCEL

        Workbook workbook =
                new XSSFWorkbook();

        Sheet sheet =
                workbook.createSheet("Applicants");

        // HEADER STYLE

        CellStyle headerStyle =
                workbook.createCellStyle();

        Font headerFont =
                workbook.createFont();

        headerFont.setBold(true);

        headerFont.setFontHeightInPoints((short)12);

        headerStyle.setFont(headerFont);

        // HEADER

        Row header =
                sheet.createRow(0);

        String[] columns = {
                "Name",
                "Email",
                "Phone",
                "Role",
                "Qualification",
                "Branch",
                "Year Of Passout",
                "Skills",
                "Experience",
                "Degree %",
                "Applied At"
        };
        
        
        DateTimeFormatter formatter =
                DateTimeFormatter.ofPattern(
                        "dd MMM yyyy hh:mm a"
                );

        for(int i = 0; i < columns.length; i++){

            Cell cell = header.createCell(i);

            cell.setCellValue(columns[i]);

            cell.setCellStyle(headerStyle);
        }

        int rowCount = 1;

        // DATA

        for (JobApplication app : apps) {

            Row row =
                    sheet.createRow(rowCount++);

            User u = app.getUser();

            FresherProfile fp =
                    fresherRepo
                    .findByUser(u)
                    .orElse(null);

            ProfessionalProfile pp =
                    professionalRepo
                    .findByUser(u)
                    .orElse(null);

            // NAME

            row.createCell(0).setCellValue(
                    u.getFullName() != null
                    ? u.getFullName()
                    : ""
            );

            // EMAIL

            row.createCell(1).setCellValue(
                    u.getEmail() != null
                    ? u.getEmail()
                    : ""
            );

            // PHONE

            row.createCell(2).setCellValue(
                    u.getPhone() != null
                    ? u.getPhone()
                    : ""
            );

            // ROLE

            row.createCell(3).setCellValue(
                    u.getRole() != null
                    ? u.getRole().name()
                    : ""
            );

            // QUALIFICATION

            String qualification = "";

            if(fp != null
                    && fp.getQualification() != null){

                qualification = fp.getQualification();
            }

            if(pp != null
                    && pp.getQualification() != null){

                qualification = pp.getQualification();
            }

            row.createCell(4).setCellValue(
                    qualification
            );

            // BRANCH

            String branch = "";

            if(fp != null
                    && fp.getBranch() != null){

                branch = fp.getBranch();
            }

            if(pp != null
                    && pp.getBranch() != null){

                branch = pp.getBranch();
            }

            row.createCell(5).setCellValue(
                    branch
            );

            // YEAR OF PASSOUT

            String yop = "";

            if(fp != null
                    && fp.getYearOfPassout() != null){

                yop = String.valueOf(
                        fp.getYearOfPassout()
                );
            }

            if(pp != null
                    && pp.getYearOfPassout() != null){

                yop = String.valueOf(
                        pp.getYearOfPassout()
                );
            }

            row.createCell(6).setCellValue(
                    yop
            );

            // SKILLS

            String skills = "";

            if(fp != null
                    && fp.getSkillSet() != null){

                skills = fp.getSkillSet();
            }

            if(pp != null
                    && pp.getSkillSet() != null){

                skills = pp.getSkillSet();
            }

            row.createCell(7).setCellValue(
                    skills
            );

            // EXPERIENCE

            row.createCell(8).setCellValue(
                    pp != null
                    ? String.valueOf(
                            pp.getExperienceYears()
                    )
                    : ""
            );

            // DEGREE %

            String degree = "N/A";

            if(fp != null
                    && fp.getDegreePercentage() != null){

                degree = String.valueOf(
                        fp.getDegreePercentage()
                );
            }

            row.createCell(9).setCellValue(degree);
            
            // APPLIED DATE

            
            
            row.createCell(10).setCellValue(
                    app.getAppliedAt() != null
                    ? app.getAppliedAt().format(formatter)
                    : ""
            );
        }

        // AUTO SIZE

        for(int i = 0; i < columns.length; i++){

            sheet.autoSizeColumn(i);
        }

        response.setContentType(
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        );

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=applicants.xlsx"
        );

        workbook.write(response.getOutputStream());

        workbook.close();
    }
    
    @RequestMapping(value="/add-update", method=RequestMethod.POST)
    public String addUpdate(@RequestParam Long jobId,
                            @RequestParam String updateText){

        try {

            Job job = jobRepository.findById(jobId)
                    .orElseThrow(() -> new RuntimeException("Job not found"));

            JobUpdate update = new JobUpdate();
            update.setJob(job);
            update.setUpdateText(updateText);
            update.setCreatedAt(java.time.LocalDateTime.now());

            jobUpdateRepo.save(update);

            return "redirect:/admin/jobs";

        } catch (Exception e) {

            e.printStackTrace();   // 🔥 THIS WILL SHOW REAL ERROR IN CONSOLE

            throw e;               // rethrow so you still see error page
        }
    }
    
    @RequestMapping(value="/edit-job", method=RequestMethod.GET)
    public String editJob(@RequestParam Long jobId, Model model) {

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found"));

        model.addAttribute("job", job);

        return "admin/edit-job";
    }
    
    @RequestMapping(value="/update-job", method=RequestMethod.POST)
    public String updateJob(
            @RequestParam Long jobId,
            @RequestParam String title,
            @RequestParam String companyName,
            @RequestParam String location,
            @RequestParam String domain,
            @RequestParam String description,
            @RequestParam String eligibility,
            @RequestParam int minExperience,
            @RequestParam double minPercentage,
            @RequestParam String jobType,
            @RequestParam(required = false) boolean strictApply,
            @RequestParam(required = false) boolean bondRequired,
            @RequestParam(required = false) String eligibleBranch,
            @RequestParam(required = false) Integer eligibleYearOfPassout) {

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found"));

        job.setTitle(title);
        job.setCompanyName(companyName);
        job.setLocation(location);
        job.setDomain(domain);
        job.setDescription(description);
        job.setEligibility(eligibility);
        job.setMinExperience(minExperience);
        job.setMinPercentage(minPercentage);
        job.setJobType(jobType);
        job.setStrictApply(strictApply);
        job.setBondRequired(bondRequired);
        job.setEligibleBranch(eligibleBranch);
        job.setEligibleYearOfPassout(eligibleYearOfPassout);

        jobRepository.save(job);

        return "redirect:/admin/jobs";
    }
    
    @RequestMapping(value="/end-drive", method=RequestMethod.POST)
    public String endDrive(@RequestParam Long jobId) {

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found"));

        job.setDriveEnded(true);

        jobRepository.save(job);

        return "redirect:/admin/jobs";
    }
    
    @RequestMapping(value="/delete-job", method=RequestMethod.POST)
    public String deleteJob(@RequestParam Long jobId, Model model) {

        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found"));

        List<JobApplication> applications =
                applicationRepository.findByJob(job);

        if (!applications.isEmpty()) {

            return "redirect:/admin/jobs?deleteError=applications";
        }

        jobRepository.delete(job);

        return "redirect:/admin/jobs?deleted=true";
    }
}