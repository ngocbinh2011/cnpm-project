package com.ptit.tableorder.presentation.controller.admin;

import com.ptit.tableorder.model.Account;
import com.ptit.tableorder.model.Tables;
import com.ptit.tableorder.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/account")
public class AdminAccountController {

    @Autowired
    private AccountRepository accountRepository;

    @GetMapping("")
    public String get(HttpServletRequest request) {
        List<Account> accounts = accountRepository.findAll();
        request.setAttribute("accounts", accounts);
        return "ql-tk-khach-dat-ban";
    }

}
