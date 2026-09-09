package in.sp.main.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import in.sp.main.Entities.College;
import in.sp.main.Services.CollegeService;

@Controller
@RequestMapping("/college")
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    @GetMapping("/register")
    public String showRegistrationPage(Model model) {

        model.addAttribute("college", new College());

        return "college/college-registration";
    }

    @PostMapping("/register")
    public String registerCollege(@ModelAttribute College college,
                                  Model model) {

        if (collegeService.isTpoEmailExists(college.getTpoEmail())) {

            model.addAttribute("error",
                    "A college with this TPO email already exists.");

            return "college/college-registration";
        }

        collegeService.registerCollege(college);

        return "redirect:/college/success";
    }

    @GetMapping("/success")
    public String successPage() {

        return "college/college-success";
    }

}