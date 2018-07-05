<?php 
  error_reporting(0);
  session_start();	
  include "config/koneksi.php";
	include "config/fungsi_indotgl.php";
	include "config/fungsi_combobox.php";
	include "config/library.php";
  include "config/fungsi_autolink.php";
  include "config/fungsi_rupiah.php";
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Welcome to Pelelangan</title>
	<link rel="shortcut icon" type="image/x-icon" href="template/images/esa unggul.png" />
	<link rel="stylesheet" type="text/css" href="template/css/style.css"  media="screen" />
	<link rel="stylesheet" type="text/css" href="template/css/common.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="template/css/button.css" media="screen" />
	<script src="template/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="template/js/slides.min.jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$('.slides').slides({
				preload: true,
				generatePagination: true,
				play:3000
			});
		});
	</script>
</head>
	<body>
<!--Wrapper-->
<div id="wrapper"> 
      <!--Page-->
      <div class="page shadow"> 
    <!--Header-->
    <div id="header">
          <div class="primary-section">
        <div class="logo"><img height = "75px" width ="200px" src="template/images/logologo.png" /></div>
        <div class="header-aside"> 
          <ul>
		<?php
		if ($_SESSION[email]=="") {
			echo "
			<li class='border'><a href='media.php?module=login' class='log'> login </a></li>
			<li><a href='media.php?module=register' class='user'>Sign Up</a></li>
			";
		}
		else {
			echo "<li class='border'><a href='logout.php' class='log'> Logout </a></li>";
		}
		?>
            <li class="carts"><a href="media.php?module=keranjangbelanja" class="cart">Belanjamu</a></li>
          </ul>
            </div>
      </div>
          <div class="nav-section">
        <ul class="navigation">
              <li class="home"><a href="media.php?module=home" class="home">Home </a></li>
              <li><a href="media.php?module=profilkami">Profil </a></li>
              <li><a href="media.php?module=carabeli">Cara Menjual</a></li>
              <li><a href="media.php?module=keranjangbelanja">Keranjang Belanja </a></li>
              <li><a href="media.php?module=pemesanan">Pemesanan Barang</a></li>
			  <li><a href="media.php?module=about">Tentang Kami</a></li>
            </ul>
        </div>
    <!--Header--> 
    <!--Content-->
    <div id="content">
          <div class="sidebar">
		  
	<?php
	if ($_SESSION[email] !="") {
	echo "
        <div class='latest-product'>
              <h2>Your Menu</h2>
              <ul class='info'>
			  <img src='template/images/1384271379_Admin.png' />
			  <li><a href='media.php?module=profilKustomer'>My Profil</a></li>
			  <li><a href='media.php?module=keranjangbelanja'>Shoping Cart<img src='template/images/cart.gif' /></a></li>
			  ";
			 echo "<div style='color:#E1473D;border:1px solid #E78686;padding:10px;background:#FFE1E1;'>";
			  include "item.php";
			 echo "</div>";
	echo "
			  
			  <li><a href='logout.php'>Logout</a></li>
          </ul>
             </div>
		";
			}
	?>
        <div class="latest-product">
              <h2>Produk</h2>
              <ul class="info">
      <?php
      $best=mysql_query("SELECT * FROM produk ORDER BY dibeli DESC LIMIT 3");
      while($a=mysql_fetch_array($best)){
        $harga = format_rupiah($a[harga]);
		    echo "<li><img src='foto_produk/small_$a[gambar]' height='50' width='30' />
					<div class='p-info'><a href='media.php?module=detailproduk&id=$a[id_produk]'>$a[nama_produk]</a></div>			
				</li>
			";
      }

        ?>
          </ul>
             </div>
       
        <div class="latest-product f-des">
<div class="plugin">             
              <div id="fb-root"></div>
              <div class="fb-like-box" data-href="http://www.facebook.com/webgranth" data-width="289" data-show-faces="true" data-stream="false" data-header="true"></div>
</div>            </div>
      </div>
          <div class="content-right" >
	<?PHP include "tengah.php";?> 
      </div>
     </div>
    <!-- Content--> 
  </div>
      <!--Footer-->
      <div id="footer">
    <div class="footer-top">
    
    <div class="page">
          <div class="footer-bottom">
        <div class="copyright">
              <ul>
            <li>"Kelompok XX &copy; 2018</li>
            <li><a href="#" class="select"> </a> All Rights Reserved.</li>
            <li class="last"></li>
          </ul>
            </div>
        <div class="social-icon">
              <ul>
      </div>
        </div>
  </div>
      <!--Footer--> 
    </div>
<!--Wrapper-->
</body>
</html>
