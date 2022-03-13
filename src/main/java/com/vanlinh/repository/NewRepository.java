package com.vanlinh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vanlinh.entity.NewEntity;
import com.vanlinh.entity.UserEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long>{
	
}
