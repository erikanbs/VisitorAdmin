package com.remarkgroup.repository;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.remarkgroup.model.Visitor;

public interface VisitorRepository extends CrudRepository<Visitor, Serializable> {
	
	List<Visitor> findAllByOrderByDateVisitDesc();
	
	List<Visitor> findAllByHostName(String hostName);
	
	List<Visitor> findAllByVisitorName(String visitorName);
	
	@Query("select v from Visitor v where v.dateVisit = DATE(sysdate()) order by v.dateVisit desc")
	List<Visitor> findTodayList();
	
	

}
