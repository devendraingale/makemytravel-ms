package com.example.makemytravel_ms;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class bus {
    @GetMapping("/mybus")
    public String getData(){

        return "Please book your bus ticket";
    }
}

