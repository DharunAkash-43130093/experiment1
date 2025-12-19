package com.cafe.cafe_management.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            // ❌ Disable CSRF for simplicity (API + JSP)
            .csrf(csrf -> csrf.disable())

            // ✅ Use session for JSP pages
            .sessionManagement(session ->
                session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            )

            .authorizeHttpRequests(auth -> auth

                // ✅ PUBLIC PAGES (JSP routes via PageController)
                .requestMatchers(
                        "/",
                        "/login",
                        "/signup",
                        "/menu",
                        "/cart",
                        "/myorders",
                        "/dashboard",
                        "/manage-products",
                        "/manage-categories",
                        "/logout",
                        "/error"
                ).permitAll()

                // ✅ Allow JSP forwarding
                .requestMatchers("/**/*.jsp").permitAll()

                // ✅ STATIC FILES
                .requestMatchers(
                        "/css/**",
                        "/js/**",
                        "/images/**",
                        "/webjars/**"
                ).permitAll()

                // ✅ AUTH APIs
                .requestMatchers("/api/auth/**").permitAll()

                // 🔒 PROTECT OTHER APIs (optional – can tighten later)
                .requestMatchers("/api/**").permitAll()

                // ✅ Anything else
                .anyRequest().permitAll()
            );

        return http.build();
    }

    // ✅ BCrypt encoder used in AuthService
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
