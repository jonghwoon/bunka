<%@page import="cobra.mvc.center.common.domain.DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/setting.jsp"%>
<%@ include file="setting_circle.jsp"%>
<html>
<%
		ArrayList<DTO> dtos = (ArrayList<DTO>)request.getAttribute("dtos");
%>
<body>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<title>모임장소</title>
<link rel='stylesheet' id='divi-style-css'  href='${circle}css/styles.css' type='text/css' media='all' />
<link rel='stylesheet' id='magnific-popup-css'  href='${circle}css/magnific_popup.css' type='text/css' media='all' />
<style id="theme-customizer-css">
		
#main-header, #main-header .nav li ul, .et-search-form, #main-header .et_mobile_menu { background-color: #212121; }
.et_header_style_centered .mobile_nav .select_page, .et_header_style_split .mobile_nav .select_page, .et_nav_text_color_light #top-menu > li > a, .et_nav_text_color_dark #top-menu > li > a, #top-menu a, .et_mobile_menu li a, .et_nav_text_color_light .et_mobile_menu li a, .et_nav_text_color_dark .et_mobile_menu li a, #et_search_icon:before, .et_search_form_container input, span.et_close_search_field:after, #et-top-navigation .et-cart-info { color: rgba(221,221,221,0.6); }
.et_search_form_container input::-moz-placeholder {color: rgba(221,221,221,0.6); }
.et_search_form_container input::-webkit-input-placeholder { color: rgba(221,221,221,0.6); }
.et_search_form_container input:-ms-input-placeholder { color: rgba(221,221,221,0.6); }
								
