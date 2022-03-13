package com.vanlinh.service;

import java.util.List;
import java.util.Map;

import com.vanlinh.dto.CategoryDTO;
import com.vanlinh.dto.NewDTO;

public interface ICategoryService {
	Map<String, String> findAll();
	List<CategoryDTO> getAll();
	CategoryDTO findById(long id);
	CategoryDTO save(CategoryDTO dto);
	void delete(long[] ids);
}
