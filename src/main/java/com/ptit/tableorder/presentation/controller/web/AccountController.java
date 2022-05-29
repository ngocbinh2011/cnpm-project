package com.ptit.tableorder.presentation.controller.web;

import com.ptit.tableorder.model.Account;
import com.ptit.tableorder.model.Customer;
import com.ptit.tableorder.model.Role;
import com.ptit.tableorder.repository.AccountRepository;
import com.ptit.tableorder.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller

public class AccountController {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("/sign-in")
    public String signIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Object object = session.getAttribute(session.getId());
        if(object != null){
            return "redirect:/table";
        }
        String message = request.getParameter("message");
        if (message != null) {
            request.setAttribute("message", message);
        }
        return "sign_in";
    }

    @GetMapping("/sign-up")
    public String signUp(HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null) {
            request.setAttribute("message", message);
        }
        return "sign_up";
    }

    @PostMapping("/sign-in")
    public String signInPost(@RequestParam Map<String, String> params, HttpServletRequest request) {
        String email = params.get("email");
        String password = params.get("password");

        Account account = accountRepository.findByEmail(email);
        if (account == null || !account.getPassword().equals(password)) {
            return "redirect:/sign-in?message=Tai khoan hoac mat khau khong dung";
        }
        HttpSession session = request.getSession();
        session.setAttribute(session.getId(), account);
        return "redirect:/table";
    }

    @PostMapping("/sign-up")
    public String signUpPost(@RequestParam Map<String, String> params) {
        String firstName = params.get("firstName");
        String lastName = params.get("lastName");
        String email = params.get("email");
        String password1 = params.get("password1");
        String password2 = params.get("password2");

        if (email == null) {
            return "redirect:/sign-up?message=email khong duoc bo trong";
        }

        if (password1 == null || password2 == null || !password1.equals(password2)) {
            return "redirect:/sign-up?message=Mat khau khong trung khop";
        }

        if (accountRepository.findByEmail(email) != null) {
            return "redirect:/sign-up?message=Email da ton tai";
        }

        Account account = new Account();
        account.setRole(Role.USER);
        account.setEmail(email);
        account.setPassword(password1);
        accountRepository.save(account);

        Account acc = accountRepository.findByEmail(email);

        Customer customer = new Customer();
        customer.setAccount(acc);
        customer.setName(firstName + " " + lastName);
        customerRepository.save(customer);
        return "redirect:/sign-in";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute(session.getId());
        return "redirect:/sign-in";
    }

}
