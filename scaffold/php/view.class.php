<?php

  class View {

    /*
    **  Include a layout with the view passed, intended to
    **  wrap the chosen view in the chosen layout
    **
    **  @param $view [String] name of the view to render
    **  @param $layout [String] default: "default", layout to use
    **  @return [Void]
    */
    public static function render( $view, $layout = "default" ) {
      include ( 'layouts/' . $layout . '.php' );
    }

    /*
    **  Include a view
    **
    **  @param $view [String] view to include
    **  @return [Void]
    */
    public static function template( $view ) {
      include ( 'views/' . $view . '.php' );
    }

    /*
    **  Include Partial
    **
    **  @param $partial [String] partial to include
    **  @return [Void]
    */
    public static function partial( $partial, $data=array() ) {
      extract($data);
      include ( 'views/partials/' . $partial . '.php' );
    }

  }

?>