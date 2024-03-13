package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.PointDto;
import com.kh.picachubaedal.mapper.PointMapper;

@Repository
public class PointDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PointMapper pointMapper;
	
	//충전상품 시퀀스번호
	public int getPointSequence() {
		String sql = "select point_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//충전상품 등록 -> 있어야하나? (보류)
	public void insert(PointDto pointDto) {
		String sql = "insert into point("
						+ "point_no, point_name, point_price, point_charge) "
					+ "values(?, ?, ?, ?)";
		Object[] data = {pointDto.getPointNo(), pointDto.getPointName(),
								pointDto.getPointPrice(), pointDto.getPointCharge()};
		jdbcTemplate.update(sql, data);
	}
	
	//연결
	public void connect(int pointNo, int attachNo) {
		String sql = "insert into point_attach(point_no, attach_no) values(?, ?)";
		Object[] data = {pointNo, attachNo};
		jdbcTemplate.update(sql, data);
	}
	
	//충전상품 목록
	public List<PointDto> selectList(){
		String sql = "select * from point order by point_price asc";
		return jdbcTemplate.query(sql, pointMapper);
	}
	//상세
	public PointDto selectOne(int pointNo) {
		String sql = "select * from point where point_no = ?";
		Object[] data = {pointNo};
		List<PointDto> list = jdbcTemplate.query(sql, pointMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	//사진 아이템번호로 찾기
	public int findAttcahNo(int pointNo) {
		String sql = "select attach_no from point_attach where point_no=?";
		Object[] data = {pointNo};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//보류
	public boolean chargePoints(String memberId, int point) {
        String sql = "UPDATE member SET member_point = member_point + ? WHERE member_id = ?";
        int rowsAffected = jdbcTemplate.update(sql, point, memberId);
        return rowsAffected > 0;
    }
	
	//삭제
	public boolean delete(int pointNo) {
		String sql = "delete point where point_no=?";
		Object[] data = {pointNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//수정
	public boolean update(PointDto pointDto) {
		String sql = "update point set "
					+ "point_name=?, point_price=?, point_charge=? "
				+ "where point_no=?";
		Object[] data = {
				pointDto.getPointName(), pointDto.getPointPrice(),
				pointDto.getPointCharge(), pointDto.getPointNo()
		};
		return jdbcTemplate.update(sql, data) > 0;
	}
}
