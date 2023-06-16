package com.david.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.david.savetravels.models.Travel;
import com.david.savetravels.repositories.TravelRepository;

@Service
public class TravelService {
	@Autowired
	private TravelRepository travelRepo;
	
//  Find All	
	public List<Travel> allTravels(){
		return travelRepo.findAll();
	}
	
//  Create
	public Travel createTravel(Travel newTravel) {
		return travelRepo.save(newTravel);
	}
	
//  Find One
	public Travel findTravel(Long id) {
		Optional<Travel> optionalTravel= travelRepo.findById(id);
		if(optionalTravel.isPresent()) {
			return optionalTravel.get();
			
		}else {
			return null;
		}
	}
	
//  Update
	public Travel updateTravel(Travel oneTravel) {
		return travelRepo.save(oneTravel);
	}
	
//	Delete
	public void removeTravel(long id) {
		travelRepo.deleteById(id);
		
	}
	  

}
