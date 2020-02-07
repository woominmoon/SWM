package LYH.Member;

import java.io.Serializable;

public class MemberDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String c_member_id;
	private String c_member_password;
	private String c_member_name;
	private String c_member_birth;
	private String c_member_gender;
	private int c_member_admin;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String c_member_id, String c_member_password, String c_member_name, String c_member_birth,
			String c_member_gender, int c_member_admin) {
		super();
		this.c_member_id = c_member_id;
		this.c_member_password = c_member_password;
		this.c_member_name = c_member_name;
		this.c_member_birth = c_member_birth;
		this.c_member_gender = c_member_gender;
		this.c_member_admin = c_member_admin;
	}

	public String getC_member_id() {
		return c_member_id;
	}

	public void setC_member_id(String c_member_id) {
		this.c_member_id = c_member_id;
	}

	public String getC_member_password() {
		return c_member_password;
	}

	public void setC_member_password(String c_member_password) {
		this.c_member_password = c_member_password;
	}

	public String getC_member_name() {
		return c_member_name;
	}

	public void setC_member_name(String c_member_name) {
		this.c_member_name = c_member_name;
	}

	public String getC_member_birth() {
		return c_member_birth;
	}

	public void setC_member_birth(String c_member_birth) {
		this.c_member_birth = c_member_birth;
	}

	public String getC_member_gender() {
		return c_member_gender;
	}

	public void setC_member_gender(String c_member_gender) {
		this.c_member_gender = c_member_gender;
	}

	public int getC_member_admin() {
		return c_member_admin;
	}

	public void setC_member_admin(int c_member_admin) {
		this.c_member_admin = c_member_admin;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((c_member_id == null) ? 0 : c_member_id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		if (c_member_id == null) {
			if (other.c_member_id != null)
				return false;
		} else if (!c_member_id.equals(other.c_member_id))
			return false;
		return true;
	}
	
}
