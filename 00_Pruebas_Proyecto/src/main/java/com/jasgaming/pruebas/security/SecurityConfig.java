package com.jasgaming.pruebas.security;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
		.dataSource(dataSource)
		.usersByUsernameQuery("select username, password, enabled from Usuarios where username=?")
		.authoritiesByUsernameQuery("select us.username, p.nombre from Usuarios us" +
									" inner join Perfiles p on p.id_perfil = us.id_Perfil where us.username=?");
	}	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
		.authorizeRequests()
		.antMatchers("/css/**", "/js/**", "/images/**").permitAll()
		.antMatchers("/", "/registro", "/login", "/logout", "/mostrarRegistroCompleto", "/videojuego/**", "/consola/**", "/accesorio/**").permitAll()
		.anyRequest().authenticated()
		.and().formLogin().defaultSuccessUrl("/")
		.and().logout().invalidateHttpSession(true).logoutSuccessUrl("/").clearAuthentication(true);
	}	
	
	
	// Para evitar problemas con el firewall al crear las rutas al dar de alta videojuegos/consolas/accesorios
    @Override
    public void configure(WebSecurity web) {
        web.httpFirewall(allowUrlEncodedSlashHttpFirewall());
    }
     
    @Bean
    public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
        DefaultHttpFirewall firewall = new DefaultHttpFirewall();
        firewall.setAllowUrlEncodedSlash(true);
        return firewall;
    }
		
}

