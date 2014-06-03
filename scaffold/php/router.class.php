<?php

  class Router {

    /*
    **  Maps routes as conditional_function => view
    **  a default is also required and called if no
    **  other routes match
    **
    **  @example:
    **
    **    Router::map( array(
    **      'is_single' => 'single',
    **      'is_page'   => array( '123' => 'page',
    **                            '345' => 'archive' ),
    **      'default'   => 'index'
    **    ));
    **
    **  @param $routes_array [Array]
    **  @return [Void]
    */
    public static function map ( $routes_array, $format='default' ) {
      if ( $format != 'default' &&
         ( !isset($_GET['format']) || $format != $_GET['format'] ) ) {
        return;
      }

      $default = $routes_array['default'];
      unset( $routes_array['default'] );

      foreach( $routes_array as $conditional => $args ) {
        if( is_array($args) ) {
          foreach( $args as $id => $view ) {
            if( call_user_func_array( $conditional, $id ) ) {
              View::render( $view, $format );
              exit();
            }
          }
        } else {
          if( call_user_func($conditional) ) {
            View::render( $args, $format );
            exit();
          }
        }
      }

      View::render( $default, $format );
      exit();
    }

  }

?>