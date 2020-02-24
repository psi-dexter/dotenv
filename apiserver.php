<?php

   $database_host = "localhost";
   $database_user = "infowaste";
   $database_password = "nfowaste";
   $database_name = "nanoent_infowaste";
   $db_access_token = "1234567890";

   $return_format = (isset($_REQUEST['return_format'])) ? $_REQUEST['return_format'] : 'json';
   $res = array('success' => true, 'errormsg' => '', 'data' => '');
   try
   {
       $filename = (isset($_FILES['uploadedfile']['name'])) ? $_FILES['uploadedfile']['name'] : '';
       if(trim($filename))
       {
            $upload_dir = 'data';
            $ar = explode('___', basename($_FILES['uploadedfile']['name']));
            if(sizeof($ar) != 3) throw new Exception('Bad file name '.basename($_FILES['uploadedfile']['name']));
            if(!trim($ar[0]) || !trim($ar[1])) throw new Exception('Bad folder name');
            if(!trim($ar[2])) throw new Exception('Bad file name '.$ar[2]);
            if(!file_exists($upload_dir))
            {
                if(!@mkdir($upload_dir, 0777)) throw new Exception('Can not create folder '.$upload_dir);
            }
            $upload_dir .= '/'.trim($ar[0]);
            if(!file_exists($upload_dir))
            {
                if(!@mkdir($upload_dir, 0777)) throw new Exception('Can not create folder '.$upload_dir);
            }
            $upload_dir .= '/'.trim($ar[1]);
            if(!file_exists($upload_dir))
            {
                if(!@mkdir($upload_dir, 0777)) throw new Exception('Can not create folder '.$upload_dir);
            }
            $upload_dir .= '/'.trim($ar[2]);
            if(file_exists($upload_dir)) @unlink($upload_dir);
            if(!move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $upload_dir))
                throw new Exception('Can not upload file '.$upload_dir);
       } else
       {
           $params = $_REQUEST;
           $action = (isset($_REQUEST['action'])) ? $_REQUEST['action'] : '';
           if(!$action) throw new Exception('Action not found.');
           $enc_request = (isset($_REQUEST['enc_request'])) ? $_REQUEST['enc_request'] :  '';
           $params = @json_decode(trim(base64_decode($enc_request)));
           if($params == false) throw new Exception('Request is not valid');
           $params = (array)$params;
           
           // Connect user
           $s_key = '';
           if(isset($params['db_access_token']))
           {
               $s_key = $params['db_access_token'];
           }
           if($s_key !== $db_access_token) throw new Exception('Bad user.');
           
           $controller = new apiController($database_host, $database_user, $database_password, $database_name);
           if($action === 'checkconnection') throw new Exception('ok');
           if(method_exists($controller, $action) === false ) throw new Exception('Action is invalid.');
           
           $controller->request = $params;
           $res['data'] = $controller->$action();
       }
       
   } catch(Exception $e)
   {
       $res['success'] = 0;
       $res['errormsg'] = $e->getMessage();
   }
   switch($return_format)
   {
       case 'json': print(json_encode($res)); exit; break;
       case 'xml':  print(arrayToXml($res)); exit; break;
   }