#top-menu li.current-menu-ancestor > a, #top-menu li.current-menu-item > a,
.et_color_scheme_red #top-menu li.current-menu-ancestor > a, .et_color_scheme_red #top-menu li.current-menu-item > a,
.et_color_scheme_pink #top-menu li.current-menu-ancestor > a, .et_color_scheme_pink #top-menu li.current-menu-item > a,
.et_color_scheme_orange #top-menu li.current-menu-ancestor > a, .et_color_scheme_orange #top-menu li.current-menu-item > a,
.et_color_scheme_green #top-menu li.current-menu-ancestor > a, .et_color_scheme_green #top-menu li.current-menu-item > a { color: #ffffff; }
#main-footer .footer-widget h4 { color: #ffffff; }
.footer-widget li:before { border-color: #494949; }
.footer-widget, .footer-widget li, .footer-widget li a, #footer-info { font-size: 13px; }
.footer-widget h4 { font-weight: bold; font-style: normal; text-transform: none; text-decoration: none;  }#footer-widgets .footer-widget li:before { top: 8.05px; }										
		
																														
@media only screen and ( min-width: 981px ) {
.footer-widget h4 { font-size: 15px; }
.et_header_style_left #et-top-navigation, .et_header_style_split #et-top-navigation  { padding: 28px 0 0 0; }
.et_header_style_left #et-top-navigation nav > ul > li > a, .et_header_style_split #et-top-navigation nav > ul > li > a { padding-bottom: 28px; }
.et_header_style_split .centered-inline-logo-wrap { width: 55px; margin: -55px 0; }
.et_header_style_split .centered-inline-logo-wrap #logo { max-height: 55px; }
.et_pb_svg_logo.et_header_style_split .centered-inline-logo-wrap #logo { height: 55px; }
.et_header_style_centered #top-menu > li > a { padding-bottom: 10px; }
.et_header_style_slide #et-top-navigation, .et_header_style_fullscreen #et-top-navigation { padding: 19px 0 19px 0 !important; }
.et_header_style_centered #main-header .logo_container { height: 55px; }
#logo { max-height: 36%; }
.et_pb_svg_logo #logo { height: 36%; }
.et-fixed-header#top-header, .et-fixed-header#top-header #et-secondary-nav li ul { background-color: #ffffff; }
.et-fixed-header #top-menu a, .et-fixed-header #et_search_icon:before, .et-fixed-header #et_top_search .et-search-form input, .et-fixed-header .et_search_form_container input, .et-fixed-header .et_close_search_field:after, .et-fixed-header #et-top-navigation .et-cart-info { color: rgba(221,221,221,0.6) !important; }
.et-fixed-header .et_search_form_container input::-moz-placeholder { color: rgba(221,221,221,0.6) !important; }
.et-fixed-header .et_search_form_container input::-webkit-input-placeholder { color: rgba(221,221,221,0.6) !important; }
.et-fixed-header .et_search_form_container input:-ms-input-placeholder { color: rgba(221,221,221,0.6) !important; }
.et-fixed-header #top-menu li.current-menu-ancestor > a,
.et-fixed-header #top-menu li.current-menu-item > a { color: #ffffff !important; }
}
@media only screen and ( min-width: 1350px) {
.et_pb_row { padding: 27px 0; }
.et_pb_section { padding: 54px 0; }
.single.et_pb_pagebuilder_layout.et_full_width_page .et_post_meta_wrapper { padding-top: 81px; }
.et_pb_section.et_pb_section_first { padding-top: inherit; }
.et_pb_fullwidth_section { padding: 0; }
}
		
@media only screen and ( max-width: 980px ) {																			}
@media only screen and ( max-width: 767px ) {
}
</style>
<style class="et_one_font_languages">h1, h2, h3, h4, h5, h6, body, input, textarea, select { font-family: AppleSDGothicNeo-Regular,'Malgun Gothic','맑은 고딕',dotum,'돋움',sans-serif; }</style>
<style id="module-customizer-css">
</style>
	</head>
<body onload="loadPage('menu_load','menu_top.common');" class="post-template-default single single-post postid-25052 single-format-standard et_pb_button_helper_class et_fixed_nav et_show_nav et_cover_background et_pb_gutter windows et_pb_gutters3 et_primary_nav_dropdown_animation_fade et_secondary_nav_dropdown_animation_fade et_pb_footer_columns4 et_header_style_left et_pb_pagebuilder_layout et_full_width_page et_divi_theme logout bid573 chrome ">
<div id='menu_load'></div>
<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="main.circle">동아리 메인<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판 <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="qboard.circle">Q&A</a></li>
            <li><a href="board.circle">동아리 신청게시판</a></li>
          </ul>
        </li>          
        <li><a href="search.circle">동아리 검색<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-search"></span></a></li>
        <li><a href="rounge.circle">동아리 장소 추천<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-globe"></span></a></li>        
      </ul>
    </div>
  </div>
</nav>
	<div id="page-container">
		<div id="et-main-area">
<div id="main-content">
	<div class="container">
		<div id="content-area" class="clearfix">
			<div id="left-area">
				<article id="post-25052" class="et_pb_post post-25052 post type-post status-publish format-standard has-post-thumbnail hentry category-studyroom tag-12 tag-11 tag-14 tag-13 tag-15">
						<div class="et_post_meta_wrapper">
							<h1 class="entry-title">신촌역 모임장소 추천 싼마이</h1>
						<p class="post-meta">스터디룸</p>
						</div>  
				
					<div class="et_pb_section  et_pb_section_0 et_section_regular">
					<div class=" et_pb_row et_pb_row_0">
				
				<div class="et_pb_column et_pb_column_4_4  et_pb_column_0">
				<div class="et_pb_module et_pb_gallery et_pb_gallery_0 et_pb_slider et_pb_gallery_fullwidth et_pb_bg_layout_light clearfix">
				<div class="et_pb_gallery_items et_post_gallery" data-per_page="4">
				<div class="et_pb_gallery_item et_pb_bg_layout_light">
					<div class='et_pb_gallery_image landscape'>
						<a href="${circle}image/장소12.jpg" title="장면1">
						<img src="${circle}image/장소12.jpg" alt="11" />
						<span class="et_overlay"></span>
						</a>
					</div>
				</div>
				<div class="et_pb_gallery_item et_pb_bg_layout_light">
				<div class='et_pb_gallery_image landscape'>
					<a href="${circle}image/장소13.jpg" title="장면2">
					<img src="${circle}image/장소13.jpg" alt="33" />
					<span class="et_overlay"></span>
				</a>
				</div></div><div class="et_pb_gallery_item et_pb_bg_layout_light">
				<div class='et_pb_gallery_image landscape'>
					<a href="${circle}image/장소14.jpg" title="장면3">
					<img src="${circle}image/장소14.jpg" alt="22" />
					<span class="et_overlay"></span>
				</a>
				</div></div><div class="et_pb_gallery_item et_pb_bg_layout_light">
				<div class='et_pb_gallery_image landscape'>
					<a href="${circle}image/장소15.jpg" title="장면4">
					<img src="${circle}image/장소15.jpg" alt="55" />
					<span class="et_overlay"></span>
				</a>
				</div></div><div class="et_pb_gallery_item et_pb_bg_layout_light">
				<div class='et_pb_gallery_image landscape'>
					<a href="${circle}image/장소16.jpg" title="장면5">
					<img src="${circle}image/장소16.jpg" alt="44" />
					<span class="et_overlay"></span>
				</a>
				</div></div></div> 
				</div> 
			</div>  
					
			</div> 
			 <div class=" et_pb_row et_pb_row_1 et_pb_gutters1">
				
				<div class="et_pb_column et_pb_column_1_4  et_pb_column_1">
				
				<div class="et_pb_module et-waypoint et_pb_image et_pb_animation_left et_pb_image_0 et_always_center_on_mobile">
				<img src="${circle}image/장소13.jpg" alt="" />
			
			</div>
			</div>  <div class="et_pb_column et_pb_column_1_4  et_pb_column_2">
				
				<div class="et_pb_module et-waypoint et_pb_image et_pb_animation_left et_pb_image_1 et_always_center_on_mobile">
				<img src="${circle}image/장소14.jpg" alt="" />
			
			</div>
			</div>  <div class="et_pb_column et_pb_column_1_4  et_pb_column_3">
				
				<div class="et_pb_module et-waypoint et_pb_image et_pb_animation_left et_pb_image_2 et_always_center_on_mobile">
				<img src="${circle}image/장소15.jpg" alt="" />
			
			</div>
			</div>  <div class="et_pb_column et_pb_column_1_4  et_pb_column_4">
				
				<div class="et_pb_module et-waypoint et_pb_image et_pb_animation_left et_pb_image_3 et_always_center_on_mobile">
				<img src="${circle}image/장소16.jpg" alt="" />
			
			</div>
			</div>  
					
			</div> 
			 <div class=" et_pb_row et_pb_row_2">
				<div class="et_pb_column et_pb_column_1_2  et_pb_column_5">
				<div class="et_pb_blurb et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_blurb_0 et_pb_blurb_position_top">
				<div class="et_pb_blurb_content">
					
					<div class="et_pb_blurb_container">
						<h4>공간 소개</h4>
					<table style="width: 100%;">
						<tbody>
						<tr>
							<td style="width: 70px; text-align: center;"><strong>가격</strong></td>
								<td>시간당 3,000원 / 1인</td>
							</tr>
							<tr>
								<td style="text-align: center;"><strong>설명</strong></td>
								<td>오랜 경험노하우를 가진 아톰이 &#8220;채움 모임공간&#8221;으로 새롭게 인사드립니다. 오랜기간 운영의 노하우로 업그레이드 된 모습으로 더 넓고 쾌적해진 공간이 되었습니다. 혼자 이용이 가능한 &#8220;스터디카페&#8221;부터 독립 모임공간(회의실, 스터디룸,강의실)이 함께 준비되었습니다.</td>
							</tr>
							<tr>
								<td style="text-align: center;"><strong>운영시간</strong></td>
								<td>24시간</td>
							</tr>
							<tr>
								<td style="text-align: center;"><strong>휴무일</strong></td>
								<td>없음 / 별도 공지</td>
							</tr>
							<tr>
								<td style="text-align: center;"><strong>시설정보</strong></td>
								<td>4인실 이상 독립 공간에 32인치 이상의 대형 모니터가 기본 세팅 (hdmi 케이블 준비됨)되어 있습니다.(무료) 노트북, 캠코더, 프로젝터 모두 대여 가능합니다.(유료) 모든 독립공간의 한쪽 벽면은 &#8220;대형 화이트 유리보드&#8221;가 설치되어 있습니다. (보드마카,지우개 준비됨)</td>
						</tr>
						</tbody>
					</table>
					</div>
				</div>  
			</div>  
			</div>  
			<div class="et_pb_column et_pb_column_1_2  et_pb_column_6">
				<div class="et_pb_blurb et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_blurb_1 et_pb_blurb_position_top">
				<div class="et_pb_blurb_content">
					<div class="et_pb_blurb_container">
						<h4>예약시 주의사항</h4>
					<ul>
						<li>당일 예약은 예약금 없이 예약 확정입니다.</li>
						<li>대여 장비(빔프로젝터, 노트북, 캠코더, 모니터)는 미리 예약 바랍니다.</li>
						<li>변경, 취소는 24시간 이전에 가능합니다.</li>
						<li>최소 예약시간은 2시간입니다.</li>
						<li>예약공간이 공실일 경우 10분전 입실 가능합니다. 별도 대기 공간이 없습니다. 시간 맞춰 와주세요 🙂 일찍 오실 경우 스터디카페에서 시간당 1,000원으로 공부 가능합니다 🙂</li>
						<li>회의,강의,스터디,세미나 모임을 위한 공간입니다. 발성연습, 연기연습,친목모임 등으로 큰 소리로 웃고 박수치고 소리지르는 모임은 이용이 제한됩니다. 용도에 맞게 예약해주세요 🙂</li>
						<li>회의실 내에서 방송 촬영 가능합니다 🙂 촬영장비로 복도 등 공용 공간을 막아 통행에 불편만 주지 않으시면 됩니다:-)</li>
						<li>선예약으로 중복예약이 발생할 경우 승인이 취소될 수 있습니다. 취소시 안내 후 바로 환불처리해드겠습니다.</li>
					</ul>
					</div>
				</div>  
			</div>  
			</div>  
			</div>  
			<div class=" et_pb_row et_pb_row_3">
				  <div class=" et_pb_row et_pb_row_5">
					<div class="et_pb_column et_pb_column_4_4  et_pb_column_10">
					<div class="et_pb_module et_pb_space et_pb_divider et_pb_divider_1"></div>
				</div>  
				</div>  
				<div class=" et_pb_row et_pb_row_6">
					<div class="et_pb_column et_pb_column_4_4  et_pb_column_11">
						<div class="et_pb_text et_pb_module et_pb_bg_layout_light et_pb_text_align_left  et_pb_text_0"></div>  
					</div>  
				</div>  
			</div>  
					</div>  
					<div class="et_post_meta_wrapper"></div>  
				</article>  
						</div>  
					</div>  
	</div>  
