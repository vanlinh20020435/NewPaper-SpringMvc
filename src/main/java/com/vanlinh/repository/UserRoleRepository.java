package com.vanlinh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vanlinh.entity.UserEntity;
import com.vanlinh.entity.UserRoleEntity;

public interface UserRoleRepository extends JpaRepository<UserRoleEntity, Long> {
	List<UserRoleEntity> findAllByUser(UserEntity user);
}
