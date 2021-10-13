package com.run.pjt.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.run.pjt.member.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemDao implements IMemDao {
	
	private ComboPooledDataSource dataSource;
	
	private JdbcTemplate template;

	@Autowired
	public MemDao(ComboPooledDataSource dataSource) {
		template = new JdbcTemplate(dataSource);
	};

	@Override
	public int memIns(Member mem)  {
		String sql = "insert into mem (memId, memPw, memMail) values (?,?,?)";

		int result = 0;
		try {
			result = template.update(sql, mem.getMemId(), mem.getMemPw(), mem.getMemMail());
		      
			
		}catch (DataAccessException e){
			e.printStackTrace();
		}
		
	    return result;
	};

	@Override
	public Member memSel(Member mem) {
		// TODO Auto-generated method stub
		String sql = "select * from mem where memId = ? and memPw = ?";
		List<Member> mems = null;
	
		try {
		mems = template.query(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setString(1, mem.getMemId());
				ps.setString(2, mem.getMemPw());
			}
		}, new RowMapper<Member>() {

			@Override
			public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				Member mem = new Member();
				mem.setMemId(rs.getString("memId"));
				mem.setMemPw(rs.getString("memPw"));
				mem.setMemMail(rs.getString("memMail"));
				return mem;
			}
		});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		if (mems.isEmpty())
			return null;
		return mems.get(0);
	}

	@Override
	public int memDel(Member mem) {
		// TODO Auto-generated method stub
		String sql = "delete mem where memId = ? and memPw = ?";

		int result = 0;
		try {
			result = template.update(sql, mem.getMemId(), mem.getMemPw());
		}catch (DataAccessException e){
			e.printStackTrace();
		}
		
	    return result;
	};

}
