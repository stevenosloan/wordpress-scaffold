<?php

  /*  Setup include paths
  ------------------------------------------------- */

  define( 'THEME_DIR', get_template_directory() );
  define( 'THEME_URL', get_bloginfo('template_url') );
  set_include_path( THEME_DIR );


  /* Setup environment specific details
  ------------------------------------------------- */

  require_once 'config/env.php';

  if ( ENV == 'development' ) {
    error_reporting(E_ALL);
  }


  /* Setup autoload for helpers & lib files
  ------------------------------------------------- */

  $_load_paths = array(
    'views/helpers',
    'php'
  );

  spl_autoload_register( function ( $class_name ) {
    global $_load_paths;
    foreach ( $_load_paths as $load_path ) {
      if ( file_exists( THEME_DIR . '/' . $load_path.'/'.$class_name.'.php' ) ) {
        require_once $load_path.'/'.$class_name.'.php';
        return;
      } else if ( file_exists( THEME_DIR.'/'$load_path.'/'.strtolower($class_name).'.php') ) {
        require_once $load_path.'/'.strtolower($class_name).'.php';
        return;
      }
    }
  });


  /*  Setup Router
  ------------------------------------------------- */

  Router::map( array(
    'is_404'     => '404',
    'default'    => 'index'
  ));

?>