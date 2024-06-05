package com.example.makemytravel_ms;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController

public class hotel {
    @GetMapping("/myhotel")
    public String getData(){

<<<<<<< HEAD
        return "Please book your hotel is sadasd ticket";
=======
        return "Please book your hotel ticket modeule";
>>>>>>> b49dbd825c03bde071f2a1ae27c10d448382eaa7
    }
}




