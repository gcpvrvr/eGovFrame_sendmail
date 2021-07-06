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
package egovframework.example.sample.sendmail.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.sendmail.service.SendmailDefaultVO;
import egovframework.example.sample.sendmail.service.SendmailVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
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

@Repository("sendmailDAO")
public class SendmailDAO extends EgovAbstractDAO {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertSendmail(SendmailVO vo) throws Exception {
		return (String) insert("sendmailDAO.insertSendmail", vo);
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 SendmailVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateSendmail(SendmailVO vo) throws Exception {
		update("sendmailDAO.updateSendmail", vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 SendmailVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteSendmail(SendmailVO vo) throws Exception {
		delete("sendmailDAO.deleteSendmail", vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 SendmailVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public SendmailVO selectSendmail(SendmailVO vo) throws Exception {
		return (SendmailVO) select("sendmailDAO.selectSendmail", vo);
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectSendmailList(SendmailDefaultVO searchVO) throws Exception {
		return list("sendmailDAO.selectSendmailList", searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return 글 총 갯수
	 * @exception
	 */
	public int selectSendmailListTotCnt(SendmailDefaultVO searchVO) {
		return (Integer) select("sendmailDAO.selectSendmailListTotCnt", searchVO);
	}

}
