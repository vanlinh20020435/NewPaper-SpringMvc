package com.vanlinh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vanlinh.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUserNameAndStatus(String name, int status);
}
