/*
* {'explicit': 0,
 'lyrics_body': "'Cause I, I, I'm in the stars tonight\n"
                'So watch me bring the fire, and set the night alight\n'
                '\n'
                "Shoes on, get up in the morn'\n"
                "Cup of milk, let's rock and roll\n"
                'King Kong, kick the drum\n'
                'Rolling on like a Rolling Stone\n'
                "Sing song when I'm walking home\n"
                'Jump up to the top, LeBron\n'
                'Ding-dong, call me on my phone\n'
                'Ice tea and a game of ping pong\n'
                '\n'
                "This is getting heavy, can you hear the bass boom? I'm ready "
                '(woo-hoo)\n'
                'Life is sweet as honey, yeah, this beat cha-ching like money, '
                'huh\n'
                "Disco overload, I'm into that, I'm good to go\n"
                "I'm diamond, you know I glow up\n"
                "Hey, so let's go\n"
                '\n'
                "'Cause I, I, I'm in the stars tonight\n"
                'So watch me bring the fire, and set the night alight (hey)\n'
                'Shining through the city with a little funk and soul\n'
                "So I'ma light it up like dynamite, woah-oh-oh\n"
                '\n'
                '...\n'
                '\n'
                '******* This Lyrics is NOT for Commercial use *******\n'
                '(1409620463618)',
 'lyrics_copyright': 'Lyrics powered by www.musixmatch.com. This Lyrics is NOT '
                     'for Commercial use and only 30% of the lyrics are '
                     'returned.',
 'lyrics_id': 23190983,
 'pixel_tracking_url': 'https://tracking.musixmatch.com/t1.0/m_img/e_1/sn_0/l_23190983/su_0/rs_0/tr_3vUCAF6swY4PCwrV-jA-jtKisow2zXI_UIiBSfAwkTuPyJjUHdy7sOF6qK-ntkhesX5w1bsUri5g8iVSc7N9WnrA3-H4qhVV-PVhJ5bHFzESGpgg2kFVXGxp8mrVwnagOkuXzsxQXE6EJKG3jG5hZohUlxXXlmIHP1jnt4ojayetrtuFlC8XE0zmsRbpnSyKBeiUxlz07DjUhDMeyxf1T8NrstddFB6YalwUu30vW_Snn8ixqe3xejUDfqCKsK58Yl0NQnzbUlfCrBSK2DY5qnFoSSX4NNMnkMrgycWkSEPk_Mt3cjzDHZszvf1t7AzmemtA3xxuMpNkQi4TTER-8GU7weVbV9AxJiYlMZ-SlB8FoBwpBdka98qNjTQqiBwrYxlSu7xneWGd0OUvFTjZWk84C7nw1Z7jlcelEjXuDC7OcFts1IuZMS3PuD2vsRI/',
 'script_tracking_url': 'https://tracking.musixmatch.com/t1.0/m_js/e_1/sn_0/l_23190983/su_0/rs_0/tr_3vUCAABOjAu3bD0CpcAOs8ud7CAVlHVvHM16OzfV5Zxfsv8xzk1ZqYhbm7nMyavxuVVv0TyH02RYyy4QXrdsE-GRZ93Yy_glgJyxT6hzDrHQVlcEaNucYY8ZM9HVBdiay5OhyyPGOkyfGh3b6SnSML_0WQ1JhEj-TdS66rdbSmdmAyKl9DBNuwLE8CNrMlkGatghc7YJqocZ1fjU_sPuzsA0z_y5O617i9fcTfJGFMkhicfT8js3SDqXT7IN9aQUNQhB3gHnYUtHvUdQMzwsrJanSmf86unZR5ZXjsRhWXhK01aOqphxFMc1UfZNlx6Q3V3U-9fU9NzzAZ8A4Vtds5bnstJFeHrXeUdkokALf_8kK7ruAlNNXtL3MW5ikOQFiFpV4ZYt3JY-Yxs8gcXv7xC8wYSebr0bdNAtwYMWNPC83QzlZ641mEoIPTPZnEE/',
 'updated_time': '2020-08-27T20:16:07Z'}
*/
class Lyrics {
  String body, copyright, pixelTrackingURL, scriptTrackingURL, updatedTime;
  bool isExplicit;
  int id;

  Lyrics.fromMap(Map<String, dynamic> map) {
    body = map['lyrics_body'];
    isExplicit = map['explicit'] == 1;
    copyright = map['lyrics_copyright'];
    id = map['lyrics_id'];
    pixelTrackingURL = map['pixel_tracking_url'];
    scriptTrackingURL = map['script_tracking_url'];
    updatedTime = map['updated_time'];
  }
}