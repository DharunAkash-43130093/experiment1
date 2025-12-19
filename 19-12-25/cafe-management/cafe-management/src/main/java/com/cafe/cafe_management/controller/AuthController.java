package com.cafe.cafe_management.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.cafe.cafe_management.dtoo.LoginRequest;
import com.cafe.cafe_management.dtoo.SignupRequest;
import com.cafe.cafe_management.service.AuthService;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService service;

    public AuthController(AuthService service) {
        this.service = service;
    }

    @PostMapping("/signup")
    public ResponseEntity<?> signup(@RequestBody SignupRequest req) {
        service.signup(req);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, String>> login(@RequestBody LoginRequest req) {

        String token = service.login(req);

        Map<String, String> res = new HashMap<>();
        res.put("token", token);

        return ResponseEntity.ok(res);   // ✅ 반드시 200 + JSON
    }
}
