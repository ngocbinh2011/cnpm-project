package com.ptit.tableorder.presentation.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/home")
public class TestController {
    @GetMapping("")
    public String show(HttpServletRequest request){
        request.setAttribute("name", "hello");
        return "index";
    }
}
