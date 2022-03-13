package com.vanlinh.dto;

public class UserRoleDTO {
	private Long user;
	private Long role;

	public UserRoleDTO(Long user, Long role) {
		super();
		this.user = user;
		this.role = role;
	}

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

}
