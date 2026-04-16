package com.example.CFS.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable()) // Disable CSRF for simplicity in MVP
            .authorizeHttpRequests(authz -> authz
                // Allow JSP forwards and Error pages
                .dispatcherTypeMatchers(jakarta.servlet.DispatcherType.FORWARD, jakarta.servlet.DispatcherType.ERROR).permitAll()
                
                // Public paths mapping
                .requestMatchers("/", "/login", "/register", "/forgot_password", "/about", "/contact", "/privacy").permitAll()
                .requestMatchers("/css/**", "/images/**", "/js/**", "/**/*.css", "/**/*.js").permitAll()
                
                // Admin specific paths
                .requestMatchers("/admin/**").hasRole("ADMIN")
                
                // User & Operation paths
                .requestMatchers("/dashboard", "/profile", "/contracts", "/traceability/**").authenticated()
                .requestMatchers("/contract/**", "/delivery/**", "/dispute/**", "/insurance/**", "/payment/**", "/review/**").authenticated()
                .requestMatchers("/inspection/**").hasRole("INSPECTOR")
                .requestMatchers("/buyer/**").hasRole("BUYER")
                .requestMatchers("/farmer/**").hasRole("FARMER")
                .requestMatchers("/crop/**").hasAnyRole("FARMER", "BUYER", "ADMIN")
                
                // Any other request fallback
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/spring_security_login_stub") // Prevents Spring from hijacking the /login POST
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            );

        return http.build();
    }
}