</div>  
			<footer id="main-footer">
				
		
				<div id="footer-bottom">
					<div class="container clearfix">
						
				<div id="footer-info"></div>
					</div>	 
				</div>
			</footer>  
		</div>  
	</div>  
	<div id="um_upload_single" style="display:none">
	
</div>
<div id="um_view_photo" style="display:none">
	<a href="#" data-action="um_remove_modal" class="um-modal-close"><i class="um-faicon-times"></i></a>
	<div class="um-modal-body photo">
		<div class="um-modal-photo">
		</div>
	</div>
</div>        
<style type="text/css" id="et-builder-advanced-style">
.et_pb_section_0.et_pb_section { padding-top: 0px; padding-right: 0px; padding-bottom: 54px; padding-left: 0px; }
.et_pb_blurb_2.et_pb_blurb h4, .et_pb_blurb_2.et_pb_blurb h4 a { font-weight: bold;font-size: 24px; }
.et_pb_divider_1:before { border-top-color: #dddddd; }
.et_pb_blurb_3 h4 { margin-bottom:10px; }
.et_pb_blurb_3.et_pb_blurb h4, .et_pb_blurb_3.et_pb_blurb h4 a { font-weight: bold;font-size: 24px; }
body #page-container .et_pb_button_0:hover:before { margin-left:.3em;
						right: auto; margin-left: -1.3em; }
