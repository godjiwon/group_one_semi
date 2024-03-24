package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.mapper.MemberMapper;
///
import com.kh.picachubaedal.mapper.StoreMapper;

@Repository
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private MemberMapper mapper;
	//@Autowired
	//private StatMapper statMapper;
@Autowired
private StoreMapper storeMapper;
	 //가입 (등록)/
	public void insert(MemberDto memberDto) {
        String sql = "insert into member("
                + "member_no,member_id, member_pw, member_nick, member_contact, "
                + "member_email, member_post, member_address1, member_address2,member_grade) "
                + "values(member_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?,?)";
        Object[] data = {memberDto.getMemberId(), memberDto.getMemberPw(),
                                memberDto.getMemberNick(), memberDto.getMemberContact(),
                                memberDto.getMemberEmail(), memberDto.getMemberPost(),
                                memberDto.getMemberAddress1(), memberDto.getMemberAddress2(),
                                memberDto.getMemberGrade()};
        jdbcTemplate.update(sql, data);
    }
	

	//목록(조회, Read)
	public List<MemberDto> selectList() {
		String sql = "select * from member order by member_id asc";
		//Object[] data = {};
		return jdbcTemplate.query(sql, mapper);
	}
	//검색(조회, Read)
	public List<MemberDto> selectList(String column, String keyword) {
		String sql = "select * from member where instr("+column+", ?) > 0 "
										+ "order by "+column+" asc, member_id asc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, mapper, data);
	}

	//상세(조회, Read)
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, data);
		return list.isEmpty() ? null : list.get(0);
	}


	//비밀번호 변경(수정, Update)
	public boolean updateMemberPw(MemberDto dto) {
		String sql = "update member set member_pw=? where member_id=?";
		Object[] data = {dto.getMemberPw(), dto.getMemberId()};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//회원탈퇴(삭제, Delete)
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//최종로그인시각 변경(수정, Update)
	public boolean updateMemberLogin(String memberId) {
		String sql = "update member "
						+ "set member_update=sysdate "

						+ "where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	//회원이 자신의 정보를 변경(수정, Update)
	public boolean updateMember(MemberDto memberDto) {
		String sql = "update member set "
							+ "member_nick=?, member_email=?, "
							+ "member_contact=?, member_post=?, "
							+ "member_address1=?, member_address2=? "
						+ "where member_id = ?";
		Object[] data = {
			memberDto.getMemberNick(), memberDto.getMemberEmail(),
		    memberDto.getMemberContact(),
			memberDto.getMemberPost(), memberDto.getMemberAddress1(),
			memberDto.getMemberAddress2(), memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
	

	
	//프로필 이미지 연결
	public void connect(String memberId, int attachNo) {
		String sql = "insert into member_attach(member_id, attach_no) "
						+ "values(?, ?)";
		Object[] data = {memberId, attachNo};
		jdbcTemplate.update(sql, data);
	}
	


	public int findAttachNo(String memberId) {
		String sql = "select attach_no from member_attach where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//포인트 충전/차감
	public boolean plusMemberPoint(String memberId, int point) {
		String sql = "update member "
						+ "set member_point = member_point + ? "
						+ "where member_id = ?";
		Object[] data = {point, memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}
	public boolean minusMemberPoint(String memberId, int point) {
		String sql = "update member "
						+ "set member_point = member_point - ? "
						+ "where member_id = ?";
		Object[] data = {point, memberId};
		return jdbcTemplate.update(sql, data) > 0;
	}

	
	public MemberDto selectOneByMemberNick(String memberNick) {
		String sql = "select * from member where member_nick = ?";
		Object[] data = {memberNick};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//아이디 찾기
	public String findMemberIdByNick(String memberNick) {
        String sql = "SELECT member_id FROM member WHERE member_nick = ?";
        try {
            return jdbcTemplate.queryForObject(sql, String.class, memberNick);
        } catch (EmptyResultDataAccessException e) { //임폴트해주기
            return null; // 해당하는 닉네임의 회원이 없을 경우 null 반환
        }
    }
	
	public String findNick(String reviewBoardWriter) {
		String sql = "select member_nick from member where member_id = ?";
		Object[] data = {reviewBoardWriter};
		return jdbcTemplate.queryForObject(sql, String.class, data);

	}
	

	//좋아요 가게리스트 불러오기
	public List<StoreDto> selectLikeStore(String memberId){
		 String sql = "SELECT * FROM store WHERE store_no IN (SELECT store_no FROM store_like WHERE member_id = ?)";
		 Object[] data = {memberId};
	         List<StoreDto> list = jdbcTemplate.query(sql,storeMapper,data);
	         return list;
	}

	
	public String getMemberGradeByMemberNo(int memberNo) {
	    String sql = "SELECT member_grade FROM member WHERE member_no = ?";
	    try {
	        return jdbcTemplate.queryForObject(sql, String.class, memberNo);
	    } catch (EmptyResultDataAccessException e) {
	        e.printStackTrace();
	        return "일반회원";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}

	
	

}
   


 