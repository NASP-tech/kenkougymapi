package uca.ungallocontenis.kenkougymapi.controller.Authentication;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import uca.ungallocontenis.kenkougymapi.service.Authentication.AuthenticationService;
import uca.ungallocontenis.kenkougymapi.service.KenkouUser.KenkouUserService;

@RestController
@RequestMapping("/authentication")
public class AuthenticationController {

    private static final Logger LOG = LoggerFactory.getLogger(AuthenticationController.class);
    
    @Autowired
    private AuthenticationService authenticationService;

    @Autowired
    private KenkouUserService kenkouUserService; 

    @GetMapping("/authenticate")
    public String authenticate(Principal principal) {
        if(principal == null)
            return "Credentials not provided!";
        else
            return kenkouUserService.obtenerUsuario(principal.getName()).toString();
    }

    @GetMapping("/createUser")
    public String createUser() {
        return "User created!";
    }

}
