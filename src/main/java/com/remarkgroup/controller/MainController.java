package com.remarkgroup.controller;

import java.sql.Time;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.remarkgroup.model.User;
import com.remarkgroup.model.Visitor;
import com.remarkgroup.model.VisitorPojo;
import com.remarkgroup.repository.VisitorRepository;
import com.remarkgroup.service.UserService;
import com.remarkgroup.service.VisitorService;

@Controller
@RequestMapping(path = "/visit")
public class MainController {

	private static final String SETTINGS = "settings";

	private static final String VISITOR_LIST = "visitorList";

	private static final String VISITOR = "visitor";

	private static final String INDEX = "index";
	
	private static final int LIMIT_RESULTS_PER_PAGE = 3;
	
	private static final int LIMIT_PAGES = 2;

	@Autowired
	private VisitorRepository visitorRepository;

	@Autowired
	private VisitorService visitorService;

	@Autowired
	private UserService userService;

	@GetMapping
	public String home(HttpServletRequest request) {
		List<Visitor> visitors = visitorService.findTodayList();
		request.setAttribute("visitors", visitors.stream().collect(Collectors.toList()));
		request.setAttribute("visitorsCount", visitors.size());
		return INDEX;
	}

	@PostMapping("/search")
	public ResponseEntity<?> getVisitorList(HttpServletRequest request, @RequestBody Visitor visitor) {

		VisitorPojo result = new VisitorPojo();
		List<Visitor> visitors = visitorService.findAllByVisitorName(visitor.getVisitorName());

		if (visitors.isEmpty()) {
			result.setMessage("no user found!");
		} else {
			result.setMessage("success");
		}
		result.setResult(visitors);

		return ResponseEntity.ok(result);
	}

	@GetMapping("/new-visitor")
	public String newVisitor(HttpServletRequest request) {
		request.setAttribute("users", userService.findAll());
		return VISITOR;
	}

	@PostMapping(path = "/add")
	public String addNewVisitor(HttpServletRequest request, @ModelAttribute Visitor visitorForm,
			BindingResult resultsForm) {

		Visitor visitorSave = visitorService.findVisitor(visitorForm.getId());
		if (visitorSave == null)
			visitorSave = visitorForm;

		visitorSave.setVisitorName(visitorForm.getVisitorName());
		visitorSave.setHostName(visitorForm.getHostName());

		Time t = visitorForm.getTimeVisit();

		final int id = Integer.valueOf(request.getParameter("user"));
		final User user = userService.findUser(id);
		visitorSave.setUser(user);
		visitorSave.setHostName(user.getFullName());

		visitorRepository.save(visitorSave);
		request.setAttribute("users", userService.findAll());

		return VISITOR;
	}

	@GetMapping("/all-visitors")
	public String allVisitorsByPage(HttpServletRequest request, @PageableDefault(value = LIMIT_RESULTS_PER_PAGE) Pageable pageable) {
		
		Page<Visitor> visitors = visitorService.listAllByPage(pageable);
		
		int startpage = pageable.getPageNumber() + 1 - LIMIT_PAGES > 0 ? pageable.getPageNumber() - LIMIT_PAGES : 0;
	    int endpage = startpage + LIMIT_PAGES;
	    
	    request.setAttribute("startpage", startpage);
	    request.setAttribute("endpage", endpage);
	    request.setAttribute("page", visitors);
	    
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
		request.setAttribute("visitors", visitors.stream().collect(Collectors.toList()));
		return VISITOR_LIST;
	}

	@GetMapping("/settings")
	public String setttings(HttpServletRequest request) {
		return SETTINGS;
	}

}
