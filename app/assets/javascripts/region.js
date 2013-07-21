/* Place all the behaviors and hooks related to the matching controller here.
 All this logic will automatically be available in application.js.
 You can use CoffeeScript in this file: http://coffeescript.org/
*/
        
function play_song(index){
			R.ready(function() {
        R.player.play({
            source: $('#play'+index).data('rdio')
        });
      });
};