package LYH.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import LYH.PageTO;

public class MemberDAO {
	private DataSource dataFactory;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public PageTO list(int curPage) {
		PageTO to = new PageTO(curPage);
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from(select rownum rnum, c_member_id, c_member_password, c_member_name, c_member_birth, c_member_gender from (select * from tbl_member order by rownum desc)) where rnum between ? and ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			int amount = getAmount(conn);
			to.setAmount(amount);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, to.getStarNum());
			pstmt.setInt(2, to.getEndNum());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String c_member_id = rs.getString("c_member_id");
				String c_member_password = rs.getString("c_member_password");
				String c_member_name = rs.getString("c_member_name");
				String c_member_birth = rs.getString("c_member_birth");
				String c_member_gender = rs.getString("c_member_gender");
				list.add(new MemberDTO(c_member_id, c_member_password, c_member_name, c_member_birth, c_member_gender,
						0));
			}
			to.setMlist(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return to;
	}

	private int getAmount(Connection conn) {
		int amount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(c_member_id) from tbl_member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				amount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, null);
		}
		return amount;
	}

	public Boolean idcheck(String id) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select c_member_id from tbl_member where c_member_id = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next())
				result = true; // 중복됨

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}

		return result;
	}

	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into tbl_member values(?, ?, ?, ?, ?, ?)";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getC_member_id());
			pstmt.setString(2, dto.getC_member_password());
			pstmt.setString(3, dto.getC_member_name());
			pstmt.setString(4, dto.getC_member_birth());
			pstmt.setString(5, dto.getC_member_gender());
			pstmt.setInt(6, dto.getC_member_admin());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			closeAll(null, pstmt, conn);
		}
	}

	public MemberDTO login(String c_member_id, String c_member_password) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tbl_member where c_member_id = ? and c_member_password = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_member_id);
			pstmt.setString(2, c_member_password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String c_member_name = rs.getString("c_member_name");
				String c_member_birth = rs.getString("c_member_birth");
				String c_member_gender = rs.getString("c_member_gender");
				int c_member_admin = rs.getInt("c_member_admin");
				dto = new MemberDTO(c_member_id, c_member_password, c_member_name, c_member_birth, c_member_gender,
						c_member_admin);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

	public void delete(String c_member_id, String c_member_pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from tbl_member where c_member_id = ? and c_member_password = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_member_id);
			pstmt.setString(2, c_member_pw);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public MemberDTO updateui(String c_member_id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from tbl_member where c_member_id = ?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_member_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String c_member_password = rs.getString("c_member_password");
				String c_member_name = rs.getString("c_member_name");
				String c_member_birth = rs.getString("c_member_birth");
				String c_member_gender = rs.getString("c_member_gender");
				dto = new MemberDTO(c_member_id, c_member_password, c_member_name, c_member_birth, c_member_gender, 0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}

	public void update(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update tbl_member set c_member_password=?, c_member_name=?, c_member_birth=?, c_member_gender=? where c_member_id=?";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getC_member_password());
			pstmt.setString(2, dto.getC_member_name());
			pstmt.setString(3, dto.getC_member_birth());
			pstmt.setString(4, dto.getC_member_gender());
			pstmt.setString(5, dto.getC_member_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	

	
	
	
	
}
