---
title: Cara Menggunakan FioFishing
sidebar_position: 1
---

# Cara Menggunakan FioFishing

Halaman ini memandu pemain dan admin memakai FioFishing, lalu menunjukkan file yang perlu diedit untuk mengubah pengaturannya. FioFishing menambahkan ikan custom, umpan, pancing khusus, statistik/jurnal ikan, menu jual-beli, dan kompetisi memancing.

## Alur mulai cepat

1. Pasang plugin di server Paper yang didukung, lalu jalankan server sekali agar file konfigurasi dibuat.
2. Buka `plugins/FioFishing/`. Konfigurasi utama ada di `config.yml`; definisi ikan, umpan, dan pancing ada di folder `Loots/`.
3. Atur ikan dan rod yang ingin dipakai. Folder berisi file contoh yang bisa disalin lalu dimodifikasi.
4. Simpan perubahan, jalankan `/fiofishing admin reload`, lalu baca console untuk melihat jika ada konfigurasi yang tidak terbaca.
5. Uji hasil di server: admin dapat memberi ikan/umpan/pancing dengan `/fiofishing admin give <fish|baits|fishingrods> <id> <pemain> [jumlah]`.

## Lokasi dan fungsi berkas

| Lokasi di `plugins/FioFishing/` | Fungsi |
| --- | --- |
| `config.yml` | Pengaturan global: dunia, animation, AFK, statistik/leaderboard, bahasa, ukuran ikan, dan penyimpanan data. |
| `Loots/Fish/*.yml` | Daftar ikan dan pengaturan rarity. File contoh bernama `common.yml`, `rare.yml`, dan seterusnya. |
| `Loots/Baits/*.yml` | Satu definisi umpan per file, termasuk modifier, aturan pemakaian, item, dan harga. |
| `Loots/Rods/*.yml` | Satu definisi pancing per file, termasuk durability, filter ikan, suara, dan bait yang diterima. |
| `Events/*.yml` | Pengaturan kompetisi memancing dan reward. `Events/settings.yml` mengatur jadwal mingguan. |
| `Menu/**/*.yml` | Tata letak GUI dan aksi tombol. Folder dibaca termasuk subfolder. |
| `Lang/messages_<kode>.yml` | Pesan berdasarkan bahasa yang dipilih. Kode bawaan: `en`, `id`, `jp`, `ch`. |
| `CustomNaming/material.json`, `CustomNaming/biome.json` | Nama tampilan material dan biome untuk menu/jurnal. |
| `data.yml` atau database MySQL | Statistik dan jurnal pemain, bergantung pilihan `type` di bagian `storage`. |

## Cara mengedit dengan aman

- Buat salinan cadangan sebelum mengedit, terutama `config.yml`, folder `Loots/`, `Events/`, `Menu/`, dan data pemain.
- YAML memakai indentasi spasi. Jangan memakai tab. Pastikan daftar dimulai dengan `-` dan nilai teks berisi `:` atau `#` diberi tanda kutip jika dibutuhkan.
- Jangan mengganti key bagian kiri. Ubah nilai di bagian kanan atau tambahkan entri dengan struktur yang sama seperti contoh.
- Setiap fish ID harus unik di semua `Loots/Fish/*.yml`. Gunakan ID yang konsisten juga di bait, rod, dan menu.
- Setelah edit, jalankan `/fiofishing admin reload`. Jika ada berkas salah format atau ID duplikat, plugin menulis masalahnya ke console dan dapat melewati entri tersebut.

## Perintah yang sering dipakai

| Perintah | Kegunaan |
| --- | --- |
| `/fiofishing` | Menampilkan bantuan perintah. |
| `/fiofishing stats [pemain]` | Melihat statistik memancing. |
| `/fiofishing journey` | Membuka jurnal/perjalanan ikan. |
| `/fiofishing events` | Melihat event yang berlangsung. |
| `/fiofishing leaderboards` | Membuka papan peringkat event. |
| `/fiofishing sell` | Membuka menu menjual ikan dan bait yang dapat dijual. |
| `/fiofishing shop` | Membuka shop plugin. |
| `/fiofishing admin reload` | Memuat ulang berkas konfigurasi. |
| `/fiofishing admin give <fish\|baits\|fishingrods> <id> <pemain> [jumlah]` | Memberi item FioFishing berdasarkan ID konfigurasi. |

Jual-beli membutuhkan Vault dan plugin ekonomi yang menyediakan economy. WorldGuard hanya diperlukan untuk aturan region. ItemsAdder, Oraxen, dan Nexo hanya diperlukan jika item memakai tekstur dari plugin tersebut.

## Panduan pengaturan

Pilih halaman di bagian **Panduan Pengaturan** untuk melihat struktur file, arti setiap pengaturan, opsi nilai yang diterima, serta contoh perubahan:

- [Pengaturan umum `config.yml`](./config/config.mdx)
- [Create Custom Fishs](./config/fish.mdx)
- [Create Custom Baits](./config/baits.mdx)
- [Pancing](./config/rods.mdx)
- [Event dan jadwal](./config/events.mdx)
- [Menu GUI](./config/menus.mdx)
- [Bahasa dan nama tampilan](./config/language-names.mdx)
