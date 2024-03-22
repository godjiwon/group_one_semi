package com.kh.picachubaedal.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.kh.picachubaedal.interceptor.CeoInterceptor;
import com.kh.picachubaedal.interceptor.Member2Interceptor;
import com.kh.picachubaedal.interceptor.MemberInterceptor;

@Configuration
public class InterceptorConfiguration implements WebMvcConfigurer {

	@Autowired
	private Member2Interceptor member2Interceptor;
	@Autowired
	private CeoInterceptor ceoInterceptor;
	@Autowired
	private MemberInterceptor memberIntercepter;

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
//		registry에다가 인터셉터를 주소와 함께 등록
//		registry.addInterceptor(인터셉터객체).addPathPatterns(주소);
//		registry.addInterceptor(testInterceptor)
//					.addPathPatterns("/**");
		
//		지정한 페이지만 허용하도록 설정
//		registry.addInterceptor(memberInterceptor)
//					.addPathPatterns(
//							"/member/mypage", 
//							"/member/password", "/member/passwordFinish",
//							"/member/change",
//							"/member/exit"
//					);
		
//		중간주소를 등록하고 특정 페이지를 제외(exclude)
//		- 주소를 설정할 때 **와 *를 사용할 수 있다
//		- **는 하위 엔드포인트까지 모두 포함하여 설정할 때 사용 (후손)
//		- *는 동일 엔드포인트까지만 포함하여 설정할 때 사용 (자식)
//		registry.addInterceptor(member2Interceptor)
//					.addPathPatterns( 
//							"/store/**",
//							"/member/**"
//							
//							
//						
//					
//					)
//					.excludePathPatterns( //인터셉터 제외
//					
//							"/member/signin*",
//							"/member/signup", "/member/signupFinish",
//							"/member/find*"
//							
//					);
		
		
		
		//사장님 인터셉터 등록
		registry.addInterceptor(ceoInterceptor)
					.addPathPatterns(
							"/store/list",
							"/store/insert1",
							"/menu/ceoMenuList**",
							"/menu/edit/**","/menu/insert/**",
							"/store/detail","/store/change**","/store/delete**"
							
							
						
							
							)
					.excludePathPatterns( //인터셉터 제외
						
						
						
						
							
					);
		//모든회원 인터셉터 등록
				registry.addInterceptor(memberIntercepter)
							.addPathPatterns(
									"/store/**",
									"/member/**"
								
									
									)
							.excludePathPatterns( //인터셉터 제외
									"/member/signin*",
									"/member/signup", "/member/signupFinish",
									"/member/find*","/member/pw**/"
								
								
									
							);
		
		
		
		//내글 또는 관리자만 수정 삭제하는 인터셉터 등록
//		registry.addInterceptor(ceoMenuInterceptor)
//					.addPathPatterns("/menu/ceoMenuList", "/board/delete");
	}
}
