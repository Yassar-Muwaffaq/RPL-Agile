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

      <div class="profile">
        <div class="profile-icon"></div>
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

.profile-icon {
  width: 40px;
  height: 40px;
  background-color: #1d5d43;
  /* Ikon profil default */
  border-radius: 50%;
}
</style>