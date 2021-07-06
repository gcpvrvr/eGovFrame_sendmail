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

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sample.sendmail.service.SendmailService;
import egovframework.example.sample.sendmail.service.SendmailVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("sendmailService")
public class SendmailServiceImpl extends EgovAbstractServiceImpl implements SendmailService {

   private static final Logger LOGGER = LoggerFactory.getLogger(SendmailServiceImpl.class);

   /** SampleDAO */
   // TODO ibatis 사용
//   @Resource(name = "sampleDAO")
//   private SampleDAO sampleDAO;
   // TODO mybatis 사용
     @Resource(name="sendmailMapper")
      private SendmailMapper SendmailDAO;

   /** ID Generation */
   @Resource(name = "egovIdGnrService")
   private EgovIdGnrService egovIdGnrService;

   /**
    * 글을 등록한다.
    * @param vo - 등록할 정보가 담긴 SampleVO
    * @return 등록 결과
    * @exception Exception
    */

   
   public String insertSendmail(SendmailVO vo) throws Exception {
      LOGGER.debug(vo.toString());

//      /** ID Generation Service */
//      String id = egovIdGnrService.getNextStringId();
//      vo.setId(id);
//      LOGGER.debug(vo.toString());

      sendmailDAO.insertSendmail(vo);
      return vo.getIdx();
   }

   /**
    * 글을 수정한다.
    * @param vo - 수정할 정보가 담긴 SampleVO
    * @return void형
    * @exception Exception
    */
   
   public void updateSendmail(SendmailVO vo) throws Exception {
      sendmailDAO.updateSendmail(vo);
   }

   /**
    * 글을 삭제한다.
    * @param vo - 삭제할 정보가 담긴 SampleVO
    * @return void형
    * @exception Exception
    */

   @Override
   public void deleteSendmail(SendmailVO vo) throws Exception {
      sendmailDAO.deleteSendmail(vo);
   }

   /**
    * 글을 조회한다.
    * @param vo - 조회할 정보가 담긴 SampleVO
    * @return 조회한 글
    * @exception Exception
    */
   
   @Override
   public SendmailVO selectSendmail(SendmailVO vo) throws Exception {
      SendmailVO resultVO = sendmailDAO.selectSendmail(vo);
      if (resultVO == null)
         throw processException("info.nodata.msg");
      return resultVO;
   }

   /**
    * 글 목록을 조회한다.
    * @param searchVO - 조회할 정보가 담긴 VO
    * @return 글 목록
    * @exception Exception
    */
   
   @Override
   public List<?> selectSendmailList(SendmailVO searchVO) throws Exception {
      return sendmailDAO.selectSendmailList(searchVO);
   }

   /**
    * 글 총 갯수를 조회한다.
    * @param searchVO - 조회할 정보가 담긴 VO
    * @return 글 총 갯수
    * @exception
    */
   
   @Override
   public int selectSendmailListTotCnt(SendmailVO searchVO) {
      return sendmailDAO.selectSendmailListTotCnt(searchVO);
   }

   
   public String selectLoginCheck(SendmailVO searchVO) {
      return sendmailDAO.selectLoginCheck(searchVO);
   }
   
   @Override
   public void insertReply(SendmailVO vo) throws Exception {
	   LOGGER.debug(vo.toString());
	   // 키 자동채번 필요없음
	   /** ID Generation Service */
	   //String id = egovIdGnrService.getNextStringId();
	   //vo.setId(id);
	   //LOGGER.debug(vo.toString());

	   sendmailDAO.insertReply(vo);
	   }

   

}