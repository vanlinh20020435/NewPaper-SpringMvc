package com.vanlinh.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.vanlinh.dto.CategoryDTO;
import com.vanlinh.service.ICategoryService;

@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {
	
	@Autowired
	private ICategoryService categoryService;
	
	@PostMapping("/api/category")
	public CategoryDTO createNew(@RequestBody CategoryDTO categoryDTO) {
		return categoryService.save(categoryDTO);
	}
	
	@PutMapping("/api/category")
	public CategoryDTO updateNew(@RequestBody CategoryDTO updateNew) {
		return categoryService.save(updateNew);
	}
	
	@DeleteMapping("/api/category")
	public void deleteNew(@RequestBody long[] ids) {
		categoryService.delete(ids);
	}
}