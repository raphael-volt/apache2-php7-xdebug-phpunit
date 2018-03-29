<?php

use PHPUnit\Framework\TestCase;

class SampleTest extends TestCase
{
    public function testSQlite()
    {
        $filename = "/shared/sample-test.sqlite";
        $pdo = new PDO("sqlite:$filename", null, null, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->assertFileExists($filename);
        $pdo = null;
        unlink($filename);        
        
        $this->assertFileNotExists($filename);
    }

    public function testMysql() 
    {
        $dsn = "mysql:host=dev-lamp-stack-db; dbname=sample_db;";
        $pdo = new PDO(
            $dsn, "dbuser", "dbuserpwd", 
            array(
                PDO::MYSQL_ATTR_INIT_COMMAND=>"set names utf8"
            )
        );
        $success = $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $this->assertTrue($success);
    }
}