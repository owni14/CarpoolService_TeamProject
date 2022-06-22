package com.kh.team.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.team.vo.EventParticipationVo;
import com.kh.team.vo.EventVo;
import com.kh.team.vo.EventWinnerVo;
import com.kh.team.vo.PagingDto;
@Repository
public class EventDaoImpl implements EventDao{
	private final String NAMESPACE="com.kh.team.mappers.event.";
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<EventVo> getEventList(PagingDto pagingDto) {
		List<EventVo> eventList=sqlSession.selectList(NAMESPACE+"getEventList",pagingDto);
		return eventList;
	}

	@Override
	public boolean insertEvent(EventVo eventVo) {
		int count=sqlSession.insert(NAMESPACE+"insertEvent",eventVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateEvent(EventVo eventVo) {
		int count=sqlSession.update(NAMESPACE+"updateEvent",eventVo);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteEvent(int event_seq) {
		int count=sqlSession.update(NAMESPACE+"deleteEvent",event_seq);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<EventVo> isEndEventList(String event_is_finish) {
		List<EventVo> eventList=sqlSession.selectList(NAMESPACE+"isEndEventList",event_is_finish);
		return eventList;
	}

	@Override
	public EventVo getEventByEseq(int event_seq) {
		EventVo eventVo=sqlSession.selectOne(NAMESPACE+"getEventByEseq",event_seq);
		return eventVo;
	}

	@Override
	public int getCountMainEvent() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "getCountMainEvent"); 
		return count;
	}
	
	@Override
	public int getCountFinishEvent() {
		int count = (int)sqlSession.selectOne(NAMESPACE + "getCountFinishEvent"); 
		return count;
	}

	@Override
	public List<EventVo> getEventMainList(PagingDto pagingDto) {
		List<EventVo> eventList = sqlSession.selectList(NAMESPACE + "getEventMainList", pagingDto);
		return eventList;
	}
	
	@Override
	public List<EventVo> getEventFinishList(PagingDto pagingDto) {
		List<EventVo> eventList = sqlSession.selectList(NAMESPACE + "getEventFinishList", pagingDto);
		return eventList;
	}

	@Override
	public void updateEventFinish(int event_seq) {
		sqlSession.update(NAMESPACE+"updateEventFinish",event_seq);
	}

	@Override
	public String getContent(int event_seq) {
		String event_content = sqlSession.selectOne(NAMESPACE+"getContent",event_seq );
		return event_content;
	}
	
	@Override
	public boolean checkWinner(String m_id, int event_seq) {
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("event_seq", event_seq);
		int count = sqlSession.selectOne(NAMESPACE + "checkWinner", parameter);
		System.out.println("count: " + count);
		if (count > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public int couponPrice(int event_seq) {
		int couponPrice = sqlSession.selectOne(NAMESPACE + "couponPrice", event_seq);
		return couponPrice;
	}
	
	@Override
	public int getEventPoint(int event_seq) {
		int eventPoint = sqlSession.selectOne(NAMESPACE + "getEventPoint", event_seq);
		return eventPoint;
	}
	
	@Override
	public String checkGoods(String m_id, int event_seq) {
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("event_seq", event_seq);
		String result = sqlSession.selectOne(NAMESPACE + "checkGoods", parameter);
		return result;
	}
	
	@Override
	public void sendGoods(String m_id, int event_seq) {
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("event_seq", event_seq);
		sqlSession.update(NAMESPACE + "sendGoods", parameter);
	}
	
//event participation
	@Override
	public void createTableEvnet(int event_seq) {
		Map<String,String> sqlMap=new HashMap<>();
		String createTableStr="create table event_participation_event_seq"+event_seq+"(" + 
				"	ep_seq	number	primary key," + 
				"	m_id varchar2(50)	references  member(m_id)," + 
				"	event_seq	number	references  event(event_seq)," + 
				"	ep_is_winner	char(1)	default 'N'" + ")";
		sqlMap.put("createTableStr", createTableStr);
		sqlSession.update(NAMESPACE+"createTableEvnet",sqlMap);
		
	}

	@Override
	public void createSeqParticipation(int event_seq) {
		Map<String,String> sqlMap=new HashMap<>();
		String createSeqStr="create sequence seq_event_participation"+event_seq;
		sqlMap.put("createSeqStr", createSeqStr);
		sqlSession.update(NAMESPACE+"createSeqParticipation",sqlMap);
	}

	@Override
	public boolean insertParticipation(String m_id,int event_seq) {
		Map<String,Object> sqlMap=new HashMap<>();
		sqlMap.put("m_id",m_id);
		sqlMap.put("event_seq", event_seq);
		int count=sqlSession.insert(NAMESPACE+"insertParticipation", sqlMap);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean updateParticipation(String m_id,int event_seq) {
		Map<String,Object> sqlMap=new HashMap<>();
		sqlMap.put("m_id",m_id);
		sqlMap.put("event_seq", event_seq);
		int count=sqlSession.update(NAMESPACE+"updateParticipation",sqlMap);
		if(count>0) {
			return true;
		}
		return false;
	}

	@Override
	public List<EventParticipationVo> getListParticipationByEventSeq(int event_seq) {
		Map<String,Object> sqlMap=new HashMap<>();
		//넘길때 겟터가 있는 걸 넘겨야함
		sqlMap.put("event_seq",event_seq);
		List<EventParticipationVo> participationList=sqlSession.selectList(NAMESPACE+"getListParticipationByEventSeq",sqlMap);
		return participationList;
	}

	@Override
	public int getMaxNoFinishEventSeq() {
		int max_seq=sqlSession.selectOne(NAMESPACE+"getMaxNoFinishEventSeq");
		return max_seq;
	}

	@Override
	public List<Map<String, Object>> getJoinEventData(int event_seq) {
		Map<String,Object> sqlMap=new HashMap<>();
		sqlMap.put("event_seq",event_seq);
		return sqlSession.selectList(NAMESPACE+"getJoinEventData", sqlMap);
	}

	@Override
	public List<Integer> selectAllEventList() {
		return sqlSession.selectList(NAMESPACE+"selectAllEventList");
	}

	@Override
	public List<EventVo> selectEndEventList() {
		return sqlSession.selectList(NAMESPACE+"selectEndEventList");
	}

	@Override
	public List<Integer> selectLiveEventList() {
		return sqlSession.selectList(NAMESPACE+"selectLiveEventList");
	}

	@Override
	public int selectEventMaxCount(int event_seq) {
		return sqlSession.selectOne(NAMESPACE+"selectEventMaxCount",event_seq);
	}

	@Override
	public boolean updateIsLot(int event_seq) {
		int count=sqlSession.update(NAMESPACE+"updateIsLot",event_seq);
		if(count>0) {
			return true;
		}
		return false ;
	}
	@Override
	public boolean updateEventWinnerToParticipation(int event_seq, String m_id) {
		Map<String, Object> parameter =new HashMap<>();
		parameter.put("event_seq", event_seq);
		parameter.put("m_id", m_id);
		int count=sqlSession.update(NAMESPACE+"updateEventWinnerToParticipation", parameter);
		if(count>0) {
			return true;
		}
		return false;
	}
	@Override
	public boolean updateEventWinnerPoint(String m_id, String pc_code) {
		Map<String, Object> parameter =new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("pc_code", pc_code);
		int count=sqlSession.update(NAMESPACE+"updateEventWinnerPoint", parameter);
		if(count>0) {
			return true;
		}
		return false;
	}
	@Override
	public boolean insertEventWinnerPointHistory(String m_id, String pc_code) {
		Map<String, Object> parameter =new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("pc_code", pc_code);
		int count=sqlSession.insert(NAMESPACE+"insertEventWinnerPointHistory",parameter);
		if(count>0) {
			return true;
		}
		return false;
	}
	@Override
	public boolean insertEventWinnerTable(String m_id, int event_seq) {
		Map<String, Object> parameter =new HashMap<>();
		parameter.put("m_id", m_id);
		parameter.put("event_seq", event_seq);
		int count=sqlSession.insert(NAMESPACE+"insertEventWinnerTable",parameter);
		if(count>0) {
			return true;
		}
		return false;
	}
	@Override
	public List<EventWinnerVo> selectWinnerIsGet(int event_seq) {
		return sqlSession.selectList(NAMESPACE+"selectWinnerIsGet",event_seq);
	}

	@Override
	public int selectCountWinnerNoGet() {

		return sqlSession.selectOne(NAMESPACE+"selectCountWinnerNoGet");
	}


	@Override
	public List<EventVo> selectEventTopThree() {
		return sqlSession.selectList(NAMESPACE+"selectEventTopThree");
	}

	@Override
	public String getEvent_img(int event_seq) {
		return sqlSession.selectOne(NAMESPACE+"getEvent_img",event_seq);
	}
	

}
