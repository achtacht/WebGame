package com.run.pjt.member.dao;

import com.run.pjt.member.Member;

public interface IMemDao {
	int memIns(Member mem);
	Member memSel(Member mem);
	int memDel(Member mem);
}
