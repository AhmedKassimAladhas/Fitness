package com.aladhas.fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.aladhas.fitness.model.Employees;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.EmployeesServices;
import com.aladhas.fitness.services.UsersServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class EmployeesController {

	@Autowired
	private EmployeesServices empServices;
	
	@Autowired
	private UsersServices userServices;

	@GetMapping("/Employees")
	public ModelAndView Employees(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Employees e = new Employees();
		mv.addObject("emp", e);
		Users u = new Users();
		mv.addObject("user", u);
		List<Employees> allEmp = empServices.getAllEmp();
		mv.addObject("allEmp", allEmp);
		List<Users> allUsers = userServices.getAllUsers();
		mv.addObject("allUsers", allUsers);
		System.out.println("Ahmed");
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Employees");
		}
		return mv;
	}
	
	
	@PostMapping("/Employees")
	public String addNewEmp(@ModelAttribute("emp") Employees emp) {
		empServices.addEmp(emp);
		return "redirect:/Fitness/Employees";
	}
	
	@PutMapping("/Employees")
	public String updateEmployees(@RequestParam("id") Long iD,@RequestParam("Name") String name,@RequestParam("Job") String job,@RequestParam("Phone") String phone,@RequestParam("Salary") Double salary) {
		Employees emp = new Employees(iD, name, job, phone, salary);
		empServices.addEmp(emp);
		return "redirect:/Fitness/Employees";
	}
	
	@DeleteMapping("/Employees")
	public String deleteEmployees(@RequestParam("deid") Long id) {
		empServices.deletEmp(id);
		
		return "redirect:/Fitness/Employees";
	}
	
	@PostMapping("/Users")
	public String addNewUser(@RequestParam("Username") String username,@RequestParam("Password") String Password, @RequestParam("Grants") String Grants, @RequestParam("e") int e) {
		
		Users u = new Users();
		u.setUsername(username);
		u.setPassword(Password);
		u.setGrants(Grants);
		
		Employees em = empServices.getEmp((long) e);
		u.setE(em);
		userServices.addUser(u);
		
		return "redirect:/Fitness/Employees";
	}
	
	@PutMapping("/Users")
	public String editUser(@RequestParam("ID") Long iD,@RequestParam("Username") String username,@RequestParam("Password") String Password, @RequestParam("Grants") String Grants, @RequestParam("e") int e) {
		
		Users u = new Users();
		u.setID(iD);
		u.setUsername(username);
		u.setPassword(Password);
		u.setGrants(Grants);
		Employees em = empServices.getEmp((long) e);
		u.setE(em);
		userServices.addUser(u);
		
		return "redirect:/Fitness/Employees";
	}
	
	@DeleteMapping("/Users")
	public String deleteUser(@RequestParam("dUid") Long id) {
		
		userServices.deleteUser(id);
		
		return "redirect:/Fitness/Employees";
	}
}
