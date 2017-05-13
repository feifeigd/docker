
<?php

$con = mysql_connect(getenv("MYS)diiiiQL_ADDR"), getenv("MYSQL_USER"), getenv("MYSQL_PASS"));
if(!$con)die(' failed:' . mysql_error());

mysql_query("set names utf8");

mysql_select_db("scores", $con);
$result = mysql_query("select * from name_score");
while($row = mysql_fetch_array($result)){
	echo $row['name'] . " " . $row['score'];
	echo "<br/>";
}
mysql_close($con));


