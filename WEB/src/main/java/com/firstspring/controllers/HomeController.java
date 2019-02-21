package com.firstspring.controllers;
import com.firstspring.beans.UserBean;
import com.firstspring.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @Autowired
    UserBean userBean;
    @RequestMapping(value = {"/enter","/"}, method = RequestMethod.GET)
    public ModelAndView enter(){
        ModelAndView mw = new ModelAndView("login");
        return mw;
    }
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDeniedPage(){
        ModelAndView mw = new ModelAndView("403");
        return mw;
    }
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile(){
        Users user = getUserData();
        ModelAndView mw = new ModelAndView("profile");
        mw.addObject("user", user);
        return mw;
    }
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView admin(){
        ModelAndView mw = new ModelAndView("admin");
        return mw;
    }
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView mw = new ModelAndView("main");
        return mw;
    }
    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!(authentication instanceof AnonymousAuthenticationToken)){
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = userBean.getUser(ud.getUsername());
        }
        return user;
    }
}