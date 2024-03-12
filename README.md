# Tutorial Game Development
## Authors

* **Rakan Fasya Athhar Rayyan** - *2106750950*

## Tutorial 3

#### Fitur Lanjutan :

- **Double Jump**, merupakan fitur yang memungkinkan pemain untuk melompat dua kali. Cara pengerjaannya adalah dengan menggunakan variabel `jump_max` dan `jump_count` sebagai parameter untuk menentukan maksimal lompatan yang bisa dilakukan pemain dan mengetahui pemain sudah berapa kali melakukan lompatan.<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/bd79e7f6-0bce-4e99-beef-156bffd6eada)

    Pertama, akan dicek apabila pemain tidak sedang melompat (berdiri pada lantai dan `jump_count` seharusnya 0), maka variabel `jump_count` dibuat menjadi 0 menunjukkan belum lompat.

    Kedua, merupakan implementasi dari mekanisme lompatan itu sendiri. Dicek terlebih dahulu apakah jumlah `jump_count > jump_max`, jika iya maka pemain tidak diperbolehkan lompat lagi. Jika tidak, maka pemain bisa melompat dengan menekan input `up` (*arrow key up*) untuk melompat. Setiap kali pemain menekan input tersebut, jumlah `jump_count` akan diincrement dan setiap frame akan mengecek kondisi lompatan kembali dengan nilai `jump_count` yang sudah terupdate.

    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/cc545a71-db72-45c6-b82e-413c53580fd5)

- **Dashing**, merupakan fitur yang memungkinkan pemain untuk mendapatkan *speed boost* sementara untuk periode waktu yang singkat. Akan digunakan variabel `is_dashing` dan `can_dash` yang merupakan boolean untuk mengetahui dan menentukan kondisi (sedang dash atau tidak). Lalu, terdapat juga variabel konstan `DASH_SPEED` untuk menambahkan kecepatan awal saat pemain melakukan dash.<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/840eeff6-7389-40e2-a862-b7f85ed3d28c)<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/d2469b1f-3a67-4543-9c60-d43d9dfca915)


    Pertama, masukkan timer `dash_timer` dan `can_dash_timer` untuk menentukan seberapa lama dapat melakukan dash dan kapan pemain bisa melakukan dash kembali. Masukkan ke function timeout untuk menentukan kondisi variabel setelah timer habis atau *timeout* (setelah dash maka `is_dashing = false` dan `can_dash = true`).<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/628f02f8-110b-4b2f-bca3-14b832c70886)<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/c8d15363-1c9a-450a-9941-66db74c9ddbc)

    Kedua, akan mengecek apakah pemain menekan tombol input dash (*shift keys*) dan tidak sedang melakukan *crouch*. Selanjutnya, variabel `is_dashing = true` karena sedang melakukan dash dan `can_dash = false` karena tidak bisa dash lagi (karena sudah dalam kondisi dash). Bersamaan, kedua timer juga ikut dinyalakan sebagai durasi dash dan kapan bisa melakukan dash lagi.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/d51290a8-fb55-4fba-9aea-c93f6d69b9ad)

    Ketiga, menambahkan nilai speed awal dengan tambahan dari variabel `DASH_SPEED` saat pemain melakukan dash.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/613193d8-b127-49a5-bd5c-3e5e1ca67207)

    Diterapkan juga `sprite.flip_h` untuk menyesuaikan posisi sprite sesuai arah jalan player.

-  **Crouching**, merupakan fitur yang memungkinkan pemain untuk menunduk dimana speed dari player menjadi lambat dan sprite juga mengikuti (tetapi collision belum sesuai). Digunakan variabel `CROUCH_SPEED` yang akan menggantikan nilai awal speed dan `is_crouching` yang menunjukkan apakah pemain sedang menunduk atau tidak. Terdapat juga variabel `normal_speed` yang disesuaikan dengan nilai speed pada awal game dimulai (function `ready()`).<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/13e1b947-a4ca-4bda-a709-8e996fe93a64)<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/015cf007-8e09-4bfb-82bd-81b32170a9ca)<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/bc46f13f-56bd-4754-a13d-451328553489)<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/bd504183-e5b3-44a9-9ed7-77bdbc2d2496)

    Pertama, pada setiap frame, akan dicek apakah pemain sedang menunduk atau tidak. Jika iya, maka nilai speed awal akan diubah menjadi `CROUCH_SPEED`. Jika tidak, maka akan dimasukkan nilai normal speed yang tidak berubah. Lalu, apabila pemain sedang menakan input down (*arrow key down*), maka akan masuk function `crouch()` dimana akan mengubah variabel `is_crouching` menjadi *true*. Jika input down tidak ditekan lagi, maka kaan masuk function `stand()` dimana akan mengubah variabel `is_crouching` menjadi *false*.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/091efd60-0905-4c9a-86d2-07684bb4f632)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/95e6da99-bc74-4d2f-bce4-54921e26d9ff)

