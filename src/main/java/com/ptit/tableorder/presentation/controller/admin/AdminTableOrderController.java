package com.ptit.tableorder.presentation.controller.admin;

import com.ptit.tableorder.model.Customer;
import com.ptit.tableorder.model.TableOrder;
import com.ptit.tableorder.repository.CustomerRepository;
import com.ptit.tableorder.repository.TableOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/table-order")
public class AdminTableOrderController {
    @Autowired
    private TableOrderRepository tableOrderRepository;

    @GetMapping("")
    public String get(HttpServletRequest request) {
        List<TableOrder> tableOrders = tableOrderRepository.findAll();
        request.setAttribute("tableorders", tableOrders);
        return "ql-don-dat-ban";
    }
}
