package com.vanlinh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vanlinh.entity.RoleEntity;
import com.vanlinh.entity.UserEntity;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
	RoleEntity findOneByCode(String code);
}
