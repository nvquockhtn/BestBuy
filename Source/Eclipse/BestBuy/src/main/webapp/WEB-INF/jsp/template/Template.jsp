<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title><tiles:insertAttribute name="title" /></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css" rel="stylesheet" media="screen" /> <!-- General style -->
        <link href="${pageContext.request.contextPath}/resources/css/prettyPhoto.css" type="text/css" rel="stylesheet" media="screen"><!-- prettyPhoto -->
        <link href="${pageContext.request.contextPath}/resources/css/tipsy.css" type="text/css" rel="stylesheet" media="screen"><!--tooltip-->
        <link href="${pageContext.request.contextPath}/resources/css/jquery.jqzoom.css" type="text/css" rel="stylesheet" media="screen"><!--zoom-->
        <link href="${pageContext.request.contextPath}/resources/css/camera.css" type="text/css" rel="stylesheet" media="screen"><!--camera-->
        <link href="${pageContext.request.contextPath}/resources/css/jcarousel.css" type="text/css" rel="stylesheet" media="screen" /> <!-- list_work -->
        <link href="${pageContext.request.contextPath}/resources/css/mystyle.css" type="text/css" rel="stylesheet" media="screen" /> <!-- list_work -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700|Arvo:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" />
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.8.2.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/css3-mediaqueries.js"></script><!--mediaqueries-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-1.7.min.js"></script><!--modernizr-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script><!-- prettyPhoto -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.tipsy.js"></script><!--tooltip-->
        <script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js'></script> <!--camera slider-->
        <script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/camera.min.js'></script> <!--camera slider-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.jcarousel.min.js"></script> <!-- list_work -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-hover-effect.js"></script><!--Image Hover Effect-->
        <script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/jquery.hoverIntent.minified.js'></script><!--menu-->
        <script type='text/javascript' src='${pageContext.request.contextPath}/resources/js/jquery.dcmegamenu.1.3.3.js'></script><!--menu-->
        <script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/jquery.tweet.js"></script><!--twitter plugin-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.quovolver.js"></script><!--blockquote-->
        <script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/jquery.jqzoom-core.js"></script><!--image zoom-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/organictabs.jquery.js"></script><!--tabs-->        
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/productview.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom.js"></script><!--custom-->
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        
        <!--MENU-->
        <script type="text/javascript">
            $(document).ready(function($) {
                $('#mega-menu-3').dcMegaMenu({
                    rowItems: '2',
                    speed: 'fast',
                    effect: 'fade'
                });
            });
        </script>
		<script type="text/javascript">
		$(document).ready(function() {
			$('.jqzoom').jqzoom({
		            zoomType: 'innerzoom',
		            preloadImages: false,
					zoomWidth: 300,
		            alwaysOn:false
		        });
		});
		</script>
        <script type="text/javascript">
            $(function() {
                $("#tab").organicTabs({
                    "speed": 200
                });
            });
        </script>
    </head>

    <body>
        <div id="page_wrap">
            <header>
                <!-- TemplateBeginEditable name="header" -->
                <tiles:insertAttribute name="header" />
                <!-- TemplateEndEditable -->        
            </header>
            <div id="container">
                <!-- TemplateBeginEditable name="menu" -->
                <tiles:insertAttribute name="menu" />
                <!-- TemplateEndEditable -->
                <div class="content-wrap">
                    <!-- TemplateBeginEditable name="slider" -->
                    <tiles:insertAttribute name="slider" />
                    <!-- TemplateEndEditable -->

                    <!-- TemplateBeginEditable name="introduction" -->
                    <tiles:insertAttribute name="introduction" />
                    <!-- TemplateEndEditable -->


                    <!-- start content here -->
                    <!-- TemplateBeginEditable name="content_main" -->
                    <tiles:insertAttribute name="content_main" />
                    <!-- TemplateEndEditable -->
                    <!-- end content here -->

                    <!-- TemplateBeginEditable name="free_shipping" -->
                    <tiles:insertAttribute name="free_shipping" />
                    <!-- TemplateEndEditable -->		  
                </div>
                <!--end:content-wrap-->
                <footer>
                    <!-- TemplateBeginEditable name="footer" -->
                    <tiles:insertAttribute name="footer" />
                    <!-- TemplateEndEditable -->            
                </footer>
            </div>
            <!--end:container-->
        </div><!--end:page_wrap-->
        <script type="text/javascript">
            //------JCAROUSEL-------------
            function mycarousel_initCallback(carousel) {
                // Disable autoscrolling if the user clicks the prev or next button.
                carousel.buttonNext.bind('clicsk', function() {
                    carousel.startAuto(0);
                });
                carousel.buttonPrev.bind('click', function() {
                    carousel.startAuto(0);
                });
                // Pause autoscrolling if the user moves with the cursor over the clip.
                carousel.clip.hover(function() {
                    carousel.stopAuto();
                }, function() {
                    carousel.startAuto();
                });
            }
            ;
            jQuery(document).ready(function() {
                jQuery('#mycarousel, #mycarouselnew').jcarousel({
                    auto: 0,
                    wrap: 'last',
                    initCallback: mycarousel_initCallback
                });
            });
        </script>    
        <script type="text/javascript">
            jQuery(function($) {
                $(".tweet").tweet({
                    join_text: "auto",
                    username: "html5awesome",
                    avatar_size: 48,
                    count: 3,
                    auto_join_text_default: " we said, ",
                    auto_join_text_ed: " we ",
                    auto_join_text_ing: " we were ",
                    auto_join_text_reply: " we replied ",
                    auto_join_text_url: " we were checking out ",
                    loading_text: "loading tweets..."
                });
            });
        </script>
        <script type="text/javascript">(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "../../../connect.facebook.net/en_US/all.js#xfbml=1";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
    </body>
</html>