class apiController
{
public    $request = array();
protected $conn;

public function __construct($host = '', $user = '', $psw = '', $dbname = '')
{
   @$this->conn = mysqli_connect($host, $user, $psw, $dbname);
   if(!$this->conn) throw new Exception(mysqli_connect_errno().' '.mysqli_connect_error());
   @mysqli_query($this->conn, "SET CHARACTER SET utf8_general_ci");
   @mysqli_query($this->conn, "set names utf8");
   @mysqli_query($this->conn, "SET collation_connection = utf8_general_ci");
}

public function select()
{
   $sql = (isset($this->request['sql'])) ? $this->request['sql'] : '';
   $array = array();
   if(is_array($sql))
   {
       foreach($sql as $value)
       {
           $arr = $this->selectOne($value);
           $array[] = (sizeof($arr) > 0) ? $arr[0] : array();
       }
   } else
   {
       $array = $this->selectOne($sql);
   }
   mysqli_close($this->conn);
   return $array;
}

public function selectOne($sql = '')
{
   if(!trim($sql)) throw new Exception('Empty sql.');
   $offset = (isset($this->request['offset'])) ? (int)$this->request['offset'] : 0;
   $limit = (isset($this->request['limit'])) ? (int)$this->request['limit'] : 20;
   if($limit) $sql .= ' LIMIT '.$offset.', '.$limit;
   
   $result = mysqli_query($this->conn, $sql);
   if(!$result) throw new Exception(mysqli_error($this->conn));
   $rows   = mysqli_num_rows($result);
   if($rows <= 0)
   {
       mysqli_free_result($result);
       mysqli_close($this->conn);
       return array();
   }
   $array = array();
   $fields = mysqli_num_fields($result);
   while ($row = mysqli_fetch_row($result))
   {
       $onerow    = array();
       for ($i=0; $i < $fields; $i++) $onerow[] = $row[$i];
       $array[] = $onerow;
   }
   mysqli_free_result($result);
   return $array;
}

public function execute()
{
   $sql = (isset($this->request['sql'])) ? $this->request['sql'] : '';
   $array = array();
   if(is_array($sql))
   {
       foreach($sql as $value)
       {
           $array = $this->executeOne($value);
       }
   } else
   {
       $array = $this->executeOne($sql);
   }
   mysqli_close($this->conn);
   return $array;
}

public function executeOne($sql = '')
{
   $lastid = '';
   $result = null;
   if(!trim($sql)) throw new Exception('Empty sql.');
   $str = strtoupper($sql);
   if((strpos($str, 'CREATE') !== false)
       && (strpos($str, 'TABLE') !== false)
   )
   {
       $sql = str_ireplace ('AUTOINCREMENT' , 'AUTO_INCREMENT', $sql);
       $sql = str_ireplace ('COLLATE NOCASE' , '', $sql);
   }
   
   if((strpos($str, 'INSERT') !== false)
       && (strpos($str, 'INTO') !== false)
       && (strpos($str, 'VALUES') !== false)
       && (strpos($str, '(0,') !== false)
   )
   {
       $result = mysqli_query($this->conn, 'SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO"');
       if(!$result) throw new Exception(mysqli_error($this->conn));
   }
   $result = mysqli_query($this->conn, $sql);
   if(!$result) throw new Exception(mysqli_error($this->conn));
   
   if((strpos($str, 'INSERT') !== false)
       && (strpos($str, 'INTO') !== false)
       && (strpos($str, 'VALUES') !== false)
   )
   {
       $result = mysqli_query($this->conn, 'SELECT LAST_INSERT_ID()');
       if (mysqli_num_rows($result) > 0)
       {
           while ($row = mysqli_fetch_row($result))
           {
               $lastid = $row[0];
               break;
           }
       }
   }
   $array = array();
   $array[] = array($lastid);
   if($result !== true) mysqli_free_result($result);
   return $array;
}

public function getFieldFromSql($sql = '', $def = '')
{
    if(!$sql) return $def;
    $this->request['offset'] = 0;
    $this->request['limit'] = 1;
    $arr = $this->selectOne($sql);
    if(sizeof($arr) == 0) return $def;
    if(sizeof($arr[0]) == 0) return $def;
    return $arr[0][0];
}

public function getFieldsFromSql($sql = '', $def = '')
{
    if(!$sql) return $def;
    $this->request['offset'] = 0;
    $this->request['limit'] = 1;
    $arr = $this->selectOne($sql);
    if(sizeof($arr) == 0) return $def;
    return $arr[0];
}

public function getArrayFromSql($sql = '')
{
    if(!$sql) return array();
    $this->request['offset'] = 0;
    $this->request['limit'] = 100000;
    return $this->selectOne($sql);
}

public function runScript()
{
    $php = (isset($this->request['sql'])) ? trim($this->request['sql']) : '';
    $nano = $this;
    $php_res = @eval($php);
    if($this->conn) @mysqli_close($this->conn);
    if(is_array($php_res))
    {
        if(sizeof($php_res) > 0)
        {
            if(is_array($php_res[0])) return $php_res;
        }
        return array($php_res);
    }
    $array = array();
    $array[] = array($php_res);
    return $array;
}

}

?>

