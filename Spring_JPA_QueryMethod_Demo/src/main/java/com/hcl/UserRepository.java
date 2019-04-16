package com.hcl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {

	 User findById(int id);
	 Page<User> findAll(Pageable pageable);
	
}
