package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.mapper.StoreMapper;
import com.kh.picachubaedal.vo.PageVO;

@Repository
public class StoreDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private StoreMapper storeMapper;

    public void insert(StoreDto storeDto) {
        String sql = "INSERT INTO store (" +
                    "store_name, store_post, store_address1, store_address2, store_category, "
                    + "store_type, store_contact, store_intro, store_dtip, store_minprice, "
                    + "store_open_hour, store_close_hour, store_delivery, store_closed, "
                    + "store_time, store_business_number, member_no" +
                    ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE , ?, ?)";
        
        Object[] data = {
            storeDto.getStoreName(),
            storeDto.getStorePost(),
            storeDto.getStoreAddress1(),
            storeDto.getStoreAddress2(),
            storeDto.getStoreCategory(),
            storeDto.getStoreType(),
            storeDto.getStoreContact(),
            storeDto.getStoreIntro(),
            storeDto.getStoreDtip(),
            storeDto.getStoreMinprice(),
            storeDto.getStoreOpenHour(),
            storeDto.getStoreCloseHour(),
            storeDto.getStoreDelivery(),
            storeDto.getStoreClosed(),
            storeDto.getStoreTime(),
            storeDto.getStoreBusinessNumber(),
            storeDto.getMemberNo()
        };
        
        jdbcTemplate.update(sql, data);
    }




 // 수정 (가게 수정)
    public boolean update(StoreDto storeDto) {
        String sql = "UPDATE store SET store_name=?, store_post=?, store_address1=?, store_address2=?, "
        		+ "store_category=?, store_type=?, store_contact=?, store_intro=?, "
        		+ "store_dtip=?, store_minprice=?, store_open_hour=?, store_close_hour=?, "
        		+ "store_delivery=?, store_closed=?, store_update=?, store_business_number=?" +
                "WHERE store_no=?";

        Object[] data = {
        		storeDto.getStoreName(),
                storeDto.getStorePost(),
                storeDto.getStoreAddress1(),
                storeDto.getStoreAddress2(),
                storeDto.getStoreCategory(),
                storeDto.getStoreType(),
                storeDto.getStoreContact(),
                storeDto.getStoreIntro(),
                storeDto.getStoreDtip(),
                storeDto.getStoreMinprice(),
                storeDto.getStoreOpenHour(),
                storeDto.getStoreCloseHour(),
                storeDto.getStoreDelivery(),
                storeDto.getStoreClosed(),
                storeDto.getStoreUpdate(),
                storeDto.getStoreBusinessNumber(),
                storeDto.getStoreNo()
        };

        return jdbcTemplate.update(sql, data) > 0;
    }


    // 삭제 (가게 삭제)
    public boolean delete(int storeNo) {
        // 쿼리문 상수화
        final String DELETE_SQL = "DELETE FROM store WHERE store_no = ?";
        try {
            return jdbcTemplate.update(DELETE_SQL, storeNo) > 0;
        } catch (DataAccessException e) {
            // 예외 처리
            e.printStackTrace();
            // 필요한 예외 처리 로직 추가
            return false;
        }
    }

    // 나머지 메서드들은 변경할 필요가 없습니다.



	// 목록, 검색
	public List<StoreDto> selectList() {
		String sql = "select * from store order by store_no asc";
		return jdbcTemplate.query(sql, storeMapper);
	}

	public List<StoreDto> selectList(String column, String keyword) {
		String sql = "select * from store " + "where instr(upper(" + column + "), upper(?)) > 0 " + "order by " + column
				+ " asc, store_no asc";
		Object[] data = {keyword};
		return jdbcTemplate.query(sql, storeMapper, data);
	}
	public StoreDto selectOne(int storeNo) {
	    String sql = "select * from store where store_no = ?";
	    Object[] data = { storeNo };
	    List<StoreDto> list = jdbcTemplate.query(sql, storeMapper, data);
	    return list.isEmpty() ? null : list.get(0);
	}
	
	//페이징을 위한 목록/검색/카운트 구현
		public List<StoreDto> selectListByPaging(PageVO pageVO) {
			if(pageVO.isSearch()) {
				String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select * from store "
//										+ "where instr("+column+", ?) > 0 "//대소문자 구별
										+ "where instr(upper("+pageVO.getColumn()+"), upper(?)) > 0 "//대소문자 무시
										+ "order by "+pageVO.getColumn()+" asc, store_no asc"
									+ ")TMP"
								+ ") where rn between ? and ?";
				Object[] data = {
					pageVO.getKeyword(), 
					pageVO.getBeginRow(), 
					pageVO.getEndRow()
				};
				return jdbcTemplate.query(sql, storeMapper, data);
			}
			else {
				String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select * from store order by store_no asc"
									+ ")TMP"
								+ ") where rn between ? and ?";
				Object[] data = {pageVO.getBeginRow(), pageVO.getEndRow()};
				return jdbcTemplate.query(sql, storeMapper, data);
			}
		}
		public int count(PageVO pageVO) {
			if(pageVO.isSearch()) {
				String sql = "select count(*) from store "
						+ "where instr("+pageVO.getColumn()+", ?) > 0";
				Object[] data = {pageVO.getKeyword()};
				return jdbcTemplate.queryForObject(sql, int.class, data);
			}
			else {
				String sql = "select count(*) from store";
				return jdbcTemplate.queryForObject(sql, int.class);
			}
		}
		
	
}
