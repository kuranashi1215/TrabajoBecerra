<?php
    //Controler user
    require_once("controller/userController.php");
    require_once("controller/plantController.php");

    //Controler aprendiz
    require_once("controller/aprendizController.php");

    //Controler Matricula
    require_once("controller/matriculaController.php");
    
    //Models user
    require_once("model/dao/userDao.php");
    require_once("model/dto/userDto.php");
    
    //Models Aprendiz
    require_once("model/dao/aprendizDao.php");
    require_once("model/dto/aprendizDto.php");

    //Models Matricula
    require_once("model/dao/matriculaDao.php");
    require_once("model/dto/matriculaDto.php");


    //Conexion
    require_once("model/conexion.php");

    //Arranque
    $objArranque = new Planti();
    $objArranque -> getIntro();
    
?>