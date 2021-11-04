<%--
  Class Name : EgovNoticeRegist.jsp
  Description : 게시물  생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.24   이삼섭          최초 생성
     2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.24  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<!-- <script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>" ></script> --> 
<!-- <script src="//cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script> -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>



<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function fn_egov_validateForm(obj) {
        return true;
    }
    
    function fn_egov_regist_notice() {
        //document.board.onsubmit();
        
        if (!validateBoard(document.board)){
            return;
        }
        <c:if test="${bdMstr.bbsAttrbCode == 'BBSA02'}">
        if(document.getElementById("egovComFileUploader").value==""){
            alert("갤러리 게시판의 경우 이미지 파일 첨부가 필수사항입니다.");
            return false;
        }
        </c:if>
        if (confirm('<spring:message code="common.regist.msg" />')) {
            //document.board.onsubmit();
            document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
            document.board.submit();
        }
    }
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>"+ "?bbsId=" +"<c:out value='${bdMstr.bbsId}'/>";
        document.board.submit();
    }   
</script>
<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title><c:out value='${bdMstr.bbsNm}'/> - hey yo this is a 공지 게시글쓰기!</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
  


</head>

<!-- body onload="javascript:editor_generate('nttCn');"-->
<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus();"> -->
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 --> 
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->
            <!-- 현재위치 네비게이션 시작 -->
            <div id="content">
                <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>알림마당</li>
                            <li>&gt;</li>
                            <li><strong>${brdMstrVO.bbsNm}</strong></li>
                        </ul>
                    </div>
                </div>
                <!-- 검색 필드 박스 시작 -->
                <div id="search_field">
                    <div id="search_field_loc"><h2><strong>hey yo this is a 공지 게시글쓰기!</strong></h2></div>
                </div>

				<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
				
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="text" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
				<input type="text" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
				<input type="text" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
				<input type="text" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
				<input type="text" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
				<input type="text" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
				<input type="text" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
				<input type="text" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
				
				<input type="text" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
				<input type="text" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
				
				<c:if test="${anonymous != 'true'}">
					<input type="text" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
					<input type="text" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
				</c:if>
				
				<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
				   <input name="ntceBgnde" type="text" value="10000101">
				   <input name="ntceEndde" type="text" value="99991231">
				</c:if>
 
                    <div id="border" class="modify_user" >
                        <table >
                            <tr>
						        <th width="20%" height="23"  nowrap="nowrap"><label for="nttSj">스프링 안쓴 제목nttSj과<br> 스프링 쓴
						        <spring:message code="cop.nttSj" />
						        </label>
						        <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
						        </th>
						        <td width="80%" nowrap colspan="3">
						          <input id="nttSj" name="nttSj" type="text" size="60" value=""  maxlength="60" > 
						          <br/><form:errors path="nttSj" />
						        </td>
						    </tr>
						    <tr> 
						        <th height="23" ><label for="nttCn"><spring:message code="cop.nttCn" /></label>
                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
                                </th>
						        <td colspan="3">
						          <textarea id="nttCn" name="nttCn" class="textarea" cols="75" rows="20" style="width:99%;">뭔가 입력</textarea>
	
	              <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	           <div id="editor" onchange='printName()'></div>
	            <input id="contents" onchange='printName1()'>

<script>
const editor = new toastui.Editor({
	  el: document.querySelector('#editor'),
	  height: '500px',
	  initialEditType: 'markdown',
	  previewStyle: 'vertical'
	  
	});


	var testui = editor.getMarkdown();
	
	function printName()  {
		  const name = editor.getMarkdown();
		  document.getElementById("nttCn").innerText = name;
		}
	
	function printName1()  {
		  const name = editor.getHTML();
		  document.getElementById("nttCn").innerText = name;
		}
	
	

	//document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHtml());
	//console.log(editor.getHtml());

	
