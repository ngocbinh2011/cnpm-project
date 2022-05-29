package com.ptit.tableorder.presentation.controller.admin;

import com.ptit.tableorder.model.Account;
import com.ptit.tableorder.model.Customer;
import com.ptit.tableorder.repository.AccountRepository;
import com.ptit.tableorder.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/customer")
public class AdminCustomerController {
    @Autowired
    private CustomerRepository customerRepository;

    @GetMapping("")
    public String get(HttpServletRequest request) {
        List<Customer> customers = customerRepository.findAll();
        request.setAttribute("customers", customers);
        return "ql-tk-khach-dat-ban";
    }


    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        customerRepository.deleteById(id);
        return "redirect:/admin/customer";
    }

    @PostMapping("/update")
    public String update(@RequestParam Map<String, String> params) {
        Long id = Long.parseLong(params.get("id"));
        Customer customer = customerRepository.findById(id).orElse(null);
        if (customer != null) {
            if(params.get("name") != null){
                customer.setName(params.get("name"));
            }
            if(params.get("address") != null){
                customer.setAddress(params.get("address"));
            }
            if(params.get("phone") != null){
                customer.setPhoneNumber(params.get("phone"));
            }
            customerRepository.save(customer);
        }
        return "redirect:/admin/customer";
    }
}