- **Animation dan Particle Effect**, merupakan fitur yang menganimasi dan memberikan efek partikel pergerakan pemain pada level. Untuk melakukannya, ditambahkan node `AnimationPlayer` dan `MoveParticle` (node `CPUParticle2D`) sebagai child dari Scene Player. Pada node ini, akan dibuat animasi *frame-per-frame* dari spreadsheet sprite sehingga terbentuk animasi dan efek partikel pada saat bergerak. Animasi yang akan dibuat terkait semua pergerakan yang bisa dilakukan pemain pada level. Efek partikel dibuat hanya pada saat pemain berjalan.<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/26fcb777-060c-4e23-ac7e-f956c0796bc1)<br></br>

    Setelah animasi dibuat, buat function `update_animations(horizontal_directions)`. Parameter `horizontal_directions` digunakan untuk menetukan arah pemain sedang diam atau berjalan. Jika `horizontal_directions`, maka berarti pemain sedang diam. Variabel `is_crouching`,`is_dashing`, dan `velocity.y` (sedang melompat) juga digunakan untuk mengetahui kondisi pemain. Lalu, berdasarkan kondisi pemain, dimainkan aplikasi yang sesuai berdasarkan string yang telah dibuat pada AnimationPlayer.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/1dbd6d8d-994f-42ae-abeb-d5f9d21f722c)

    Pada setiap frame, `horizontal_directions` akan diambil (-1 untuk ke arah kiri, 0 untuk diam, 1 untuk ke arah kanan) dan dimasukkan untuk mengupdate animasi pergerakan pemain. <br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/cc42ea98-b066-4ffa-94d3-91798a7f8f57)

    Untuk membuat partikel, pada `MoveParticle` partikel sudah terbuat dan hanya tinggal menyesuaikan warna dan skala dari partikel tersebut. Menyesuaikan dengan posisi bergerak pemain, skala dan posisi x,y dari partikel diatur. Kemudian, partikel akan dinyalamatikan dengan `particle.emitting` apakah true atau false (true hanya pada saat pemain berjalan dan berjalan sambil menunduk dan juga dash)<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/019fc6fc-0067-49ea-bb91-9c20eefc9e20)<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/76d7ec28-0995-467d-a396-924f1355eae8)<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/08da39cb-b75d-435b-b4d9-3e3d0f7b91a6)

## Tutorial 5
Sebelum memulai tutorial, buat scene baru yaitu `Main2` untuk mengakomodasi pengerjaan tutorial 5.

