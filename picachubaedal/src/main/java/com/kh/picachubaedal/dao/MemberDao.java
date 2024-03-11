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
                + "member_email, member_post, member_address1, member_address2, "
                + "member_grade, member_point, member_join, member_login) "
                + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] data = {memberDto.getMemberId(), memberDto.getMemberPw(),
                                memberDto.getMemberNick(), memberDto.getMemberContact(),
                                memberDto.getMemberEmail(), memberDto.getMemberPost(),
                                memberDto.getMemberAddress1(), memberDto.getMemberAddress2(), 
                                memberDto.getMemberGrade(), memberDto.getMemberPoint(),
                                memberDto.getMemberJoin(), memberDto.getMemberUpdate()};
        jdbcTemplate.update(sql, data);
    }
}