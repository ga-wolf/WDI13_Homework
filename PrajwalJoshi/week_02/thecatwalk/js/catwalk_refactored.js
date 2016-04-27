var WalkingCatTypingTutor = {
      catImage : document.getElementsByTagName('img')[0],
      ratImage : document.getElementsByTagName('img')[1],
      input : document.getElementById('input'),
      body: document.getElementsByTagName('body')[0],
      scores : document.getElementsByTagName('span'),
      container : document.getElementsByClassName('container')[0],
      width: window.innerWidth,
      ascii: 0,
      lettersTyped : 0,
      correct : 0,
      mistakes : 0,

      initCss :function(){
        body.style.backgroundColor = '#A4A4A4';
        container.style.margin = '200px 400px';
        catImage.style.left = 0;
        ratImage.style.left = '200px';
        ratImage.style.top = '60px';
        //font
        WebFontConfig = {
          google: { families: [ 'Oswald::latin' ] }
        };
        (function() {
          var wf = document.createElement('script');
          wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
          wf.type = 'text/javascript';
          wf.async = 'true';
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(wf, s);
         })();
          body.style.fontFamily = 'Oswald';
      }


}
