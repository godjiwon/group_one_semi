package com.kh.picachubaedal.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.mapper.MemberMapper;

@Repository
public class MemberDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private MemberMapper memberMapper;
    
    //가입 (등록)
    public void insert(MemberDto memberDto) {
        String sql = "insert into member("
                + "member_id, member_pw, member_nick, member_contact, "
                + "member_email, member_post, member_address1, member_address2) "
                + "values(?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] data = {memberDto.getMemberId(), memberDto.getMemberPw(),
                                memberDto.getMemberNick(), memberDto.getMemberContact(),
                                memberDto.getMemberEmail(), memberDto.getMemberPost(),
                                memberDto.getMemberAddress1(), memberDto.getMemberAddress2()};
        jdbcTemplate.update(sql, data);
    }

    //member_attach에 첨부파일연결
	public void connect(String memberId, int attachNo) {
		String sql = "insert into member_attach(member_id, attach_no) " + "values(?, ?)";
		Object[] data = {memberId, attachNo};
		jdbcTemplate.update(sql, data);
		
	}

	public int findAttachNo(String memberId) {
		String sql = "select attach_no from member_attach where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
}