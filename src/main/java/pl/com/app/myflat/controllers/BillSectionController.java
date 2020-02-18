package pl.com.app.myflat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BillSectionController {

    @GetMapping
    public String getBillSectionPage(Model model){

        return  "";
    }
}
