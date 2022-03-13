package com.vanlinh.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.vanlinh.constant.SystemConstant;
import com.vanlinh.dto.UserDTO;
import com.vanlinh.entity.RoleEntity;
import com.vanlinh.entity.UserEntity;
import com.vanlinh.entity.UserRoleEntity;
import com.vanlinh.repository.RoleRepository;
import com.vanlinh.repository.UserRepository;
import com.vanlinh.repository.UserRoleRepository;
import com.vanlinh.service.IUserService;

@Service
public class UserService implements IUserService {
	@Autowired
	private ModelMapper mapper;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRoleRepository userRoleRepository;

	@Override
	public UserDTO save(UserDTO dto) {
		UserEntity user = userRepository.findOneByUserNameAndStatus(dto.getUserName(), SystemConstant.ACTIVE_STATUS);
		if (user == null) {
			dto.setStatus(SystemConstant.ACTIVE_STATUS);
			dto.setPassword(new BCryptPasswordEncoder().encode(dto.getPassword()));
			user = mapper.map(dto, UserEntity.class);
			user = userRepository.save(user);
			userRoleRepository.save(getUserRole(user));
		}
		return mapper.map(user, UserDTO.class);
	}
	
	public UserRoleEntity getUserRole(UserEntity user) {
		UserRoleEntity ur =new UserRoleEntity();
		RoleEntity role= roleRepository.findOneByCode("USER");
		ur.setUser(user);
		ur.setRole(role);
		return ur;
	}

}
