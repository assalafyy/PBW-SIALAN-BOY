<?php
$aksi="modul/mod_carabeli/aksi_about.php";
switch($_GET[act]){
  // Tampil about
  default:
    $sql  = mysql_query("SELECT * FROM modul WHERE id_modul='2'");
    $r    = mysql_fetch_array($sql);

    echo "<h2>Kelompok XX</h2>
          <form method=POST enctype='multipart/form-data' action=$aksi?module=about&act=update>
          <input type=hidden name=id value=$r[id_modul]>
          <table>
         <tr><td>Kelompok XX </td><td><textarea name='isi' style='width: 560px; height: 250px;'>$r[static_content]</textarea></td></tr>
         <tr><td colspan=2><input type=submit value=Update>
                           <input type=button value=Batal onclick=self.history.back()></td></tr>
         </form></table>";
    break;  
}
?>
