package com.ptit.tableorder.presentation.controller.admin;

import com.ptit.tableorder.model.Account;
import com.ptit.tableorder.model.Tables;
import com.ptit.tableorder.repository.TableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/table")
public class AdminTableController {
    @Autowired
    private TableRepository tableRepository;

    @PostMapping("")
    public String saveTable(@RequestParam Map<String, String> map) {
        Tables tables = new Tables();
        tables.setDeskAmount(Integer.parseInt(map.get("deskAmount")));
        tableRepository.save(tables);
        return "redirect:/admin/table";
    }

    @PostMapping("/update")
    public String updateTable(@RequestParam Map<String, String> params) {
        Long id = Long.parseLong(params.get("id"));
        Tables tables = tableRepository.findById(id).orElse(null);
        if(tables != null){
            tables.setDeskAmount(Integer.parseInt(params.get("deskAmount")));
            tableRepository.save(tables);
        }
        return "redirect:/admin/table";
    }

    @GetMapping("")
    public String get(HttpServletRequest request) {
        List<Tables> tables = tableRepository.findAll();
        request.setAttribute("tables", tables);
        return "ql-ban-an";
    }

    @PostMapping("/delete/{id}")
    public String get(@PathVariable("id") Long id) {
        tableRepository.deleteById(id);
        return "redirect:/admin/table";
    }
}
