package in.sp.main.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import in.sp.main.Entities.College;
import in.sp.main.Services.CollegeService;

@Controller
@RequestMapping("/admin")
public class AdminCollegeController {

    @Autowired
    private CollegeService collegeService;

    /*
     * Show all registered colleges
     */
    @GetMapping("/colleges")
    public String viewColleges(Model model) {

        model.addAttribute("collegeList",
                collegeService.getAllColleges());

        return "admin/college-list";
    }

    /*
     * View complete details
     */
    @GetMapping("view/college/{id}")
    public String viewCollege(@PathVariable Long id,
                              Model model) {

        College college = collegeService.getCollegeById(id);

        model.addAttribute("college", college);

        return "admin/college-details";
    }

   

    @GetMapping("/college/search")
    public String searchCollege(
            @RequestParam("keyword") String keyword,
            Model model){

        model.addAttribute(
                "collegeList",
                collegeService.searchCollege(keyword));

        return "admin/college-list";

    }
    
    @GetMapping("/college/{id}")
    public String viewCollegeDetails(@PathVariable Long id,
                                     Model model) {

        College college = collegeService.getCollegeById(id);

        model.addAttribute("college", college);

        return "admin/college-details";
    }
    
    @PostMapping("/college/remarks/{id}")
    public String saveRemarks(@PathVariable Long id,
                              @RequestParam("remarks") String remarks) {

        collegeService.updateRemarks(id, remarks);

        return "redirect:/admin/college/" + id;
    }
    
    @PostMapping("/college/approve/{id}")
    public String approveCollege(@PathVariable Long id) {

        collegeService.approveCollege(id);

        return "redirect:/admin/college/" + id;
    }
    
    @PostMapping("/college/reject/{id}")
    public String rejectCollege(@PathVariable Long id) {

        collegeService.rejectCollege(id);

        return "redirect:/admin/college/" + id;
    }
}