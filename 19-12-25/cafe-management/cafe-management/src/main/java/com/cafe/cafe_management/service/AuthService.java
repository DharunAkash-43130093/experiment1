package com.cafe.cafe_management.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cafe.cafe_management.dtoo.LoginRequest;
import com.cafe.cafe_management.dtoo.SignupRequest;
import com.cafe.cafe_management.model.User;
import com.cafe.cafe_management.repository.UserRepository;
import com.cafe.cafe_management.security.JwtUtil;

@Service
public class AuthService {

    private final UserRepository repo;
    private final PasswordEncoder encoder;
    private final JwtUtil jwt;

    public AuthService(UserRepository repo,
                       PasswordEncoder encoder,
                       JwtUtil jwt) {
        this.repo = repo;
        this.encoder = encoder;
        this.jwt = jwt;
    }

    public void signup(SignupRequest req) {
        User u = new User();
        u.setName(req.getName());
        u.setEmail(req.getEmail());
        u.setPassword(encoder.encode(req.getPassword())); // hash
        u.setRole("ROLE_USER");
        u.setStatus("ACTIVE");
        repo.save(u);
    }

    public String login(LoginRequest req) {

        User user = repo.findByEmail(req.getEmail())
            .orElseThrow(() -> new RuntimeException("User not found"));

        boolean match = encoder.matches(req.getPassword(), user.getPassword());
        System.out.println("Password match = " + match);

        if (!match) {
            throw new RuntimeException("Invalid password");
        }

        return jwt.generateToken(user.getEmail());
    }
}
