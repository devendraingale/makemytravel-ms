package com.example.makemytravel_ms;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class holiday {
    @GetMapping("/myholiday")
    public String getData(){

        return "Please book your holiday ticket modeule";
    }
}




