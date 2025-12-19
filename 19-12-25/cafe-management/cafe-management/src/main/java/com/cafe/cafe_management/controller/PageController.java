package com.cafe.cafe_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    @GetMapping("/menu")
    public String menu() {
        return "menu";
    }

    @GetMapping("/cart")
    public String cart() {
        return "cart";
    }

    @GetMapping("/myorders")
    public String myOrders() {
        return "myOrders";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "adminDashboard";
    }

    @GetMapping("/manage-products")
    public String manageProducts() {
        return "manageProducts";
    }

    @GetMapping("/manage-categories")
    public String manageCategories() {
        return "manageCategories";
    }

    @GetMapping("/logout")
    public String logout() {
        return "redirect:/login";
    }
}
