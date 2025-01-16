package com.Spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Spring.service.ReportService;


@Controller
@RequestMapping("/admin/reports")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/today")
    public String showTodayOrders(Model model) {
        model.addAttribute("orders", reportService.getTodayOrders());
        return "admin/reports/today";
    }

    @GetMapping("/month")
    public String showMonthOrders(@RequestParam int month, @RequestParam int year, Model model) {
        model.addAttribute("orders", reportService.getMonthOrders(month, year));
        return "admin/reports/month";
    }

    @GetMapping("/year")
    public String showYearOrders(@RequestParam int year, Model model) {
        model.addAttribute("orders", reportService.getYearOrders(year));
        return "admin/reports/year";
    }
}

