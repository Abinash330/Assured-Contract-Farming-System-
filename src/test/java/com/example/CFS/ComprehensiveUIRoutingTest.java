package com.example.CFS;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@Transactional
public class ComprehensiveUIRoutingTest {

    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @BeforeEach
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    private MockHttpSession createRoleSession(String username, String role, String email, String password) throws Exception {
        // Register User first to ensure they exist
        mockMvc.perform(post("/register")
                .param("username", username)
                .param("email", email)
                .param("address", "Virtual Node")
                .param("role", role)
                .param("aadhaarNumber", "000000000000")
                .param("panNumber", "TEST0000X")
                .param("password", password));

        // Authenticate to populate Session
        return (MockHttpSession) mockMvc.perform(post("/login")
                .param("email", email)
                .param("password", password))
                .andReturn().getRequest().getSession();
    }

    @Test
    public void testPublicPages() throws Exception {
        String[] publicRoutes = {"/", "/about", "/contact", "/privacy", "/login", "/register", "/forgot_password"};
        for (String route : publicRoutes) {
            // Because / or /about might redirect if security is strict, we just ensure it doesn't 500 or 404
            mockMvc.perform(get(route))
                   .andExpect(result -> {
                       int status = result.getResponse().getStatus();
                       if (status >= 400) {
                           throw new AssertionError("Route " + route + " returned error status " + status);
                       }
                   });
        }
    }

    @Test
    public void testFarmerUIPaths() throws Exception {
        MockHttpSession session = createRoleSession("Farmer Node", "farmer", "farmer_test_ui@cfs.com", "pass");
        String[] routes = {"/dashboard", "/profile", "/contracts", "/crop/browse", "/crop/add", "/payment/add-details"};
        for (String route : routes) {
            mockMvc.perform(get(route).session(session))
                   .andExpect(result -> {
                       int status = result.getResponse().getStatus();
                       if (status >= 400) {
                           throw new AssertionError("Route " + route + " returned error status " + status);
                       }
                   });
        }
    }

    @Test
    public void testBuyerUIPaths() throws Exception {
        MockHttpSession session = createRoleSession("Buyer Node", "buyer", "buyer_test_ui@cfs.com", "pass");
        String[] routes = {"/dashboard", "/profile", "/contracts", "/crop/browse"};
        for (String route : routes) {
            mockMvc.perform(get(route).session(session))
                   .andExpect(result -> {
                       int status = result.getResponse().getStatus();
                       if (status >= 400) {
                           throw new AssertionError("Route " + route + " returned error status " + status);
                       }
                   });
        }
    }

    @Test
    public void testInspectorUIPaths() throws Exception {
        MockHttpSession session = createRoleSession("Inspector Node", "inspector", "inspector_test_ui@cfs.com", "pass");
        String[] routes = {"/dashboard", "/profile", "/contracts"};
        for (String route : routes) {
            mockMvc.perform(get(route).session(session))
                   .andExpect(result -> {
                       int status = result.getResponse().getStatus();
                       if (status >= 400) {
                           throw new AssertionError("Route " + route + " returned error status " + status);
                       }
                   });
        }
    }

    @Test
    public void testAdminUIPaths() throws Exception {
        MockHttpSession session = createRoleSession("Admin Node", "admin", "admin_test_ui@cfs.com", "pass");
        String[] routes = {"/admin/dashboard", "/admin/users", "/admin/contracts", "/admin/disputes", "/admin/settings"};
        for (String route : routes) {
            mockMvc.perform(get(route).session(session))
                   .andExpect(result -> {
                       int status = result.getResponse().getStatus();
                       if (status >= 400) {
                           throw new AssertionError("Route " + route + " returned error status " + status);
                       }
                   });
        }
    }
}
