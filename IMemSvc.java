package com.run.pjt.member.service;

import com.run.pjt.member.Member;

public interface IMemSvc {
		int memReg(Member mem);
		Member memSrch(Member mem);
		int memRmv(Member mem);
}
