package com.run.pjt.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.run.pjt.member.Member;
import com.run.pjt.member.dao.MemDao;

@Service
public class MemSvc implements IMemSvc{
	
	@Autowired
	MemDao dao;

	@Override
	public int memReg(Member mem) {
		// TODO Auto-generated method stub
		return dao.memIns(mem);
	}	

	@Override
	public Member memSrch(Member mem) {
		// TODO Auto-generated method stub
		return dao.memSel(mem);
	}

	@Override
	public int memRmv(Member mem) {
		// TODO Auto-generated method stub
		return dao.memDel(mem);
	}
	
	
	
}
