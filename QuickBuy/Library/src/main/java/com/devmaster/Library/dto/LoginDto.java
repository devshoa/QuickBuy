package com.devmaster.Library.dto;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginDto {
	@Size(min = 5, message = "Tên đăng nhập phải trên 5 ký tự")
	private String userName;

	@Size(min = 5, message = "Mật khẩu phải trên 5 ký tự")
	private String password;
}
