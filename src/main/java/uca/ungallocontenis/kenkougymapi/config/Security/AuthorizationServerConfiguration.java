package uca.ungallocontenis.kenkougymapi.config.Security;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Collections;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import uca.ungallocontenis.kenkougymapi.config.KenkouGymApp.KenkouGymAppInfo;

// Will create singleton beans when true
@Configuration(proxyBeanMethods = false)
public class AuthorizationServerConfiguration {

    private static final Logger LOG = org.slf4j.LoggerFactory.getLogger(AuthorizationServerConfiguration.class);

    @Autowired
	private KenkouGymAppInfo clientInfo;

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        PasswordEncoder passwordEncoder = null;
        
        try {
            // The secure random instance to use
            SecureRandom secureRandom = SecureRandom.getInstanceStrong();
            // The log rounds to use, between 4 and 31
            passwordEncoder = new BCryptPasswordEncoder(4, secureRandom);
        } catch (NoSuchAlgorithmException e) {
            LOG.info("No secure random algorithm available", e);
            passwordEncoder =  new BCryptPasswordEncoder(4);
        }

        return passwordEncoder;
    }

    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration(); 
        
        // Any communication to this backend will be accepted if the communication is coming from
        // these specified domains
        // configuration.setAllowedOrigins(Collections.singletonList(clientInfo.getDomain()));
        configuration.setAllowedOrigins(Collections.singletonList("*"));

        // Allow all HTTP methods 
        configuration.setAllowedMethods(Collections.singletonList("*"));

        // Allow credentials
        // configuration.setAllowCredentials(true);
        configuration.setAllowCredentials(false);

        // Allow all HTTP headers
        configuration.setAllowedHeaders(Collections.singletonList("*"));

        // Expose header to all frontend requests using our backend
        // configuration.setExposedHeaders(Collections.singletonList("Authorization"));

        // The response of a pre-flight request will be cached by 1 min
        configuration.setMaxAge(3600L);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    @Order(Ordered.HIGHEST_PRECEDENCE) // First bean to initialize
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // Default configuration which will secure all requests
        http.cors().and()
        .csrf().disable()
        .authorizeRequests()
        // Any request sent to the API
        .anyRequest().permitAll()
        // Should be through an authenticated user
        // .authenticated().and()
        // And this will apply for any requests coming from forms in the client
        // .formLogin().and()
        // And this will apply for any requests coming from other places in the client
        // .httpBasic()
        ;

        // We disable the JSESSIONID token generation because we will provide a JWT token
        // http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
        // // CORS configuration provided by Bean 
        // .cors().and()
        // // Enables Cross-Site Forgery Protection
        // .csrf().disable() // Using JWT will protect from CSRF
        // // All these paths are allowed to not include the CSRF token when sending requests
        // // .ignoringAntMatchers("/path-csfr-should-ignore")
        // // Necessary to allow js to read it 
        // // .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()).and()
        // .authorizeHttpRequests( auth -> auth
        //     .antMatchers("/authentication/authenticate").permitAll()
        //     .antMatchers("/user/**", "/authentication/**").authenticated()
        // ).httpBasic(Customizer.withDefaults());

        return http.build();
    }
}
