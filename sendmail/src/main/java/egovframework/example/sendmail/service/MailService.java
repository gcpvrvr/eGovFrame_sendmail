/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sendmail.service;

import java.util.List;

/**
 * @Class Name : EgovMailService.java
 * @Description : EgovMailService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface MailService {
// 컨트롤러가 로직을 수행하기 위해 가장 먼저 호출하는것이 인터페이스이다. 
// 인터페이스는 업무 처리를 위한 입구 역할을 한다. 실제 로직은 impl에 있다.
	
	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MailVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertMail(MailVO vo) throws Exception;
	
	/*wholebox 상세  */
	
	MailVO detailwholebox(MailVO vo) throws Exception;
	

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void updateMail(MailVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteMail(MailVO vo) throws Exception;

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MailVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	MailVO selectMail(MailVO vo) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectMailList(MailVO vo) throws Exception;

	List<?> selectInboxList(MailVO vo) throws Exception;
	
	List<?> selectOutboxList(MailVO vo) throws Exception;

	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectMailListTotCnt(MailVO vo);

	String selectLoginCheck(MailVO vo);
	
	
	
	/**
	 * 메일함을 입력한다.
	 * @param vo - 등록할 정보가 담긴 MailVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertMailbox(MailVO vo) throws Exception;
	
	
	/**
	 * 메일함추가 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> mboxaddlist(MailVO vo) throws Exception;
	
	
	/*메일함 상세 보기(수정페이지) */
	
	MailVO detailmailbox(MailVO vo) throws Exception;
	
	
	/**
	 * 메일함을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void updateMailbox(MailVO vo) throws Exception;

	/**
	 * 메일함을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteMailbox(MailVO vo) throws Exception;
	
	
	/**
	 * mailbox메일함 셀렉트박스 조회
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectMboxAdd(MailVO vo) throws Exception;

	
	/**
	 * 메일 검색조회 페이지
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> searchmail(MailVO vo) throws Exception;
	
	
	
	/*주소록*/
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> addresslist(AddressVO vo) throws Exception;
	

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MailVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertAddress(AddressVO vo) throws Exception;
	

	/*주소록 상세 보기(수정페이지) */
	
	AddressVO detailAddress(AddressVO vo) throws Exception;

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void updateAddress(AddressVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MailVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteAddress(AddressVO vo) throws Exception;

	
	
	

}








