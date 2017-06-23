package com.remarkgroup.controller;



import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remarkgroup.model.Visitor;
import com.remarkgroup.repository.UserRepository;
import com.remarkgroup.repository.VisitorRepository;
import com.remarkgroup.service.UserService;
import com.remarkgroup.service.VisitorService;

@Controller
@RequestMapping(path="/visit")
public class MainController {
	
	private static final String VISITOR_LIST = "visitorList";

	private static final String VISITOR = "visitor";

	private static final String INDEX = "index";

	@Autowired
	private VisitorRepository visitorRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private VisitorService visitorService;
	
	@Autowired
	private UserService employeeService;

	@GetMapping
	public String home(HttpServletRequest request) {
		//List<Visitor> visitors = visitorService.findTodayList();
		//request.setAttribute("visitors", visitors.stream().collect(Collectors.toList()));
		return INDEX;
	}

	@GetMapping("/new-visitor")
	public String newVisitor(HttpServletRequest request){
		request.setAttribute("employees", employeeService.findAll());
		return VISITOR;
	}

	@PostMapping(path="/add")
	public String addNewVisitor(HttpServletRequest request, @ModelAttribute Visitor visitorForm, BindingResult resultsForm ) {
		
		Visitor visitorSave = visitorService.findVisitor(visitorForm.getId());
		if (visitorSave == null)
			visitorSave = visitorForm;
		
		visitorSave.setVisitorName(visitorForm.getVisitorName());
		visitorSave.setHostName(visitorForm.getHostName());
		visitorRepository.save(visitorSave);
		
		return VISITOR;		
	}
	
	@GetMapping("/all-visitors")
	public String allVisitors(HttpServletRequest request){		
		List<Visitor> visitors = visitorService.findAllOrderByDateDesc();				
		request.setAttribute("visitors", visitors.stream().collect(Collectors.toList()));
				
		return VISITOR_LIST;		
	}
	
	@GetMapping("/update-visitor")
	public String updateVisitor(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("visitor", visitorService.findVisitor(id));
		return VISITOR;

	}

	@GetMapping("/delete-visitor")
	public String deleteVisitor(@RequestParam int id, HttpServletRequest request) {
		visitorService.deleteVisitor(id);
		List<Visitor> visitors = visitorService.findAll();
		request.setAttribute("visitors",
				visitors.stream().collect(Collectors.toList()));
		return VISITOR_LIST;
	}

}
