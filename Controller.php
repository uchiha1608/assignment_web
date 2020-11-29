<?php
class Controller extends Database{

	public static $servername = 'localhost';
	public static $dbname = 'family_tree';
	public static $username = 'root';
	public static $password = 'abcdef1234';

	public static function CreateView($viewName){
		require_once("./Views/$viewName.html");
	}
}
?>