</script>	           
  <!-- 	 <div id="editor" onchange="printName()"></div>
	<script>      
	 const editor = new toastui.Editor({
	 el: document.querySelector('#editor'),
	previewStyle: 'vertical',
		 height: '500px',
		
		});
	 var content = editor.getValue();
	 function printName()  {
		  const name = document.getElementById('editor').value;
		  document.getElementById("nttCn").innerText = editor;
		}
	 
	 </script>  
		-->
	

<!--

<input id='name' onchange='printName2()'/>


<script>
const editor = new toastui.Editor({
el: document.querySelector('#editor1'),
previewStyle: 'vertical',
	 height: '500px',
	});

function printName()  {
	  var textreal = document.querySelector("div.toastui-editor-pseudo-clipboard");
	  const name = textreal.innerText;
	  document.getElementById("xxx").value = name;
	};
	
	function printName2()  {
		  const name = document.getElementById('name').value;
		  document.getElementById("nttCn").innerText = name;
		}
	
	
	
</script>
      					
-->			
					
						      
	<!-- <script>
                // Replace the <textarea id="editor1"> with a CKEditor 4
                // instance, using default configuration.
                CKEDITOR.replace( 'nttCn');
            </script>				          <form:errors path="nttCn" /> -->
       
             
            
						        </td>
						    </tr>
						    <c:choose>
						        <c:when test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
						          <tr> 
						            <th height="23" ><spring:message code="cop.noticeTerm" />
	                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
	                                </th>
						            <td colspan="3">
						              <input name="ntceBgnde" type="hidden" >
						              <input name="ntceBgndeView" type="text" size="10" value=""  title="게시시작일" readonly="readonly"
						                onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');" >
						              <img src="<c:url value='/images/calendar.gif' />"
						                onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"
						                width="15" height="15" alt="calendar">
						              ~
						              <input name="ntceEndde" type="hidden"  />
						              <input name="ntceEnddeView" type="text" size="10" value=""  title="게시종료일" readonly="readonly"
						                onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"  >
						              <img src="<c:url value='/images/calendar.gif' />"
						                onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"
						                width="15" height="15" alt="calendar">
						                <br/><form:errors path="ntceBgnde" />
						                <br/><form:errors path="ntceEndde" />
						                
						            </td>
						          </tr>     
						          </c:when>
						        <c:otherwise>
						        
						        </c:otherwise>
						    </c:choose>
						
					        <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">          
						      <tr>
						        <th height="23"><label for="egovComFileUploader"><spring:message code="cop.atchFile" /></label></th>
						        <td colspan="3">
						                    <input name="file_1" id="egovComFileUploader" type="file" />
						                        <div id="egovComFileList"></div>
						        </td>
						      </tr>
					      
					      </c:if>
					    </table>
                    </div>
 
                    <!-- 버튼 시작(상세지정 style로 div에 지정) -->
                    <div class="buttons" style="padding-top:10px;padding-bottom:10px;">
                        <!-- 목록/저장버튼  -->
                        <table border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
						      <c:if test="${bdMstr.authFlag == 'Y'}">
						          <td>
						             <a href="#LINK" onclick="javascript:fn_egov_regist_notice(); return false;"><spring:message code="button.save" /></a> 
						          </td>
						          <td width="10"></td>
						      </c:if>
						      <td>
						          <a href="#LINK" onclick="javascript:fn_egov_select_noticeList(); return fasle;"><spring:message code="button.list" /></a> 
						      </td>
                            </tr>   
                        </table>
                    </div>
                    <!-- 버튼 끝 -->                           
                </form:form>

            </div>  
            <!-- //content 끝 -->    
    </div>  
    <!-- //container 끝 -->
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //전체 레이어 끝 -->
<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">          

<script type="text/javascript">
var maxFileNum = document.board.posblAtchFileNumber.value;
if(maxFileNum==null || maxFileNum==""){
    maxFileNum = 3;
} 
var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );         
</script>    


</c:if>
</body>
</html>
