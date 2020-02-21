package pl.com.app.myflat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.com.app.myflat.dto.LoggedUserDTO;
import pl.com.app.myflat.service.BillService;
import pl.com.app.myflat.service.UserService;

import java.security.Principal;

@Controller
@RequestMapping("/bills")
public class BillSectionController {

    private final BillService billService;
    private final UserService userService;
    public BillSectionController(BillService billService, UserService userService) {
        this.billService = billService;
        this.userService = userService;
    }

    @GetMapping
    public String getBillSectionPage(Model model, Principal principal){
        LoggedUserDTO user = userService.getUser(principal.getName());
            model.addAttribute("billsToPay",billService.showAllBillsToPay(user.getId()));
            model.addAttribute("bills",billService.allUnpaidBillsByCategory(user.getId()));
            model.addAttribute("percentage",billService.percentageOfGeneratedCosts(user.getId()));
        return  "bill-page";
    }
    @GetMapping("/energy")
    public String getEnergyStat(Model model, Principal principal){

        return "redirect:/bills";
    }

    @GetMapping("/water")
    public String getWaterStat(Model model, Principal principal){

        return "redirect:/bills";
    }

    @GetMapping("/heating")
    public String getHeatingStat(Model model, Principal principal){

        return "redirect:/bills";
    }
}
