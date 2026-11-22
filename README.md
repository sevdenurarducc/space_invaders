space_invaders
=====

[Open this project in 8bitworkshop](https://8bitworkshop.com/latest/?platform=verilog&githubURL=https%3A%2F%2Fgithub.com%2Fsevdenurarducc%2Fspace_invaders&file=space_invaders.v).

## Oyun kuralları

- Ekranın üstünde **4 satır × 8 sütun = 32 uzaylı** bulunur.
- Uzaylılar sağa sola birlikte hareket eder; kenara değince bir adım aşağı inerler.
- Oyuncu ekranın altındaki gemiyi sola/sağa hareket ettirir ve ateş eder.
- **Aynı anda ekranda yalnızca tek oyuncu mermisi** olabilir; mermi bir şeye çarpmadan veya ekrandan çıkmadan yeniden ateş edilemez.
- Puanlar: **üst satır 30, ikinci satır 20, alttaki iki satır 10** puan.
- Oyuncunun **3 canı** vardır. Uzaylı mermisi gemiye çarparsa bir can gider; can kalmayınca oyun biter.
- **Uzaylılar zemine (zemin çizgisine) inerse oyun hemen biter.**
- Tüm uzaylılar vurulursa seviye tamamlanır ve yeni dalga gelir.

### Zorunlu özellikler

- [ ] Başlık ekranı, start ile oyun başlar
- [ ] Gemi hareketi ve tek oyuncu mermisi
- [ ] 4×8 uzaylı dizisi, yana kayma ve aşağı inme
- [ ] Uzaylı mermileri (rastgele uzaylıdan)
- [ ] Çarpışmalar: mermi–uzaylı, uzaylı mermisi–gemi
- [ ] 3 can, BCD skor (10/20/30), ekranda rakamlar
- [ ] PLAYER_HIT, LEVEL_CLEAR, GAME_OVER durumları

### Vakit kalırsa

- [ ] Ses efektleri
- [ ] Kalkanlar (sığınaklar)
- [ ] UFO (bonus gemi)
- [ ] Patlama efekti

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
Bir test dosyasını çalıştırmak için 8bitworkshop'ta onu ana dosya olarak açın
(bağlantıdaki `file=` kısmını test dosyasının adıyla değiştirin).

## Sinyal tablosu

**Bundan sonra herkes bu isimleri kullanır.** İsim veya genişlik değişecekse
önce grupla konuşulur, sonra bu tablo güncellenir.

### Ekran ve zaman

| Sinyal | Genişlik | Üreten | Kullanan | Açıklama |
|---|---|---|---|---|
| `clk`, `reset` | 1 | 8bitworkshop | hepsi | `reset` aktif-yüksek, senkron |
| `hpos` | 9 | hvsync_generator | çizim yapan modüller | yatay piksel, 0–255 görünür |
| `vpos` | 9 | hvsync_generator | çizim yapan modüller | dikey satır, 0–239 görünür |
| `display_on` | 1 | hvsync_generator | renderer | görünür alandayken 1 |
| `tick` | 1 | frame_tick | oyun mantığı olan modüller | karede bir kez 1 çevrim 1 (vpos=240, hpos=0) |
| `switches_p1` | 8 | 8bitworkshop | top | bit0 sol, bit1 sağ, bit2 yukarı, bit3 aşağı, bit4 Space, bit5 Shift |

### Oyun durumu

| Sinyal | Genişlik | Üreten | Kullanan | Açıklama |
|---|---|---|---|---|
| `state` | 3 | game_fsm | top, renderer | `` `GS_TITLE `` 0, `` `GS_PLAY `` 1, `` `GS_PLAYER_HIT `` 2, `` `GS_LEVEL_CLEAR `` 3, `` `GS_GAME_OVER `` 4 |
| `playing` | 1 | game_fsm | player, bullet, alien_* | PLAY durumunda 1; değilse hareket durur |
| `new_game` | 1 | game_fsm | lives, score, alien_formation | yeni oyun başlarken 1 çevrim 1 |
| `next_level` | 1 | game_fsm | alien_formation | yeni dalga başlarken 1 çevrim 1 |
| `start` | 1 | top (tuş) | game_fsm | başlatma tuşu |

### Girişler

| Sinyal | Genişlik | Üreten | Kullanan | Açıklama |
|---|---|---|---|---|
| `left`, `right` | 1 | top (tuş) | player | gemi hareketi |
| `fire` | 1 | edge_detect | bullet | ateş tuşu, basışta 1 çevrim 1 |

### Nesneler ve çizim

| Sinyal | Genişlik | Üreten | Kullanan | Açıklama |
|---|---|---|---|---|
| `player_x` | 8 | player | bullet | geminin sol kenarı |
| `player_gfx` | 1 | player | collision, renderer | o pikselde gemi var |
| `bullet_gfx` | 1 | bullet | collision, renderer | o pikselde oyuncu mermisi var |
| `alien_gfx` | 1 | alien_formation | collision, renderer | o pikselde uzaylı var |
| `alien_bullet_gfx` | 1 | alien_bullet | collision, renderer | o pikselde uzaylı mermisi var |
| `score_gfx` | 1 | score / sprite_rom | renderer | o pikselde skor rakamı var |
| `rnd` | 8 | lfsr | alien_bullet | rastgele sayı |
| `rgb` | 3 | renderer | top | `{b,g,r}` |

### Olaylar

| Sinyal | Genişlik | Üreten | Kullanan | Açıklama |
|---|---|---|---|---|
| `bullet_hit_alien` | 1 | collision | bullet, alien_formation, score | oyuncu mermisi uzaylıya çarptı |
| `player_hit` | 1 | collision | game_fsm, alien_bullet, lives | uzaylı mermisi gemiye çarptı |
| `aliens_cleared` | 1 | alien_formation | game_fsm | tüm uzaylılar vuruldu |
| `aliens_landed` | 1 | alien_formation | game_fsm | uzaylılar zemine indi |
| `lives` | 2 | lives | renderer | kalan can (0–3) |
| `lives_zero` | 1 | lives | game_fsm | can kalmadı |
| `bcd` | 12 | score | renderer / sprite_rom | 3 haneli BCD skor |

### Sabitler

| İsim | Değer | Nerede | Açıklama |
|---|---|---|---|
| `V_DISPLAY` | 240 | frame_tick, hvsync_generator | görünür satır sayısı |
| `GROUND_Y` | 230 | space_invaders.v (geçici) | zemin çizgisi satırı; uzaylılar buraya inerse `aliens_landed` |
| `WAIT_FRAMES` | 120 | game_fsm | PLAYER_HIT / LEVEL_CLEAR / GAME_OVER bekleme süresi (≈2 s) |

## Devir notları

### Tur 1 — Sevde

**Bitenler**
- README: oyun kuralları, zorunlu / vakit kalırsa listesi, kesinleşmiş sinyal tablosu.
- `frame_tick.v`: `vpos == 240 && hpos == 0` olduğunda 1 çevrimlik `tick` (register çıkışlı).
- `game_fsm.v`: TITLE, PLAY, PLAYER_HIT, LEVEL_CLEAR, GAME_OVER durumları; iki always bloklu yapı;
  120 karelik bekleme sayacı. Ek çıkışlar: `playing`, `new_game`, `next_level`.
  Durum kodları `` `GS_* `` makroları olarak tanımlı, başka dosyalar da kullanabilir.
- `test_game_fsm_top.v`: her durum ayrı arka plan rengi (TITLE mavi, PLAY yeşil, PLAYER_HIT kırmızı,
  LEVEL_CLEAR sarı, GAME_OVER mor). Sol üstte saniyede bir yanıp sönen kare `tick`'i gösterir.
  Tuşlar: Space = start, Shift = player_hit, Yukarı = aliens_cleared, Aşağı = aliens_landed,
  Sol = lives_zero.
- `space_invaders.v`: 230. satırda geçici yeşil zemin çizgisi.

**Sonraki turlar için**
- Mine (Tur 2): `player` ve `bullet` hareketini `tick` ile güncelleyin, `playing` 0 iken durdurun.
- Şefikullah (Tur 3): uzaylıların inip inmediğini `GROUND_Y = 230` ile kontrol edin.
- `game_fsm` henüz `space_invaders.v` içinde bağlı değil, Tur 6'da bağlanacak.
- Tur 1 ekran görüntüleri: _eklenecek_