body #page-container .et_pb_button_0:before { content: attr(data-icon); ; font-family: "ETmodules" !important; 
						line-height:1.7em;
						font-size:20px !important;
						opacity:1;
						
						margin-left: -1.3em; right:auto;
						display: inline-block; }
body #page-container .et_pb_button_0:after { display: none; }
body #page-container .et_pb_button_0:hover { 
					
					
					
					letter-spacing:0; }
body #page-container .et_pb_button_0 { 
					font-size:20px;
					padding-left:2em; padding-right: 0.7em; }
.et_pb_blurb_2 h4 { margin-bottom:10px; }
.et_pb_blurb_2.et_pb_blurb { margin-bottom: 0px !important; }
.et_pb_divider_0:before { border-top-color: #ddd; }
.et_pb_row_0.et_pb_row { padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; }
.et_pb_blurb_1 h4 { margin-bottom:10px; }
.et_pb_blurb_1.et_pb_blurb h4, .et_pb_blurb_1.et_pb_blurb h4 a { font-weight: bold;font-size: 24px; }
.et_pb_blurb_0 h4 { margin-bottom:10px; }
.et_pb_blurb_0.et_pb_blurb h4, .et_pb_blurb_0.et_pb_blurb h4 a { font-weight: bold;font-size: 24px; }
.et_pb_row_2.et_pb_row { padding-top: 27px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; }
.et_pb_image_3 { margin-left: 0; }
.et_pb_image_2 { margin-left: 0; }
.et_pb_image_1 { margin-left: 0; }
.et_pb_image_0 { margin-left: 0; }
.et_pb_row_1.et_pb_row { padding-top: 0px; padding-right: 0px; padding-bottom: 27px; padding-left: 0px; }
.et_pb_text_0 h1 { font-family: 'Nanum Square', Helvetica, Arial, Lucida, sans-serif; font-weight: bold; }
@media only screen and ( max-width: 980px ) {
	body #page-container .et_pb_button_0,body #page-container .et_pb_button_0:before { 
								 }
}
@media only screen and ( max-width: 767px ) {
	body #page-container 
	.et_pb_button_0,body #page-container 
	.et_pb_button_0:before {
	}
}
</style><style type="text/css" id="et-builder-page-custom-style">
.et_pb_bg_layout_dark { color: #ffffff !important; } 
.page.et_pb_pagebuilder_layout #main-content { background-color: rgba(255,255,255,0); } 
.et_pb_section { background-color: #ffffff; }
</style>
<link rel='stylesheet' id='nanumsquare-css'  href='${circle}css/nanumsquare.css' type='text/css' media='all' />
<script type='text/javascript' src='${circle}js/frontend-builder-global-functions.js'></script>
<script type='text/javascript' src='${circle}js/cart-fragments.min.js'></script>
<script type='text/javascript' src='${circle}js/jquery.mobile.custom.min.js'></script>
<script type='text/javascript' src='${circle}js/custom.js'></script>
<script type='text/javascript' src='${circle}js/jquery.fitvids.js'></script>
<script type='text/javascript' src='${circle}js/waypoints.min.js'></script>
<script type='text/javascript' src='${circle}js/jquery.magnific-popup.js'></script>
<script type='text/javascript'>
var et_pb_custom = {"ajaxurl":"","":"","et_frontend_nonce":"97584bedff","subscription_failed":"\uc2dc\uae30 \ubc14\ub78d \ud655\uc778\ubd84\uc57c\ub294 \uc544\ub798\ud558\uac00 \uc785\ub825\ud55c \uc815\ud655\ud55c \uc815\ubcf4\uc785\ub2c8\ub2e4.","et_ab_log_nonce":"55ef6c5674","fill_message":"\ub2e4\uc74c \ud544\ub4dc\uc5d0 \uae30\uc785\ud558\uc2ed\uc2dc\uc624 :","contact_error_message":"\ub2e4\uc74c \uc624\ub958\ub97c \uc218\uc815\ud558\uc138\uc694:","invalid":"\uc798\ubabb\ub41c \uc774\uba54\uc77c","captcha":"\ucea1\ucc28","prev":"\uc774\uc804","previous":"\uc774\uc804","next":"\ub2e4\uc74c","wrong_captcha":"\ucea1\ucc28\uc5d0 \uc798\ubabb\ub41c \uc218\ub97c \uc785\ub825\ud588\uc2b5\ub2c8\ub2e4.","is_builder_plugin_used":"","ignore_waypoints":"no","is_divi_theme_used":"1","widget_search_selector":".widget_search","is_ab_testing_active":"","page_id":"25052","unique_test_id":"","ab_bounce_rate":"5","is_cache_plugin_active":"no","is_shortcode_tracking":""};
</script>
<script type='text/javascript' src='${circle}js/frontend-builder-scripts.js'></script>
<script type='text/javascript' src='${circle}js/core.min.js'></script>
<script type='text/javascript' src='${circle}js/widget.min.js'></script>
<script type='text/javascript' src='${circle}js/position.min.js'></script>
<script type='text/javascript' src='${circle}js/menu.min.js'></script>
<script type='text/javascript' src='${circle}js/wp-a11y.min.js'></script>
<script type='text/javascript'>
var uiAutocompleteL10n = {"noResults":"\uacb0\uacfc \uc5c6\uc74c.","oneResult":"1\uacb0\uacfc \ucc3e\uc74c. \uc704\uc544\ub798\ub85c \uc774\ub3d9\ud558\ub824\uba74 \ud654\uc0b4\ud45c \ud0a4\ub97c \uc0ac\uc6a9\ud558\uc138\uc694.","manyResults":"%d \uacb0\uacfc \ucc3e\uc74c. \uc704 \uc544\ub798\ub85c \uc774\ub3d9\ud558\ub824\uba74 \ud654\uc0b4\ud45c \ud0a4\ub97c \uc0ac\uc6a9\ud558\uc138\uc694.","itemSelected":"\uc544\uc774\ud15c \uc120\ud0dd\ub428."};
</script>
	</body>
</html>
	
</body>
</html>