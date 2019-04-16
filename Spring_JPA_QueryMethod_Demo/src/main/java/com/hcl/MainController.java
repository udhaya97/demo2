package com.hcl;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;






@RestController
public class MainController {

	@Autowired
	UserRepository repo;
	@RequestMapping(value = "/")
	public ModelAndView hello(){
		return  new ModelAndView("hello");
		
	}
	@RequestMapping(value = "/save")
	public ModelAndView save(@ModelAttribute User user){
	repo.save(user);
	return new ModelAndView("redirect:/list");
		
	}
	@RequestMapping(value = "/list")
	public ModelAndView listUser(@ModelAttribute("users") User users,@PageableDefault(value = 3,page = 0) Pageable pageable){
		Page page = repo.findAll(pageable);
		List< User> user = page.getContent();
		ModelAndView modelAndView = new ModelAndView("listUser","User",user);
		modelAndView.addObject("total",page.getTotalPages());
		modelAndView.addObject("current",page.getNumber());
		//List< User> user = (List<User>) repo.findAll();
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/delete")
	public ModelAndView deleteUserById(HttpServletRequest request, @ModelAttribute("users") User user) {
		int userId = Integer.parseInt(request.getParameter("id"));
		repo.delete(userId);
		return new ModelAndView("redirect:/list");
	}
	@RequestMapping("/edit")
	public ModelAndView editCustomer(@ModelAttribute("users") User users, HttpServletRequest request) {
		List< User> list = (List<User>) repo.findAll();
		int id = Integer.parseInt(request.getParameter("id"));
		User user = repo.findById(id);
		ModelAndView modelAndView = new ModelAndView("Edit", "list", list);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	@RequestMapping("/Update")
	public ModelAndView updateCustomer(@ModelAttribute("users") User user) {
		
		
		repo.save(user);
		
		return new ModelAndView("redirect:/list");
	}
	
	@RequestMapping("/findbyid/{id}")
	public ModelAndView findById(@ModelAttribute("user") User user,@PathVariable int id) {
	
		List< User> list = (List<User>) repo.findAll();
		
		User us= repo.findById(id);
		
		ModelAndView modelAndView = new ModelAndView("listbyid", "listforid", list);
		modelAndView.addObject("userById", us);
		return modelAndView;
	}

	
	
}
