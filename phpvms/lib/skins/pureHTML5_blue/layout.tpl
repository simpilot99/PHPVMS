<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=7">

<title><?php echo $page_title; ?></title>

<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/pureHTML5_blue/styles/style.css" />

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" />

<?php echo $page_htmlhead; ?>

<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/pureHTML5_blue/styles/html5.css" />

<!-- JS BELOW -->



<!-- JS ABOVE -->

</head>
<body>

<?php echo $page_htmlreq ?>

<section id="background-gradient"></section>

<section id="pageWrap">

<nav>
	<?php Template::Show('core_navigation.tpl'); ?>	 
</nav>

<header>
	<?php Template::Show('core_header.tpl'); ?>	 
</header>

<section class="clearfix" id="contentWrap">
	<?php echo $page_content; ?>
</section>

<footer>
	<?php Template::Show('core_footer.tpl'); ?>
</footer>

</section>

</body>
</html>