- **Membuat 1 objek baru dengan spreadsheet animasi baru dan interaksinya**, Dalam tutorial ini akan dimasukkan aset dari `https://craftpix.net/freebies/free-homeless-character-sprite-sheets-pixel-art/` berupa karakter *homeless*. Spreadsheet ini sudah terpisah untuk setiap *action* dan hanya tinggal memasukkan semua frame. Akan dimasukkan animasi untuk kondisi `Idle` (saat karakter berdiam diri saja) dan `Hurt` (saat karakter berkolisi dengan pemain). Pertama, setelah download file, unzip file tersebut dan masukkan ke dalam folder asset. Untuk karakter ini, akan digunakan *spreadsheet* dari folder `Homeless_1`. Kedua, buat scene baru yang bernama `Homeless.tscn` dengan root node `RigidBody2D`. Scene ini akan berisikan child node berupa `AnimatedSprite2D`, `CollisionShape2D`, `AudioStreamPlayer2D`, dan `Timer`.<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/5e400b91-ca31-4b70-bd1a-d5c55bf27841)

    Hal pertama yang dilakukan adalah menambahkan sprite dan animasi pada karakter Homeless. Masuk ke inspector untuk node `AnimatedSprite2D`. Lalu, buat suatu `SpriteFrame` baru untuk menambahkan animasi.Setelah dibuat, klik SpriteFrame tersebut untuk masuk ke window untuk membuat animasi.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/e5c70a43-17a0-46f1-b459-e8a0bc21ac80)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/ac243908-30b8-4391-a33e-288bb248ad05)

    Untuk menambahkan animasi, tekan tombol `New Animation` dan ganti namanya menjadi `Idle` dan `hurt` serta pastikan bahwa tombol Loop sudah aktif. Tekan `Idle` untuk masuk ke panel animasinya. Kemudian, tekan tombol `Add Frames from a Sprite Sheet` dan gunakan file `res://assets/Homeless_1/Idle.png`. File ini terdiri atas 6 frame horizontal dan 1 frame vertikal. Oleh karena itu, atur `horizontal` menjadi 6 dan `vertical` menjadi 1 pada panel animasi. Setelah itu, tekan tombol `Add 6 Frame(s)`. Untuk animasi karakter berkolisi dengan pemain (`Hurt`), lakukan langkah yang sama seperti sebelumnya, tetapi menggunakan file spreadsheet `res://assets/Homeless_1/Hurt.png` dimana terdiri atas 3 frame horizontal dan 1 frame vertikal. <br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/36ec6192-d9da-4f5c-af82-e9e3bd29bbeb)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/de3f2f2b-f3bf-4b82-a881-e62de63f007a)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/a35484ee-5607-4d8d-a7d2-0bf088046424)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/9c455cf2-8751-476e-9eec-94959ca53745)

    Selanjutnya akan dihandle kondisi animasi dilakukan. Buat script `Homeless.gd` yang akan ditaruh di root node dari scene `Homeless.tscn`. Tambahkan kode supaya untuk mengupdate animasi untuk setiap frame. Lalu, masuk ke bagian Node dari `RigidBody2D` dan tambahkan *signal* untuk body_entered (saat ada objek physics lain yang berkolisi dengan karakter). Sangkutkan *signal* ini ke root node dan method `on_Homeless_body_entered(body)` akan muncul pada script. Akan dicek terlebih dahulu, apakah karakter berkolisi dengan pemain, Jika iya, maka akan memainkan animasi `hurt`. Berdasarkan timer yang dibuat, apabila timer sudah habis, maka akan mengganti animasi ke `Idle` kembali.<br></br>
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/662f2123-d97d-437a-a782-5bf142f7fc93)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/ab991b96-2724-4d67-8cc9-ef5fd6820f94)
    ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/67e9d20d-5059-4750-b250-cffff924518b)

    Untuk membuat *audio feedback*, akan digunakan aset dari `https://kenney.nl/assets/impact-sounds`. Masukkan node `AudioStreamPlayer2D` sebagai child node pada scene `Homeless.tscn`. Buka inspector dan masukkan file `res://assets/sounds/Audio/impactPunch_medium_000.ogg` ke dalam stream dan atur `volumedB` supaya lebih terdengar. Lalu, saat timer dimulai ketika berkolisi dengan pemain, mainkan audio dan hentikan audio pada saat timer sudah selesai.<br> ![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/8ff34e96-6850-4840-bdf9-9a84308e32cb)

- **Memasukkan BGM dan implementasinya**, BGM yang akan digunakan bersumber dari `https://www.chosic.com/download-audio/58132/`. Setelah file di download, buat node `BGM` yang merupakan tipe `AudioStreamPlayer2D` dan masukkan file `Sakura-Girl-Peach-chosic.com_` ke dalam stream. Buat kondisi `Autoplay` true sehingga setiap kali scene dijalankan, BGM akan ikut menyala. Untuk implementasi audio berdasarkan jarak player dari level awal, buatlah Script `Level.gd` yang akan disambungkan dengan root node dari scene `Main2`. Script ini akan mengambil node player dan node bgm saat scene pertama dijalankan. Lalu, untuk setiap frame, dicek jarak `global_position` antara node `Player2` dan `BGM`. Dengan menggunakan function clamp (function yang hanya memungkinkan perhitungan dari minVolume sampai maxVolume), didapatkan nilai volume relatif terhadap jarak pemain dengan level awal. Setelah itu, nilai linear diubah menjadi volume berupa dB dengan function `linear2db`. Kemudian, nilai volume diubah dengan nilai tersebut.<br></br>
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/20c0ae6e-d19f-4d9c-b223-c0611a9978d1)
![image](https://github.com/HyperPulsor/tutorial-3-gamedev-csui/assets/101686378/e194ceb3-7a81-418f-874c-3408150ccba0)
