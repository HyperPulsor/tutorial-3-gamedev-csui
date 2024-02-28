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




