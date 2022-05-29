package com.ptit.tableorder.presentation.controller.web;

import com.ptit.tableorder.model.Account;
import com.ptit.tableorder.model.Customer;
import com.ptit.tableorder.model.TableOrder;
import com.ptit.tableorder.model.Tables;
import com.ptit.tableorder.repository.TableOrderRepository;
import com.ptit.tableorder.repository.TableRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/table")
public class TableController {
    @Autowired
    private TableRepository tableRepository;

    @Autowired
    private TableOrderRepository tableOrderRepository;

    @GetMapping("")
    public String get(HttpServletRequest request) {
        List<Tables> tables = tableRepository.findAll();
        tables = tables.stream()
                .filter(table -> table.getStatus() == 0)
                .collect(Collectors.toList());

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute(session.getId());
        request.setAttribute("tables", tables);
        request.setAttribute("account", account);
        return "view-ban-an";
    }

    @PostMapping("/order")
    public String order(HttpServletRequest request, @RequestParam Map<String, String> params) {
        try {

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute(session.getId());
            if (account == null) {
                return "redirect:/sign-in";
            }
            String tableIdStr = request.getParameter("tableId");
            System.out.println(tableIdStr);
            if (tableIdStr == null) {
                return "redirect:/table";
            }
            Long tableId = Long.parseLong(tableIdStr);
            Customer customer = account.getCustomer();

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");

            Date date = (Date) formatter.parse(request.getParameter("timeOrder"));
            LocalDateTime orderTime = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            final Long userOrderTime = orderTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
            List<TableOrder> tableOrders = tableOrderRepository.findByTableId(tableId);

            final long TIME_EATING = TimeUnit.HOURS.toMillis(5);
            boolean isNotFound = tableOrders.stream()
                    .filter(tableOrder -> tableOrder.getOrderTime() != null)
                    .map(tableOrder -> tableOrder.getOrderTime().atZone(ZoneId.systemDefault()).toInstant().toEpochMilli())
                    .noneMatch(time -> time >= userOrderTime - TIME_EATING
                            && time <= userOrderTime + TIME_EATING);

            if (!isNotFound) {
                request.setAttribute("error", "commdsa");
                return "redirect:/table?message=ordered";
            }

            TableOrder tableOrder = new TableOrder();
            tableOrder.setOrderTime(orderTime);
            tableOrder.setTables(tableRepository.findById(tableId).orElse(null));
            tableOrder.setCreatedDate(LocalDate.now());
            tableOrder.setCustomer(customer);

            tableOrderRepository.save(tableOrder);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/table";
    }


    @PostMapping("/search")
    public String search(HttpServletRequest request, @RequestParam Map<String, String> params) {
        try {

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");

            Date date = (Date) formatter.parse(request.getParameter("orderTime"));
            LocalDateTime orderTime = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            final Long userOrderTime = orderTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
            List<TableOrder> tableOrders = tableOrderRepository.findAll();
            List<Tables> tables = tableRepository.findAll();


            final long TIME_EATING = TimeUnit.HOURS.toMillis(5);
            final Set<Long> tableIdWithOrderTime = tableOrders.stream()
                    .filter(tableOrder -> tableOrder.getOrderTime() != null)
                    .filter(tableOrder -> {
                        Long time = tableOrder
                                .getOrderTime()
                                .atZone(ZoneId.systemDefault())
                                .toInstant()
                                .toEpochMilli();
                        return time >= userOrderTime - TIME_EATING
                                && time <= userOrderTime + TIME_EATING;
                    })
                    .filter(tableOrder -> tableOrder.getTables() != null)
                    .map(tableOrder -> tableOrder.getTables().getId())
                    .collect(Collectors.toSet());

            tables = tables.stream()
                    .filter(tables1 -> !tableIdWithOrderTime.contains(tables1.getId()))
                    .collect(Collectors.toList());


            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute(session.getId());
            request.setAttribute("tables", tables);
            request.setAttribute("account", account);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "view-ban-an";
    }

}
