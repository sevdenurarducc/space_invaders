space_invaders
=====

[Open this project in 8bitworkshop](https://8bitworkshop.com/latest/?platform=verilog&githubURL=https%3A%2F%2Fgithub.com%2Fsevdenurarducc%2Fspace_invaders&file=space_invaders.v).

## Dosya yapısı

| Dosya | Görev | Sahip |
|---|---|---|
| `space_invaders.v` | Ana dosya, tüm modülleri bağlar | Sevde – Tur 1, 6, 9 |
| `hvsync_generator.v` | Hazır görüntü senkron modülü | 8bitworkshop örneği |
| `frame_tick.v` | Karede bir kez 1 olan darbe | Sevde – Tur 1 |
| `game_fsm.v` | Ana oyun FSM'si | Sevde – Tur 1, 6 |
| `collision.v` | Çarpışma kontrolleri | Sevde – Tur 6 |
| `lives.v` | Can sayacı | Sevde – Tur 6 |
| `edge_detect.v` | Ateş tuşu için tek darbe | Mine – Tur 2 |
| `debounce.v` | Tuş titreşimini temizler | Mine – Tur 2 |
| `player.v` | Gemi hareketi + gemi çizimi | Mine – Tur 2 |
| `bullet.v` | Oyuncu mermisi FSM'si + çizimi | Mine – Tur 5 |
| `alien_formation.v` | Uzaylı dizisi + hareket FSM'si | Şefikullah – Tur 3, 7 |
| `alien_bullet.v` | Uzaylı mermileri | Şefikullah – Tur 7 |
| `lfsr.v` | Rastgele sayı üreteci | Şefikullah – Tur 7 |
| `sprite_rom.v` | Uzaylı ve rakam desenleri | Alperen – Tur 4, 8 |
| `renderer.v` | Katmanları birleştirip renk üretir | Alperen – Tur 4, 8 |
| `score.v` | BCD skor sayacı | Alperen – Tur 8 |
| `test_*.v` | Herkesin kendi test dosyaları (ör. `test_player_top.v`) | Herkes |

Her `.v` dosyası `` `ifndef `` koruması içerir, böylece hem `space_invaders.v`
hem de `test_*.v` dosyaları aynı modülü güvenle `` `include `` edebilir.

## Oyun kuralları

_TODO_

## Sinyal tablosu

Modüller arası sinyaller (taslak — port değiştiren kişi burayı günceller):

| Sinyal | Genişlik | Üreten | Kullanan |
|---|---|---|---|
| `hpos`, `vpos` | 9 | hvsync_generator | çizim yapan tüm modüller |
| `display_on` | 1 | hvsync_generator | renderer |
| `tick` | 1 | frame_tick | game_fsm, player, bullet, alien_*, collision |
| `state` | 2 | game_fsm | top |
| `player_x` | 8 | player | bullet |
| `fire` | 1 | edge_detect | bullet |
| `rnd` | 8 | lfsr | alien_bullet |
| `*_gfx` | 1 | player, bullet, alien_formation, alien_bullet, score | collision, renderer |
| `bullet_hit_alien` | 1 | collision | bullet, alien_formation, score |
| `player_hit` | 1 | collision | alien_bullet, lives |
| `aliens_cleared`, `aliens_landed` | 1 | alien_formation | game_fsm |
| `lives_zero` | 1 | lives | game_fsm |
| `bcd` | 12 | score | renderer / sprite_rom |

## Devir notları

_Her tur sonunda: ne bitti, ne kaldı, hangi portlar değişti._
