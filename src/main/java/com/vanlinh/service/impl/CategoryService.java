package com.vanlinh.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vanlinh.converter.NewConverter;
import com.vanlinh.dto.CategoryDTO;
import com.vanlinh.entity.CategoryEntity;
import com.vanlinh.repository.CategoryRepository;
import com.vanlinh.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private NewConverter newConverter;

	@Autowired
	private ModelMapper mapper;

	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item : entities) {
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

	@Override
	public List<CategoryDTO> getAll() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item : entities) {
			CategoryDTO categoryDTO = mapper.map(item, CategoryDTO.class);
			models.add(categoryDTO);
		}
		return models;
	}

	@Override
	public CategoryDTO findById(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return mapper.map(entity, CategoryDTO.class);
	}

	@Override
	@Transactional
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity category = mapper.map(dto, CategoryEntity.class);
		category = categoryRepository.save(category);
		return mapper.map(category, CategoryDTO.class);
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id : ids) {
			categoryRepository.delete(id);
		}
	}
}
