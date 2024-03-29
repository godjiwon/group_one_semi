package com.kh.picachubaedal.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.picachubaedal.dto.MenuDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.mapper.MenuMapper;
import com.kh.picachubaedal.mapper.StoreMapper;
import com.kh.picachubaedal.vo.PageVO;

@Repository
public class MenuDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
    private StoreMapper storeMapper;
	
	//등록
	public void insert(MenuDto menuDto) {
		String sql = "insert into menu(menu_no, store_no, menu_category, menu_name, menu_price, "
						+ "menu_state, menu_update) "
						+ "values(menu_seq.nextval, ?, ?, ?, ?, ?, ?)";
		Object[] data = {
				menuDto.getStoreNo(),
				menuDto.getMenuCategory(),
				menuDto.getMenuName(),
				menuDto.getMenuPrice(),
				menuDto.getMenuState(),
				menuDto.getMenuUpdate(),
				};
		jdbcTemplate.update(sql, data);
	}
	
   //수정
   public boolean update(MenuDto menuDto) {
      String sql = "update menu set menu_category=?, menu_name=?, menu_price=?, menu_state=?, menu_update=SYSDATE"
    		  		+ " where menu_no=?";
      Object[] data = {
            menuDto.getMenuCategory(),
            menuDto.getMenuName(),
            menuDto.getMenuPrice(),
            menuDto.getMenuState(),
            menuDto.getMenuNo()
      };
      return jdbcTemplate.update(sql, data) > 0;
   }
	
	//삭제
	public boolean delete(int menuNo, int storeNo) {
		String sql = "delete menu where menu_no=? and store_no=?";
		Object[] data = {menuNo, storeNo};
		return jdbcTemplate.update(sql, data) > 0;
	}
	
	//목록
	public List<MenuDto> selectList() {
		String sql = "select * from menu order by menu_no";
		return jdbcTemplate.query(sql, menuMapper);
	}
	
	public int selectRecentMenu() {
		String sql = "SELECT menu_seq.currval FROM dual ";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//페이징을 위한 목록/검색/카운트 구현
	public List<MenuDto> selectListByPaging(PageVO pageVO, int storeNo) {	
		if(!pageVO.getColumn().isEmpty()) {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "SELECT tb1.* FROM menu tb1 "
									+ "LEFT OUTER JOIN store tb2 "
									+ "ON tb1.store_no = tb2.store_no "
									+ "WHERE menu_category = ? " 
									+ "AND tb1.store_no = ? " 
									+ "ORDER BY menu_no ASC "									
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {
				pageVO.getColumn(), 
				storeNo,
				pageVO.getBeginRow(), 
				pageVO.getEndRow()
			};
			return jdbcTemplate.query(sql, menuMapper, data);
		}
		else if(!pageVO.getKeyword().isEmpty()) {
			String sql = "select * from ( "
					+ "select rownum rn, TMP.* from ( "
						+ "SELECT tb1.* FROM menu tb1 "
						+ "LEFT OUTER JOIN store tb2 "
						+ "ON tb1.store_no = tb2.store_no "
						+ "WHERE instr(upper(tb1.menu_name), upper(?)) > 0 "
						+ "AND tb2.store_no = ? "
						+ "ORDER BY menu_no ASC "
					+ ")TMP"
				+ ") where rn between ? and ?";
			Object[] data = {
				pageVO.getKeyword(),
				storeNo,
				pageVO.getBeginRow(), 
				pageVO.getEndRow()
			};			
			return jdbcTemplate.query(sql, menuMapper, data);
		}
		else {
			String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select tb1.* from menu tb1 "
									+ "left outer join store tb2 "
									+ "on tb1.store_no = tb2.store_no " 
									+ "where tb1.store_no = ? "
									+ "order by menu_no asc"
								+ ")TMP"
							+ ") where rn between ? and ?";
			Object[] data = {storeNo, pageVO.getBeginRow(), pageVO.getEndRow()};
			return jdbcTemplate.query(sql, menuMapper, data);
		}
	}
	
	//상세조회(수정에서 사용)
	public MenuDto selectOne(int menuNo) {
		String sql = "select * from menu where menu_no=?";
		Object[] data = {menuNo};
		List<MenuDto> list = jdbcTemplate.query(sql, menuMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}	
	
	//카운트(목록일 경우와 검색일 경우를 각각 구현)
	public int count(PageVO pageVO, int storeNo) {
		if(!pageVO.getColumn().isEmpty()) {
			String sql = "SELECT count(*) FROM menu tb1 "
					   + "LEFT OUTER JOIN store tb2 "
					   + "ON tb1.store_no = tb2.store_no "
					   + "WHERE menu_category = ? " 
					   + "AND tb1.store_no = ? "; 
			Object[] data = {pageVO.getColumn(), storeNo};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else if(!pageVO.getKeyword().isEmpty()) {
			String sql = "SELECT count(*) FROM menu tb1 "
					   + "LEFT OUTER JOIN store tb2 "
					   + "ON tb1.store_no = tb2.store_no "
					   + "WHERE instr(upper(tb1.menu_name), upper(?)) > 0 "
					   + "AND tb2.store_no = ? ";
			Object[] data = {pageVO.getKeyword(), storeNo};
			return jdbcTemplate.queryForObject(sql, int.class, data);
		} else {
			String sql = "select count(*) from menu tb1 "
					   + "left outer join store tb2 "
					   + "on tb1.store_no = tb2.store_no " 
					   + "where tb1.store_no = ? ";
			Object[] data = {storeNo};
			return jdbcTemplate.queryForObject(sql, int.class, storeNo);
		}
	}
	
	//메뉴 이미지 연결
	public int findAttachNo(int menuNo) {
		String sql = "select attach_no from menu_attach where menu_no = ?";
		Object[] data = {menuNo};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//홈 배너 이미지 연결
	public int findBannerAttachNo(int storeNo) {
		String sql = "select attach_no from store_attach where store_no = ?";
		Object[] data = {storeNo};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}	
	
	public void connect(int menuNo, int attachNo) {
		String sql = "insert into menu_attach(menu_no, attach_no) "
						+ "values(?, ?)";
		Object[] data = {menuNo, attachNo};
		jdbcTemplate.update(sql, data);
	}
	
	//가게번호 호출
	public int selectStoreNo(String memberId) {
       String sql = " SELECT tb1.store_no FROM store tb1 "
                  + " LEFT OUTER JOIN member tb2 "
                  + " ON tb1.member_no = tb2.member_no "
                  + " WHERE tb2.member_id = ? ";
       Object[] data = {memberId};
       try {
          int storeNo = jdbcTemplate.queryForObject(sql, int.class, data);
          return storeNo;
       } catch(Exception e) {
          return 0;
       }
    }

	// attachNo 조회
	public int selectAttcahNo(int menuNo) {
		try {
			String sql = "select attach_no from menu_attach where menu_no=?";
			Object[] data = {menuNo};
			return jdbcTemplate.queryForObject(sql, int.class, data);			
		} catch(Exception e) {
			return 0;
		}
	}
	
	public List<StoreDto> selectHomeBanner() {
		String sql = " SELECT * "
				   + " FROM (SELECT * " 
				   + " FROM store "
				   + " ORDER BY dbms_random.value) "
				   + " WHERE rownum <= 5 ";
		List<StoreDto> list = jdbcTemplate.query(sql, storeMapper);
		return list;
	}
	
	public List<StoreDto> selectHomeBannerPickData() {
		String sql = " SELECT * "
				   + " FROM store " 
				   + " WHERE rownum <= 7 "
				   + " ORDER BY dbms_random.value ";
		List<StoreDto> list = jdbcTemplate.query(sql, storeMapper);
		return list;
	}
	
}

