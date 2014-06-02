<?php

  class Asset {

    /*
    **  Get a url for a script with the cache busting string
    **
    **  @param $script_name [String] name of the script, without the .js
    **  @return [String] url of the script
    */
    public static function script_url( $script_name ) {
      return self::url( $script_name.'.js', 'scripts' );
    }

    /*
    **  Get a url for a stylesheet with the cache busting string
    **
    **  @param $stylesheet_name [String] name of the stylesheet, without the .css
    **  @return [String] url of the stylesheet
    */
    public static function stylesheet_url( $stylesheet_name ) {
      return self::url( $stylesheet_name.'.css', 'css' );
    }


    /*
    **  Get a url for an asset with it's filename and directory
    **  relative to '/assets/'
    **
    **  @param $asset [String] name of the asset includeing file ext.
    **  @param $directory [String] directory relative to /assets
    **  @return [String] url of the stylesheet
    */
    public static function url ( $asset, $directory ) {
      $pathinfo  = pathinfo( $directory.'/'.$asset );

      $mod_time = filemtime( THEME_DIR.'/assets/'.$directory.'/'.$asset );
      $filename = $pathinfo['filename'];
      $ext      = $pathinfo['extension'];

      return THEME_URL.'/assets/'.$pathinfo['dirname'].'/'.$filename.'.'.$mod_time.'.'.$ext;
    }

  }

?>