package com.kh.picachubaedal.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.picachubaedal.dto.MemberDto;
import com.kh.picachubaedal.dto.StoreDto;
import com.kh.picachubaedal.mapper.MemberMapper;
import com.kh.picachubaedal.mapper.MenuMapper;
import com.kh.picachubaedal.mapper.StoreMapper;
import com.kh.picachubaedal.service.AttachService;
import com.kh.picachubaedal.vo.PageVO;

@Repository
public class StoreDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private StoreMapper storeMapper;
    @Autowired
    private AttachDao attachDao;
    @Autowired 
    AttachService attachService;
    @Autowired
    private MemberMapper mapper;

    @Autowired
	private MemberMapper memberMapper;
    
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private MenuMapper menuMapper;


    //가게등록
    public void insert(StoreDto storeDto, MultipartFile attach) throws IllegalStateException, IOException {
        String sql = "INSERT INTO store (" +
                    "store_no, store_name, store_post, store_address1, store_address2, store_category, "
                    + "store_type, store_contact, store_intro, store_dtip, store_minprice, "
                    + "store_open_hour, store_close_hour, store_delivery, store_closed, "
                    + "store_business_number, member_no" +
                    ") VALUES (store_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
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
            storeDto.getStoreBusinessNumber(),
            storeDto.getMemberNo()
        };
        
        jdbcTemplate.update(sql, data);

    }
    

    
    

    //첨부파일 관련
    public int selectRecentStore() {
        String sql = "SELECT MAX(store_no) FROM store";
        return jdbcTemplate.queryForObject(sql, int.class);
     }
    
    //회원번호로 가게 번호 찾기
    public int findStoreNoByMemberNo(int memberNo) {
        String sql = "SELECT store_no FROM store WHERE member_no = ?";
        try {
            return jdbcTemplate.queryForObject(sql, Integer.class, memberNo);
        } catch (EmptyResultDataAccessException e) {
            return -1; // 회원에 해당하는 가게가 없는 경우
        }
    }



 // 수정 (가게 수정)
    public boolean update(StoreDto storeDto ) {
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


  //가게 삭제(삭제, Delete)
    public boolean delete(int storeNo) {
        String sql = "delete from store where store_no = ?";
        Object[] data = {storeNo};
        return jdbcTemplate.update(sql, data) > 0;
    }
    
 // 가게 삭제 (사업자 등록번호로 삭제)
    public boolean deleteStoreByBusinessNumber(String businessNumber) {
        // 입력한 사업자 등록번호로 가게를 조회
        String selectQuery = "SELECT * FROM store WHERE store_business_number = ?";
        StoreDto storeDto = jdbcTemplate.queryForObject(selectQuery, storeMapper, businessNumber);

        if (storeDto != null && businessNumber.equals(storeDto.getStoreBusinessNumber())) {
            // 조회된 가게가 있고, 입력한 사업자 등록번호와 일치할 경우 가게 삭제
            String deleteQuery = "DELETE FROM store WHERE store_business_number = ?";
            return jdbcTemplate.update(deleteQuery, businessNumber) > 0;
        } else {
            // 가게가 없거나 사업자 등록번호가 일치하지 않을 경우 삭제 실패
            return false;
        }
    }
    
 // 사업자 등록번호로 가게 조회
    public StoreDto selectByBusinessNumber(String businessNumber) {
        String sql = "SELECT * FROM store WHERE store_business_number = ?";
        Object[] data = {businessNumber};
        try {
            return jdbcTemplate.queryForObject(sql, storeMapper, data);
        } catch (EmptyResultDataAccessException e) {
            return null; // 해당 사업자 등록번호에 해당하는 가게가 없는 경우
        }
    }


    


  	public boolean deleteByMemberIdAndStoreNo(String memberId, int storeNo) {
  	    // 세션에서 memberId로 memberNo를 조회하는 쿼리
  	    String memberNoQuery = "SELECT member_no FROM member WHERE member_id = ?";
  	    int memberNo = jdbcTemplate.queryForObject(memberNoQuery, Integer.class, memberId);

  	    // 해당 멤버가 소유한 가게 중에서 storeNo가 맞는 가게를 삭제하는 쿼리
  	    String deleteQuery = "DELETE FROM store WHERE member_no = ? AND store_no = ?";
  	    return jdbcTemplate.update(deleteQuery, memberNo, storeNo) > 0;
  	}
  	
  	
  	

    

  //프로필 이미지 연결 (백업 03.19)
  	public void connect(int storeNo, int attachNo) {
  		String sql = "insert into store_attach(store_no, attach_no) "
  						+ "values(?, ?)";
  		Object[] data = {storeNo, attachNo};
  		jdbcTemplate.update(sql, data);
  	}
  	
// // 프로필 이미지 연결
//  	public void connect(int storeNo, int attachNo) {
//  	    String sql = "insert into store_attach(store_no, attach_no) values(?, ?)";
//  	    Object[] data = {storeNo, attachNo};
//  	    jdbcTemplate.update(sql, data);
//  	}

  	

  	public int findAttachNo(int storeNo) {
  		String sql = "select attach_no from store_attach where store_no = ?";
  		Object[] data = {storeNo};
  		return jdbcTemplate.queryForObject(sql, int.class, data);
  	}

  	
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
	
	
	public MemberDto selectMemberOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] data = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, data);
		return list.isEmpty() ? null : list.get(0);
	}
	
	
	//페이징을 위한 목록/검색/카운트 구현
		public List<StoreDto> selectListByPaging(PageVO pageVO) {
			System.out.println(pageVO);
			if(pageVO.isSearch()) {
				String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select * from store "
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
		
	//	백업 03.19
		public MemberDto selectByMemberNo(int memberNo) {
			String sql = "select * from store where member_no=?";
			Object[] data = {memberNo};
			List<MemberDto> list = jdbcTemplate.query(sql, mapper, data);
			return list.isEmpty() ? null : list.get(0);
		}
		
		public List<StoreDto> selectListAll() {

			String sql = "select * from store order by store_no asc";
			return jdbcTemplate.query(sql, storeMapper);
		}
		
		//카테고리 리스트
		public List<StoreDto> selectListCategory(String storeCategory) {

			String sql = "select * from store where store_category = ? order by store_no asc";
			Object[] data = {storeCategory};
			return jdbcTemplate.query(sql, storeMapper, data);
		}

		
		
		//스토어 테이블에서 멤버 넘버 찾기
		public List<StoreDto> selectListByMemberNo(int memberNo) {
		    String sql = "SELECT * FROM store WHERE member_no = ?";
		    Object[] data = { memberNo };
		    return jdbcTemplate.query(sql, storeMapper, data);
		}
		
	

		// StoreDao.java

		public boolean deleteStoreByMemberIdAndStoreNo(String memberId, int storeNo) {
		    // 세션에서 memberId로 memberNo를 조회하는 쿼리
		    String memberNoQuery = "SELECT member_no FROM member WHERE member_id = ?";
		    int memberNo = jdbcTemplate.queryForObject(memberNoQuery, Integer.class, memberId);

		    // 해당 멤버가 소유한 가게 중에서 storeNo가 맞는 가게를 삭제하는 쿼리
		    String deleteQuery = "DELETE FROM store WHERE member_no = ? AND store_no = ?";
		    return jdbcTemplate.update(deleteQuery, memberNo, storeNo) > 0;
		}
		
		
		public StoreDto selectByMemberNo(String memberId) {
		    String sql = "SELECT * FROM store WHERE member_no = (SELECT member_no FROM member WHERE member_id = ?)";
		    try {
		        return jdbcTemplate.queryForObject(sql, storeMapper, memberId);
		    } catch (EmptyResultDataAccessException e) {
		        return null; // 해당 멤버에게 연결된 가게 정보가 없는 경우
		    }
		}
		



		// 가게 목록 및 검색 (메뉴 이름에 해당하는 가게)
		public List<StoreDto> searchStoresByMenuName(String menuName) {

		    String sql = "SELECT DISTINCT s.* " +
		                 "FROM store s " +
		                 "INNER JOIN menu m ON s.store_no = m.store_no " +
		                 "WHERE INSTR(UPPER(m.menu_name), UPPER(?)) > 0 " +
		                 "ORDER BY s.store_no ASC";

		    // ? 에 대한 값을 설정하여 SQL 쿼리 실행
		    Object[] data = { menuName };
		    List<StoreDto> list = jdbcTemplate.query(sql, storeMapper, data);

		    return list;
		}




		
	
}
