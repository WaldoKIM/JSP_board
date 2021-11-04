<%--
  Class Name : EgovMainView.jsp 
  Description : 메인화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<title>표준프레임워크 경량환경 홈페이지 템플릿</title>
<!-- <link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" > -->
<style>
  .top {background-color: #AED6F1;}
  .toptest1 {display:none; background-color: #34495E;}
  .toptest2 {background-color: #ABEBC6; font-size: 32px; line-height:1.2em;}
  .maintitle {text-align: center; display:block; width:100%; background-color: rgb(212, 246, 255);}

  .topright {background-color: #D7BDE2; }
  .middle {clear:both; background-color: #FCF3CF; }
  .testbox1 {background-color: #3498DB;}
  .testbox2 {background-color: #D7BDE2; }
  .testbox3 {background-color: #AED6F1; }
  .testbox4 {background-color: #FCF3CF; }
  .testbox5 {clear:both; background-color: #ff379b; width: 1200px; margin: auto;}
  .testbox5 li {float:left; margin-right: 60px;}
  .testbox5 .finalli {margin-right: 0px;}

  .loginbox {position: absolute; top:-9px; right: 20px; background-color: #ff379b; list-style: none;}  
  .bonono {position: relative; top: 1em;}
  .bonono2 {display: block; margin: auto; width: 480px;}
  .bgred {background-color: rgb(201, 215, 245);}
  .fleft {float: left;}
  .fclear {clear: both;}
</style>
</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
<!-- 전체 레이어 시작 -->

<div id="wrap">
	<!-- header 시작 -->
	<div id="header_mainsize" class="top">
	    <c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" />
	</div>
	
	<div id="topnavi" class="topright">
	    <c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" />
	</div>
			
	<!-- //header 끝 -->
	<!-- container 시작 -->
	<div id="main_container" class="middle">
		<div class="lefttitle_image bonono">
		    <span class="bonono2"><img src="<c:url value='/images/index/bonobo.jpg' />" 
		         alt="경량환경 내부업무 홈페이지/전자정부 표준프레임워크의 경량환경 내부 업무에 대한 최신정보와 기술을 제공하고 있습니다." />
				</span></div>
		
		<!-- code layer -->
		<div class="rightmain_wrap">			
			<div class="board_wrap">
				<!-- 공지사항 시작 -->
				<div class="notice_area testbox2" >
					<h3 class="notice_title"><img src="<c:url value='/images/index/img_subtitle01.gif' />" alt="공지사항" /></h3>
					<a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'); return false;" class="more"><img src="<c:url value='/images/index/btn_more.gif' />" alt="more" /></a>
					<ul class="testbox1">
    					<c:forEach var="result" items="${notiList}" varStatus="status">
        					<li>
                                <div class="notice_lefttext">
        					        <a href="<c:url value='/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA'); return false;">
            					        <c:if test="${result.replyLc!=0}">
                                            <c:forEach begin="0" end="${result.replyLc}" step="1">&nbsp;</c:forEach>
                                            <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                <c:out value="${result.nttSj}" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${result.nttSj}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
        					    </div>
        					    <div class="notice_righttext"><c:out value="${result.frstRegisterPnttm}"/></div>
        					</li>
    					</c:forEach>
                        <c:if test="${fn:length(result) == 0}">
                            <li>등록된 공지사항이 없습니다.</li>
                        </c:if>
                    </ul>
    				<!-- //공지사항 끝 -->
    				<!-- 갤러리 시작 -->
    				<div class="notice_area testbox3">
    					<h3 class="notice_title"><img src="<c:url value='/images/index/img_subtitle02.gif' />" alt="갤러리" /></h3> 
    					<a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB'); return false;" class="more"><img src="<c:url value='/images/index/btn_more.gif' />" alt="more" /></a>
    					<ul class="testbox1">
    						<c:forEach var="result" items="${galList}" varStatus="status">
                                <li>
                                    <div class="notice_lefttext">
                                        <a href="#LINK" onclick="javascript:fn_main_headPageAction('43','cop/bbs/selectBoardList.do?bbsId=BBSMSTR_BBBBBBBBBBBB'); return false;">
                                            <c:if test="${result.replyLc!=0}">
                                                <c:forEach begin="0" end="${result.replyLc}" step="1">&nbsp;</c:forEach>
                                                <img src="<c:url value='/images/reply_arrow.gif'/>" alt="reply arrow"/>
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                    <c:out value="${result.nttSj}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${result.nttSj}" />
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                    </div>
                                    <div class="notice_righttext"><c:out value="${result.frstRegisterPnttm}"/></div>
                                </li>
                            </c:forEach>
                        <c:if test="${fn:length(result) == 0}">
                            <li>등록된 갤러리가 없습니다.</li>
                        </c:if>
    					</ul>
    				</div>
				</div>
				<!--  //갤러리 끝 -->			
				<div class="info_divwrap testbox2"> 
					<div class="righttop_banner"> 
						<ul>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('21','main/sample_menu/EgovProductInfo'); return false;"><img src="<c:url value='/images/index/img_product.gif' />" alt="주요사업 소개" title="샘플화면으로 이동합니다.(주요사업 소개)" /></a></li>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('22','main/sample_menu/EgovServiceInfo'); return false;"><img src="<c:url value='/images/index/img_service.gif' />" alt="대표서비스 소개" title="샘플화면으로 이동합니다.(대표서비스 소개)" /></a></li>
						</ul>
					</div>
					<div class="middle_banner" style="">
						<ul>
							<li class="li_btm"><a href="#LINK" onclick="javascript:fn_main_headPageMove('31','main/sample_menu/EgovDownload'); return false;"><img src="<c:url value='/images/index/img_download.gif' />" alt="자료실:다양한자료를 다운로드 받으실 수 있습니다." title="샘플화면으로 이동합니다.(자료실)" /></a></li>
							<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('14','main/sample_menu/EgovLocation'); return false;"><img src="<c:url value='/images/index/img_location.gif' />" alt="표준프레임워크센터:찾아오시는 길" title="샘플화면으로 이동합니다.(찾아오시는길)" /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 하단 서비스 영역  -->
			<div id="main_btm_area" class="testbox1">
				<ul>
					<li><a href="#LINK" onclick="javascript:fn_main_headPageMove('33','main/sample_menu/EgovService'); return false;">
					    <img src="<c:url value='/images/index/img_service_btm.gif' />" alt="서비스 신청" title="샘플화면으로 이동합니다.(서비스 신청)"/></a>
					</li>
					<li><div class="mainbtm_text1">표준프레임워크 경량환경 홈페이지의 다양한 서비스를 신청 하실 수 있습니다.</div></li>  
					<li><div class="mainbtm_vline"><img src="<c:url value='/images/index/img_vline.gif' />" alt="" /></div></li> 
					<li><div class="img_div01">
					    <a href="#LINK" onclick="javascript:fn_main_headPageAction('42','cop/smt/sim/EgovIndvdlSchdulManageWeekList.do'); return false;"><img src="<c:url value='/images/index/img_schedule.gif' />" alt="일정 현황" /></a></div>
					</li>
					<li><div class="mainbtm_text2">표준프레임워크 경량환경 홈페이지의 전체적인 일정현황을 조회하실 수 있습니다.</div></li>   
				</ul>
			</div>
		</div>
		<!-- //code layer -->		
	</div>
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
<!-- //전체 레이어 끝 -->
</div>
</body>
</html>

