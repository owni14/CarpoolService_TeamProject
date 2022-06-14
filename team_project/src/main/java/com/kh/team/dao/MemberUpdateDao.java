package com.kh.team.dao;

import java.util.List;

import com.kh.team.vo.MemberUpdateVo;

public interface MemberUpdateDao {
	public boolean insertMemberUpdate (MemberUpdateVo memberUpdateVo);
	public List<MemberUpdateVo> memberUpdateList();
}
