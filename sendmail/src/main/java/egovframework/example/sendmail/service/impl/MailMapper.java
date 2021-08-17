/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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
package egovframework.example.sendmail.service.impl;

import java.util.List;

import egovframework.example.sendmail.service.AddressVO;
import egovframework.example.sendmail.service.MailVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("mailMapper")
public interface MailMapper {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MailVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertMail(MailVO vo) throws Exception;
	
	/*wholebox 상세 */
	
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
	void insertMailbox(MailVO vo) throws Exception;

	
	/**
	 * 메일함추가하는 목록을 조회한다.
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
	
	
/*	*//**
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
	 * 글을 입력한다.
	 * @param vo - 등록할 정보가 담긴 MailVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertAddress(AddressVO vo) throws Exception;

	
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








