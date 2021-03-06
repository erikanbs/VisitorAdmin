package com.remarkgroup.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.remarkgroup.model.Visitor;
import com.remarkgroup.repository.VisitorRepository;

@Service
@Transactional
public class VisitorService {

	private final VisitorRepository visitorRepository;

	public VisitorService(VisitorRepository visitorRepository) {
		this.visitorRepository = visitorRepository;
	}

	public List<Visitor> findAll() {
		List<Visitor> visitors = new ArrayList<>();
		for (Visitor visitor : visitorRepository.findAll()) {
			visitors.add(visitor);
		}
		return visitors;
	}
	
	public Page<Visitor> listAllByPage(Pageable pageable) {
		return visitorRepository.findAll(pageable);
	}

	public List<Visitor> findAllByHostName(String hostName) {
		return visitorRepository.findAllByHostName(hostName);
	}

	public List<Visitor> findAllByVisitorName(String visitorName) {
		return visitorRepository.findAllByVisitorName(visitorName);
	}

	public List<Visitor> findAllOrderByDateDesc() {
		return visitorRepository.findAllByOrderByDateVisitDesc();
	}

	public List<Visitor> findTodayList() {
		return visitorRepository.findTodayList();
	}

	public Visitor findVisitor(int id) {
		return visitorRepository.findOne(id);
	}

	public void save(Visitor visitor) {
		visitorRepository.save(visitor);
	}

	public void deleteVisitor(int i) {
		Visitor e = visitorRepository.findOne(i);
		visitorRepository.delete(e);
	}

}
