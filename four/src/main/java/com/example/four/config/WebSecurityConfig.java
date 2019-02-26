package com.example.four.config;

import com.example.four.security.JwtAuthenticationEntryPoint;
import com.example.four.security.JwtAuthorizationTokenFilter;
import com.example.four.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * 安全模块配置类
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    /**
     *
     */
    @Autowired
    private JwtAuthenticationEntryPoint unauthorizedHandler;

    @Autowired
    private UserService userService;

    // Custom JWT based security filter
    @Autowired
    JwtAuthorizationTokenFilter authenticationTokenFilter;

    @Value("${jwt.header}")
    private String tokenHeader;

    @Value("${jwt.route.authentication.path}")
    private String authenticationPath;

    /**
     * 为AuthenticationManagerBuilder对象设置属性
     * @param auth
     * @throws Exception
     */
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userService)
                .passwordEncoder(passwordEncoderBean());
    }

    /**
     * 返回加密对象
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoderBean() {
        return new BCryptPasswordEncoder();
    }

    /**
     *创建AuthenticationManager
     * @return AuthenticationManager
     * @throws Exception
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    /**
     * 配置httpSecurity
     * @param httpSecurity security内置对象
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
            // we don't need CSRF because our token is invulnerable
            .csrf().disable()

            .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()

            // don't create session
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()

            .authorizeRequests()

            // Un-secure H2 Database
            .antMatchers("/webjars/**").permitAll()
            .antMatchers("/swagger-resources/**").permitAll()
            .antMatchers("/v2/api-docs/**").permitAll()
            .antMatchers("/auth/**").permitAll()
            .antMatchers("/api/users/**").permitAll()
            .antMatchers("/api/servers/**").permitAll()
            .antMatchers("/api/order/**").permitAll()
            .antMatchers("/api/share/**").permitAll()
            .anyRequest().authenticated();

        httpSecurity
                .addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);

        // disable page caching
        httpSecurity
                .headers()
                .frameOptions().sameOrigin()  // required to set for H2 else H2 Console will be blank.
                .cacheControl();
    }

    /**
     * 忽略的的资源
     * @param web web对象
     * @throws Exception 异常
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        // AuthenticationTokenFilter will ignore the below paths
        web
                .ignoring()
                .antMatchers(
                        HttpMethod.POST,
                        authenticationPath
                )

                // allow anonymous resource requests
                .and()
                .ignoring()
                .antMatchers(
                    HttpMethod.GET,
                    "/",
                    "/webjars/**",
                    "/swagger-resources/**",
                    "/v2/api-docs/**",
                    "/*.html",
                    "/favicon.ico",
                    "/**/*.html",
                    "/**/*.css",
                    "/**/*.js",
                    "/**/*.jpg"
                )

        // Un-secure H2 Database (for testing purposes, H2 console shouldn't be unprotected in production)
        .and()
        .ignoring()
        .antMatchers("/h2-console/**/**");

    }
}
