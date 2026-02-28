<script setup>
import Navbar from '@/components/Navbar.vue';
</script>

<template>
  <Navbar />
  <div class="home-container">
    <header class="hero-section">
      <h1>Nikmati Manisnya Waktu Berbuka</h1>
      <p>
        Aneka takjil segar dan lezat siap menemani momen istimewa <br />
        menjelang adzan. Dari yang tradisional sampai kekinian, semua ada di
        sini.
      </p>
    </header>

    <div class="promo-card">
      <div class="promo-content">
        <div class="visual-3d">
          <img src="@/assets/visual_promo.png" alt="Promo Takjil Visual" />
        </div>
        <div class="promo-text">
          <h2>Tak semua momen indah <br /> harus dilewati sendiri.</h2>
          <p>
            Yuk, luangkan waktu untuk berbuka puasa bersama. Nikmati hidangan
            takjil, ciptakan tawa, dan kebersamaan di satu meja.
          </p>
          <button class="btn-gabung">Gabung</button>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.home-container {
  background-color: #fdf6e3;
  min-height: 100vh;
  padding-bottom: 5rem;
}

.hero-section {
  text-align: center;
  padding: 4rem 0;
  color: #1d5d43;
}

/* 1. Card utama sekarang pakai warna gradasi abu-abu kecoklatan */
.promo-card {
  max-width: 1000px;
  margin: 0 auto;
  background: linear-gradient(135deg, #6e6d68, #3b3b38); /* Warna abu kecoklatan */
  border-radius: 20px;
  color: white;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
  overflow: hidden; /* Penting! Agar background hijau tidak keluar dari ujung card */
}

/* 2. Bikin flexbox stretch agar tinggi kiri & kanan sama */
.promo-content {
  display: flex;
  align-items: stretch; 
}

/* 3. Area Visual 3D (Kunci lengkungannya ada di sini!) */
.visual-3d {
  width: 45%;
  background-color: #001B2E; /* Warna hijau sangat gelap sesuai desain */
  
  /* Ini yang bikin batas kanannya jadi melengkung/bulat */
  border-radius: 0 50% 50% 0; 
  
  padding: 2rem;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  z-index: 1; /* Pastikan lengkungan berada di atas background abu-abu */
}

.visual-3d img {
  width: 100%;
  max-width: 350px; /* Jaga agar gambar tidak terlalu besar */
  transform: scale(1.1); /* Opsional: perbesar sedikit agar lebih pop-out */
}

/* 4. Area Teks */
.promo-text {
  width: 55%;
  padding: 4rem 4rem 4rem 2rem; /* Sesuaikan jarak dalam teks */
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.promo-text h2 {
  font-size: 2.2rem;
  margin-bottom: 1.5rem;
  line-height: 1.3;
}

.promo-text p {
  line-height: 1.6;
  margin-bottom: 2rem;
  font-size: 1.1rem;
  color: #e0e0e0; /* Teks abu-abu terang agar mudah dibaca */
}

.btn-gabung {
  background-color: #233e33; /* Warna hijau gelap untuk tombol */
  color: white;
  border: 1px solid rgba(255,255,255,0.2);
  padding: 0.8rem 2.5rem;
  border-radius: 25px;
  font-size: 1.1rem;
  font-weight: bold;
  cursor: pointer;
  align-self: flex-start; /* Biar tombolnya gak melebar ke kanan */
  transition: all 0.2s;
}

.btn-gabung:hover {
  background-color: #1d5d43;
}
</style>