<script setup>
import { ref } from 'vue';

const showNotif = ref(false);

const latestPlaces = ref([
  { id: 1, name: 'Masjid Salman ITB', desc: 'Baru saja ditambahkan' },
  { id: 2, name: 'Masjid Pusdai', desc: '1 jam yang lalu' },
  { id: 3, name: 'Rumah Zahran', desc: '2 jam yang lalu' }
]);
</script>

<template>
  <nav class="navbar">
    <div class="container">
      <div class="logo">
        <img src="@/assets/logo.png" alt="Pemburu Takjil Logo" />
      </div>
      
      <div class="nav-links">
        <router-link to="/" active-class="active">Beranda</router-link>
        <router-link to="/agenda" active-class="active">Agenda</router-link>
        <a href="#">Kontak</a>
      </div>

      <div class="notification-container">
        <button class="notif-btn" @click="showNotif = !showNotif">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
            <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
          </svg>
          <span v-if="latestPlaces.length > 0" class="badge">{{ latestPlaces.length }}</span>
        </button>

        <div class="notif-dropdown" v-if="showNotif">
          <div class="dropdown-header">
            <h4>Tempat Bukber Terbaru</h4>
          </div>
          <div class="dropdown-list">
            <div class="notif-item" v-for="place in latestPlaces" :key="place.id">
              <div class="notif-icon">🕌</div>
              <div class="notif-text">
                <p class="place-name">{{ place.name }}</p>
                <p class="place-time">{{ place.desc }}</p>
              </div>
            </div>
          </div>
          <div class="dropdown-footer">
            <router-link to="/agenda" @click="showNotif = false">Lihat Semua Agenda</router-link>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>

<style scoped>
.navbar {
  background-color: #fdf6e3;
  /* Warna krem pastel */
  padding: 20px;
  margin-top: -30px;
  margin-bottom: -30px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.container {
  max-width: 1600px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: #1d5d43;
  /* Warna hijau gelap */
  font-weight: bold;
}

.nav-links {
  display: flex;
  align-items: center; /* Pastikan semua sejajar di tengah secara vertikal */
  gap: 2rem;
  font-size: 18px;
}

.nav-links a {
  text-decoration: none;
  color: #333;
  padding: 5px 15px; /* Kasih padding ke SEMUA link biar ukurannya sama */
  border-radius: 20px; /* Taruh border-radius di sini */
  transition: all 0.2s ease; /* Opsional: Biar efek warnanya mulus pas diklik */
}

.nav-links a.active {
  background-color: #1d5d43;
  color: white;
  /* Nggak perlu nulis padding & border-radius lagi di sini karena udah diwarisi dari .nav-links a */
}

/* --- Tambahkan ini di bawah CSS nav-links kamu --- */
.notification-container {
  position: relative;
}

.notif-btn {
  background: none;
  border: none;
  cursor: pointer;
  color: #1d5d43;
  padding: 8px;
  display: flex;
  position: relative;
  border-radius: 50%;
}

.badge {
  position: absolute;
  top: 0;
  right: 0;
  background-color: #e74c3c;
  color: white;
  font-size: 0.7rem;
  font-weight: bold;
  padding: 2px 6px;
  border-radius: 10px;
}

.notif-dropdown {
  position: absolute;
  top: 130%;
  right: 0;
  width: 300px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
  border: 1px solid #eee;
  z-index: 999; /* Biar dropdown melayang di atas elemen lain */
}

.dropdown-header {
  padding: 1rem;
  border-bottom: 1px solid #eee;
}

.dropdown-header h4 {
  margin: 0;
  color: #1d5d43;
  font-size: 1rem;
}

.dropdown-list {
  max-height: 250px;
  overflow-y: auto;
}

.notif-item {
  display: flex;
  align-items: center;
  padding: 1rem;
  border-bottom: 1px solid #f5f5f5;
  cursor: pointer;
}

.notif-item:hover {
  background-color: #f9fdfa;
}

.notif-icon {
  font-size: 1.5rem;
  margin-right: 1rem;
}

.notif-text p {
  margin: 0;
}

.place-name {
  font-weight: bold;
  font-size: 0.9rem;
  color: #333;
}

.place-time {
  font-size: 0.8rem;
  color: #888;
}

.dropdown-footer {
  padding: 0.8rem;
  text-align: center;
  border-top: 1px solid #eee;
}

.dropdown-footer a {
  color: #1d5d43;
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: bold;
}
</style>