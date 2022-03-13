package com.vanlinh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vanlinh.entity.CategoryEntity;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {
	CategoryEntity findOneByCode(String code);
}
