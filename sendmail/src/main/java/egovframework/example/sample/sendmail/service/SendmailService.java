package egovframework.example.sample.sendmail.service;

import java.util.List;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
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
public interface SendmailService {

/**
 * 글을 등록한다.
 * @param vo - 등록할 정보가 담긴 SampleVO
 * @return 등록 결과
 * @exception Exception
 */
String insertSendmail(SendmailVO vo) throws Exception;

/**
 * 글을 수정한다.
 * @param vo - 수정할 정보가 담긴 SendmailVO
 * @return void형
 * @exception Exception
 */
void updateSendmail(SendmailVO vo) throws Exception;

/**
 * 글을 삭제한다.
 * @param vo - 삭제할 정보가 담긴 SendmailVO
 * @return void형
 * @exception Exception
 */
void deleteSendmail(SendmailVO vo) throws Exception;

/**
 * 글을 조회한다.
 * @param vo - 조회할 정보가 담긴 SampleVO
 * @return 조회한 글
 * @exception Exception
 */
SendmailVO selectSendmail(SendmailVO vo) throws Exception;

/**
 * 글 목록을 조회한다.
 * @param searchVO - 조회할 정보가 담긴 VO
 * @return 글 목록
 * @exception Exception
 */
List<?> selectSendmailList(SendmailVO sendmailVO) throws Exception;

/**
 * 글 총 갯수를 조회한다.
 * @param searchVO - 조회할 정보가 담긴 VO
 * @return 글 총 갯수
 * @exception
 */
int selectSendmailListTotCnt(SendmailVO sendmailVO);

String selectLoginCheck(SendmailVO vo);

void insertReply(SendmailVO vo) throws Exception;


}
