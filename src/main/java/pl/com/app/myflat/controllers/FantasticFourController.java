package pl.com.app.myflat.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/we")
public class FantasticFourController {

    @GetMapping
    public String showOurPage() {
        return "fantasticFour";
    }
}