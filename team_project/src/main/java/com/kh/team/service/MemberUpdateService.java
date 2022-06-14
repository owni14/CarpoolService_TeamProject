package com.kh.team.service;

import java.util.List;

import com.kh.team.vo.MemberUpdateVo;

public interface MemberUpdateService {
	public boolean insertMemberUpdate (MemberUpdateVo memberUpdateVo);
	public List<MemberUpdateVo> memberUpdateList();
}
