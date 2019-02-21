package com.firstspring.services;
import com.firstspring.beans.UserBean;
import com.firstspring.entities.Roles;
import com.firstspring.entities.Users;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.HashSet;
import java.util.Set;
public class UserService implements UserDetailsService {
    private UserBean userBean;
    public UserBean getUserBean() {
        return userBean;
    }
    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }
    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Users myUser = userBean.getUser(s);
        Set<Roles> roles = myUser.getRoles();
        Set<SimpleGrantedAuthority> authorities = new HashSet<SimpleGrantedAuthority>();
        for(Roles r : roles){
            authorities.add(new SimpleGrantedAuthority(r.getRole()));
        }
        User securityUser = new User(myUser.getEmail(), myUser.getPassword(), authorities);
        return securityUser;
    }
}
