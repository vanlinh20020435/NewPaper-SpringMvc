package com.vanlinh.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.vanlinh.constant.SystemConstant;
import com.vanlinh.dto.MyUser;
import com.vanlinh.entity.RoleEntity;
import com.vanlinh.entity.UserEntity;
import com.vanlinh.entity.UserRoleEntity;
import com.vanlinh.repository.RoleRepository;
import com.vanlinh.repository.UserRepository;
import com.vanlinh.repository.UserRoleRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role: getRoles(userEntity)) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), 
							true, true, true, true, authorities);
		myUser.setFullName(userEntity.getFullName());
		return myUser;
	}
	
	public List<RoleEntity> getRoles(UserEntity user){
		List<RoleEntity> roles=new ArrayList<>();
		Long id=user.getId();
		List<UserRoleEntity> list=userRoleRepository.findAllByUser(user);
		for(UserRoleEntity ur:list) {
			RoleEntity role = roleRepository.findOne(ur.getRole().getId());
			roles.add(role);
		}
		return roles;
	}
}
