package com.example.CFS;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest
@Transactional
public class CfsIntegrationTest {

    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @BeforeEach
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testBitByBitSystemFlow() throws Exception {
        // Bit 2: Farmer Registration
        mockMvc.perform(post("/register")
                .param("username", "John MasterFarmer")
                .param("email", "john.test@farmer.com")
                .param("address", "Farm Block A")
                .param("role", "farmer")
                .param("aadhaarNumber", "123412341234")
                .param("panNumber", "FARM1111A")
                .param("password", "strongpass"))
                .andExpect(status().isOk())
                .andExpect(view().name("login"));

        // Bit 3: Buyer Registration
        mockMvc.perform(post("/register")
                .param("username", "MegaCorp Foods")
                .param("email", "corp.test@buyer.com")
                .param("address", "Industrial Zone")
                .param("role", "buyer")
                .param("aadhaarNumber", "555555555555")
                .param("panNumber", "CORP2222B")
                .param("password", "strongpass"))
                .andExpect(status().isOk())
                .andExpect(view().name("login"));

        // Bit 4: Inspector Registration
        mockMvc.perform(post("/register")
                .param("username", "Quality Control Agent")
                .param("email", "qc@inspector.com")
                .param("address", "Govt Office")
                .param("role", "inspector")
                .param("aadhaarNumber", "999999999999")
                .param("panNumber", "QCAG9999C")
                .param("password", "strongpass"))
                .andExpect(status().isOk())
                .andExpect(view().name("login"));

        // Bit 5: Authentic Login Routing for Farmer
        MvcResult farmerLoginResult = mockMvc.perform(post("/login")
                .param("email", "john.test@farmer.com")
                .param("password", "strongpass")
                .param("role", "farmer"))
                .andExpect(status().isFound())
                .andExpect(redirectedUrl("/dashboard"))
                .andReturn();
                
        MockHttpSession farmerSession = (MockHttpSession) farmerLoginResult.getRequest().getSession();
        assertNotNull(farmerSession, "Farmer Session should be established");

        // Bit 6: Farmer Lists a Crop on the Marketplace
        mockMvc.perform(post("/crop/add")
                .session(farmerSession)
                .param("crop_name", "Cotton")
                .param("quantity", "100")
                .param("price_per_unit", "5500.00")
                .param("location", "Test District")
                .param("harvest_date", "2026-10-10"))
                .andExpect(status().isFound())
                .andExpect(redirectedUrl("/dashboard"));

        // Bit 7: Authentic Login Routing for Buyer
        MvcResult buyerLoginResult = mockMvc.perform(post("/login")
                .param("email", "corp.test@buyer.com")
                .param("password", "strongpass")
                .param("role", "buyer"))
                .andExpect(status().isFound())
                .andExpect(redirectedUrl("/dashboard"))
                .andReturn();
                
        MockHttpSession buyerSession = (MockHttpSession) buyerLoginResult.getRequest().getSession();

        // Bit 8: Buyer views Market and tries to retrieve their session Data
        mockMvc.perform(get("/dashboard").session(buyerSession))
                .andExpect(status().isOk());
    }
}
