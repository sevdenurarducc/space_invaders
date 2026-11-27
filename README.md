Space Invaders – Verilog + FSM
=====

[Open this project in 8bitworkshop](https://8bitworkshop.com/latest/?platform=verilog&githubURL=https%3A%2F%2Fgithub.com%2Fsevdenurarducc%2Fspace_invaders&file=space_invaders.v).

Verilog + FSM ile retro oyun bilgisayarı • **24 Kasım – 25 Aralık 2026**
Ekip: Sevde (kaptan), Mine, Şefikullah, Alperen • Ortam: 8bitworkshop + GitHub

Ekip **bayrak yarışı** gibi çalışır: projeyi aynı anda tek kişi geliştirir. Sırası gelen kişi
bir önceki kişinin bıraktığı kodu alır, kendi parçasını ekler ve bir sonrakine devreder.

> **Son tarihler:** Kod **18 Aralık**'ta dondurulur. 19–25 Aralık sunum haftasıdır. Sunum **25 Aralık**.

## Oyun kuralları

- Ekranın üstünde **4 satır × 8 sütun = 32 uzaylı** bulunur.
- Uzaylılar sağa sola birlikte hareket eder; kenara değince bir adım aşağı inerler, azaldıkça hızlanırlar.
- Oyuncu ekranın altındaki gemiyi sola/sağa hareket ettirir ve ateş eder.
- **Aynı anda ekranda yalnızca tek oyuncu mermisi** olabilir; mermi bir şeye çarpmadan veya ekrandan çıkmadan yeniden ateş edilemez.
- Puanlar: **üst satır 30, ikinci satır 20, alttaki iki satır 10** puan.
- Oyuncunun **3 canı** vardır. Uzaylı mermisi gemiye çarparsa bir can gider; can kalmayınca oyun biter.
- **Uzaylılar zemine (zemin çizgisine) inerse oyun hemen biter.**
- Tüm uzaylılar vurulursa seviye tamamlanır ve yeni dalga gelir.

### Zorunlu özellikler

- [ ] Başlık ekranı, ateş tuşu ile oyun başlar
- [ ] Gemi hareketi ve tek oyuncu mermisi
- [ ] 4×8 uzaylı dizisi, yana kayma, aşağı inme ve hızlanma
- [ ] Uzaylı mermileri (rastgele uzaylıdan)
- [ ] Çarpışmalar: mermi–uzaylı, uzaylı mermisi–gemi, uzaylılar–zemin
- [ ] 3 can, BCD skor (10/20/30), ekranda rakamlar
- [ ] PLAYER_HIT, LEVEL_CLEAR, GAME_OVER durumları

### Vakit kalırsa

- [ ] Ses efektleri
- [ ] Kalkanlar (sığınaklar)
- [ ] UFO (bonus gemi)
- [ ] Patlama efekti

## Kim ne yapıyor?

Görevler **konuya göre** bölündü: her kişinin iki turu aynı konunun devamı. Her kişinin
sunumda anlatacağı en az bir FSM'si var.

| Kişi | Sunumda anlatacağı konu | Dosyaları | FSM'si |
|---|---|---|---|
| **Sevde** (kaptan) | Sistem mimarisi ve oyun akışı: modüllerin bağlanması, frame_tick, ana oyun FSM'si, çarpışma, canlar | `space_invaders.v`, `frame_tick`, `game_fsm`, `collision`, `lives` | Ana oyun FSM'si |
| **Mine** | Oyuncu: tuş girişi, gemi hareketi, oyuncu mermisi | `edge_detect`, `debounce`, `player`, `bullet` | Mermi FSM'si |
| **Şefikullah** | Uzaylılar: formasyon, hareket ve hızlanma, uzaylı mermileri, seviye geçişi | `alien_formation`, `alien_bullet`, `lfsr` | Uzaylı hareket FSM'si |
| **Alperen** | Görüntü ve skor: ekran tarama, sprite'lar, çizim öncelikleri, skor, yazılar ve ekranlar | `renderer`, `sprite_rom`, `score` | Ekran durumları (başlık / oyun / GAME OVER) |

## Tur takvimi

| Tur | Tarih | Kim | İş | Tur sonunda ekranda |
|---|---|---|---|---|
| 1 | 24–27 Kas | Sevde | Kurulum, GitHub, iskelet dosyalar, sinyal tablosu, oyun kuralları, frame_tick, game_fsm | Proje derleniyor, zemin çizgisi |
| 2 | 28–30 Kas | Mine | edge_detect, debounce, player (hareket + gemi çizimi) | Tuşla hareket eden gemi |
| 3 | 1–3 Ara | Şefikullah | alien_formation + hareket FSM'si + hızlanma | Hareket eden 32 kare |
| 4 | 4–6 Ara | Alperen | sprite_rom, renderer: gerçek sprite'lar, zemin, renkler | Gerçek görünümlü gemi + uzaylılar |
| 5 | 7–8 Ara | Mine | Oyuncu mermisi FSM'si + çizimi | Gemi ateş ediyor |
| 6 | 9–12 Ara | Sevde | collision, uzaylı ölümü, lives, game_fsm'nin tüm akışı | **Oynanabilir oyun** |
| 7 | 13–14 Ara | Şefikullah | Uzaylı mermileri + lfsr, seviye geçişi | Uzaylılar ateş ediyor, yeni dalga |
| 8 | 15–16 Ara | Alperen | score (BCD), skor/can yazısı, başlık ve GAME OVER ekranları | Tam görünümlü oyun |
| 9 | 17–18 Ara | Sevde | Uçtan uca test, hata düzeltme, **kod dondurma** | Son sürüm |
| — | 19–25 Ara | Herkes | Slaytlar, demo videosu, provalar; **25 Aralık sunum** | — |

Her turun ayrıntılı görev listesi (zorunlu / vakit kalırsa) çalışma planı PDF'inin 7. bölümünde.

## Bayrak yarışı kuralları

**Tur başında (sırası gelen kişi)**
1. 8bitworkshop'ta **Sync → Pull Latest from Repository** ile son hali alın
   (ilk turunuzsa önce **Sync → Import Project from GitHub...**).
2. `space_invaders.v`'yi açın; oyunun bir önceki turun sonundaki gibi çalıştığını görün.
3. Kendi turunuzun görevlerini okuyun ve **zorunlu** olanlardan başlayın.

**Tur sırasında**
- Projeyi sadece sırası gelen kişi değiştirir. Diğerleri dosyalara dokunmaz (okumak serbest).
- Her çalışma oturumu sonunda **push** edin.
- Takıldığınız yer olursa gruba yazın; önce Sevde, sonra bir önceki turun sahibi yardım eder.
- Kendi modülünüzü denemek için `test_` ile başlayan bir test dosyası açabilirsiniz (ör. `test_player_top.v`).
- Gerekirse `space_invaders.v` içine kendi modülünüzü bağlayabilirsiniz.

**Tur sonunda**
- [ ] Proje **hatasız derleniyor**.
- [ ] Turun hedefi ekranda görünüyor; ekran görüntüsü alındı.
- [ ] Kendi dosyalarınızın en üstünde açıklama başlığı var (aşağıdaki örnek).
- [ ] Push edildi ve **Download → All Changes as Zip** ile yedek alındı.
- [ ] Sıradaki kişi ve Sevde ile **20–30 dakikalık devir görüşmesi** yapıldı.

**Gecikme kuralı:** Tur süresi bittiğinde zorunlu kısım tamamsa sıra devredilir.
Zorunlu kısım bitmediyse hemen Sevde'ye haber verin.
**Takvim kaymaz**; gerekirse ek özellikler (uzaylı mermileri, seviye geçişi) kapsamdan çıkarılır.

## 8bitworkshop ve GitHub

| Ne yapmak istiyorsunuz | Menü |
|---|---|
| Son hali almak (tur başında) | **Sync → Pull Latest from Repository** |
| Değişiklikleri göndermek | **Sync → Push Changes to Repository...** → kısa mesaj (ör. `Tur 2: player hareketi eklendi`) |
| İlk kez projeyi almak | **Sync → Sign in to GitHub...**, sonra **Sync → Import Project from GitHub...** |
| Projeye yeni `.v` dosyası eklemek | **File → Add Include File...** |
| Dosyayı yeniden adlandırmak / silmek | **File → Rename File...** / **File → Delete File...** |
| Yedek almak | **Download → All Changes as Zip** |

> **Dikkat:** Pull, tarayıcıdaki proje dosyalarının **hepsini** GitHub'dakiyle değiştirir,
> birleştirme yapmaz. Turunuz dışında projede bir şey değiştirdiyseniz pull'da kaybolur.
> Deneme yapmak istiyorsanız ayrı bir `deneme_top.v` projesinde yapın.

8bitworkshop dosyaları **tarayıcının içinde** saklar: geçmiş temizlenirse, gizli sekmede
çalışılırsa veya başka bilgisayardan girilirse dosyalar görünmez. **Kural:** her oturum sonunda
push edin ve ZIP yedeği alın. Push çalışmazsa dosyaları **Download → Source File** ile indirip
github.com'da **Add file → Upload files** ile yükleyin.

## Dosya yapısı

| Dosya | İçerik | Sahibi | Tur |
|---|---|---|---|
| `space_invaders.v` | Ana dosya: tüm modülleri bağlar (planda adı `space_invaders_top.v`) | Sevde | 1, 6, 9 |
| `hvsync_generator.v` | Hazır görüntü senkron modülü | — | 1 |
| `frame_tick.v` | Karede bir kez 1 olan darbe | Sevde | 1 |
| `game_fsm.v` | Ana oyun FSM'si | Sevde | 1, 6 |
| `collision.v` | Çarpışmalar | Sevde | 6 |
| `lives.v` | Can sayacı | Sevde | 6 |
| `edge_detect.v`, `debounce.v` | Tuş darbesi, titreşim temizleme | Mine | 2 |
| `player.v` | Gemi hareketi + çizimi | Mine | 2 |
| `bullet.v` | Oyuncu mermisi FSM'si + çizimi | Mine | 5 |
| `alien_formation.v` | Uzaylı dizisi + hareket FSM'si | Şefikullah | 3, 7 |
| `alien_bullet.v`, `lfsr.v` | Uzaylı mermileri, rastgele sayı | Şefikullah | 7 |
| `sprite_rom.v` | Uzaylı, rakam desenleri | Alperen | 4, 8 |
| `renderer.v` | Katmanları birleştirip renk üretir | Alperen | 4, 8 |
| `score.v` | BCD skor sayacı | Alperen | 8 |
| `test_*.v` | Kişisel test dosyaları (ör. `test_game_fsm_top.v`) | Herkes | — |
| `README.md` | Proje açıklaması | Herkes | her tur |

Bir test dosyasını çalıştırmak için 8bitworkshop'ta onu ana dosya olarak açın
(bağlantıdaki `file=` kısmını test dosyasının adıyla değiştirin).

### Her dosyada include guard ve açıklama başlığı

Aynı dosya iki yerden include edilirse "modül iki kez tanımlandı" hatası çıkar; include guard
bunu önler. Açıklama başlığı da sunum hazırlığında işe yarar.

```verilog
`ifndef PLAYER_H
`define PLAYER_H
/*
  player.v — sahibi: Mine — Tur 2
  Ne yapar : Gemiyi sola/sağa hareket ettirir, gemi pikselini üretir.
  Girişler : clk, reset, frame_tick, playing, btn_left, btn_right, hpos, vpos
  Çıkışlar : player_x (geminin sol kenarı), ship_on
  Notlar   : Sadece frame_tick=1 iken hareket eder. Sınırlar 8..232.
*/
module player(...);
  ...
endmodule
`endif
```

## Sinyal tablosu

**Bundan sonra herkes bu isimleri kullanır.** Port listeleri iskelet dosyalarda hazır.
Tur sahibi bir portu gerektiğinde değiştirebilir, ama değişikliği bu tabloya yazmalıdır.

| Sinyal | Bit | Üreten → kullanan | Açıklama |
|---|---|---|---|
| `clk`, `reset` | 1 | top → hepsi | Saat ve reset (`reset` aktif-yüksek, senkron) |
| `hpos`, `vpos`, `display_on` | 9, 9, 1 | hvsync → çizen modüller | O an çizilen piksel (görünür alan 256×240), görünür alan |
| `frame_tick` | 1 | Sevde (frame_tick) → hepsi | Karede bir kez 1 çevrim 1 (vpos=240, hpos=0) |
| `state`, `new_game` | 3, 1 | Sevde (game_fsm) → hepsi | Oyun durumu; yeni oyun başlangıcı (1 çevrim) |
| `playing`, `next_level` | 1, 1 | Sevde (game_fsm) → hareket eden modüller, alien_formation | `state == PLAY`; yeni dalga başlangıcı (1 çevrim) |
| `btn_left/right/fire`, `fire_pulse` | 1 | giriş → Mine | Tuşlar, ateş darbesi |
| `player_x`, `ship_on` | 8, 1 | Mine → Sevde, Alperen | Gemi konumu (sol kenar) ve pikseli |
| `pb_active`, `pb_x`, `pb_y`, `bullet_on` | 1, 8, 8, 1 | Mine → Sevde, Alperen | Oyuncu mermisi |
| `pb_hit` | 1 | Sevde → Mine | Mermi bir şeye çarptı |
| `form_x`, `form_y`, `alive`, `aliens_left` | 8, 8, 32, 6 | Şefikullah → Sevde, Alperen | Formasyon (`alive` bit = satır×8 + sütun) |
| `in_alien`, `alien_row/col`, `sub_x/y` | 1, 2, 3, 4, 4 | Şefikullah → Alperen | Pikselin hangi uzaylıda olduğu |
| `kill`, `kill_index` | 1, 5 | Sevde → Şefikullah, Alperen | Vurulan uzaylı (skor da artar) |
| `ab_active`, `ab_x`, `ab_y`, `ab_on` | 1, 8, 8, 1 | Şefikullah → Sevde, Alperen | Uzaylı mermisi |
| `player_hit`, `lives` | 1, 2 | Sevde → hepsi | Gemi vuruldu, kalan can |
| `aliens_landed` | 1 | Sevde (collision) → game_fsm | Uzaylılar zemine indi, oyun biter |
| `score_bcd` | 16 | Alperen (score) → renderer | Skor (4 hane BCD) |
| `rgb` | 3 | renderer → çıkış | Piksel rengi `{b,g,r}` |

Plandaki Ek A'ya göre eklenenler: `playing` (player, bullet, alien_formation, alien_bullet),
`next_level` (alien_formation), `aliens_landed` (collision → game_fsm).
Durum kodları `game_fsm.v` içinde `` `GS_TITLE `` 0, `` `GS_PLAY `` 1, `` `GS_PLAYER_HIT `` 2,
`` `GS_LEVEL_CLEAR `` 3, `` `GS_GAME_OVER `` 4 olarak tanımlı.

### Sabitler

| İsim | Değer | Nerede | Açıklama |
|---|---|---|---|
| `V_DISPLAY` | 240 | frame_tick, hvsync_generator | Görünür satır sayısı |
| `GROUND_Y` | 230 | space_invaders.v (geçici) | Zemin çizgisi satırı |
| `WAIT_FRAMES` | 120 | game_fsm | PLAYER_HIT / LEVEL_CLEAR / GAME_OVER bekleme süresi (≈2 s) |

## Son test listesi (Tur 9)

| # | Test | Tamam |
|---|---|---|
| 1 | Oyun TITLE ekranıyla açılıyor; ateş tuşu oyunu başlatıyor | ☐ |
| 2 | Gemi sola/sağa gidiyor, kenarlardan çıkmıyor | ☐ |
| 3 | Aynı anda tek oyuncu mermisi var; mermi üstte kayboluyor | ☐ |
| 4 | Mermi uzaylıyı öldürüyor; doğru uzaylı kayboluyor; skor doğru artıyor (10/20/30) | ☐ |
| 5 | Uzaylılar kenara değince aşağı inip yön değiştiriyor; azaldıkça hızlanıyor | ☐ |
| 6 | Uzaylı mermisi gemiyi vurunca can azalıyor, kısa bekleme sonra oyun devam ediyor | ☐ |
| 7 | Uzaylılar zemine inince oyun bitiyor | ☐ |
| 8 | Tüm uzaylılar ölünce yeni dalga geliyor | ☐ |
| 9 | Canlar bitince GAME OVER; son skor görünüyor; ateş tuşu yeni oyun başlatıyor | ☐ |
| 10 | Yeni oyunda skor, can ve formasyon sıfırlanıyor | ☐ |
| 11 | 5 dakika kesintisiz oynanınca görsel bozulma veya donma yok | ☐ |

## Controls

| Bit | Key | Signal Name |
|---|---|---|
| switches_p1[0] | Left Arrow | btn_left |
| switches_p1[1] | Right Arrow | btn_right |
| switches_p1[2] | Up Arrow | Not used |
| switches_p1[3] | Down Arrow | Not used |
| switches_p1[4] | Space | btn_fire |
| switches_p1[5] | Shift | Not used |
