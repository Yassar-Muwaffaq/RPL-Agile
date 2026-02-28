<script setup>
import Navbar from '@/components/Navbar.vue';
import SearchBar from '@/components/SearchBar.vue';
import TakjilCard from '@/components/TakjilCard.vue';
import FilterModal from '@/components/FilterModal.vue';
import { ref, computed } from 'vue';

const showFilter = ref(false);

// State untuk menyimpan kata kunci pencarian dan filter aktif
const searchQuery = ref('');
const activeFilters = ref({
  heavyFood: false,
  time: 'semua',
  menu: ''
});

// Data asli (biarkan sama)
const takjilLocations = ref([
  { id: 1, image: '/masjid/masjid1.jpg', name: 'Masjid Daarut Tauhid', address: 'Jl. Gegerkalong Girang No.38', time: '17.00 - 18.30', menu: 'Es Buah, Gorengan', hasHeavyFood: true },
  { id: 2, image: '/masjid/masjid2.jpg', name: 'Masjid Al-Furqon', address: 'Jl. Dr. Setiabudi No.229', time: '16.30 - 18.30', menu: 'Es Doger, Martabak', hasHeavyFood: false },
  { id: 3, image: '/masjid/rumah_zahran.jpg', name: 'Rumah Zahran', address: 'Jl. Saranjana', time: '17.00 - 18.30', menu: 'Es Buah, Gorengan, Semua', hasHeavyFood: true },
  { id: 4, image: '/masjid/rumah_zahran.jpg', name: 'Rumah Zahran', address: 'Jl. Saranjana', time: '17.00 - 18.30', menu: 'Es Buah, Gorengan, Semua', hasHeavyFood: true }
]);

// Fungsi untuk menangkap event dari child component
const handleSearch = (query) => { searchQuery.value = query; };
const handleApplyFilter = (filters) => { activeFilters.value = filters; };

// MAGIC-NYA DI SINI: Data yang ditampilkan adalah hasil filter otomatis
const filteredLocations = computed(() => {
  return takjilLocations.value.filter(loc => {
    // 1. Filter Pencarian (Nama & Alamat)
    const query = searchQuery.value.toLowerCase();
    const matchSearch = loc.name.toLowerCase().includes(query) || loc.address.toLowerCase().includes(query);

    // 2. Filter Makanan Berat
    const matchHeavyFood = activeFilters.value.heavyFood ? loc.hasHeavyFood === true : true;

    // 3. Filter Waktu (Ubah "17.00" jadi angka 17 biar gampang dicek)
    let matchTime = true;
    const startTime = parseFloat(loc.time.split(' - ')[0].replace('.', '.')); 
    if (activeFilters.value.time === 'sebelum') matchTime = startTime < 17.00;
    else if (activeFilters.value.time === 'setelah') matchTime = startTime >= 17.00;

    // 4. Filter Jenis Menu
    const menuQuery = activeFilters.value.menu.toLowerCase();
    const matchMenu = menuQuery ? loc.menu.toLowerCase().includes(menuQuery) : true;

    // Jika semua kondisi terpenuhi (true), tampilkan card-nya
    return matchSearch && matchHeavyFood && matchTime && matchMenu;
  });
});
</script>

<template>
  <Navbar />
  <div :class="['search-view-container', { 'modal-open': showFilter }]">
    <div class="search-header-bg">
      <div class="search-header">
        <h1>BERBURU TAKJIL MAKIN MUDAH & CEPAT</h1>
        
        <SearchBar @open-filter="showFilter = true" @search="handleSearch" />
        
        <p class="quote">
          Sedekah tidak akan mengurangi harta, justru ia menjadi pintu pembuka rezeki yang lebih luas.
        </p>
      </div>
    </div>

    <div class="card-grid-container">
      <div class="card-grid">
        <TakjilCard
          v-for="location in filteredLocations"
          :key="location.id"
          :data="location"
        />
      </div>
      <div v-if="filteredLocations.length === 0" style="text-align: center; width: 100%; grid-column: 1 / -1;">
        <h3 style="color: #666;">Maaf, lokasi takjil tidak ditemukan :(</h3>
      </div>
    </div>
  </div>

  <FilterModal v-if="showFilter" @close-modal="showFilter = false" @apply-filter="handleApplyFilter" />
</template>

<style scoped>
.search-view-container {
  background-color: #fdf6e3; /* Warna dasar krem untuk area bawah */
  min-height: 100vh;
  transition: filter 0.3s ease;
}

.search-view-container.modal-open {
  filter: blur(5px);
}

/* Kotak hijau khusus header */
.search-header-bg {
  background-color: #1d5d43; 
  padding: 4rem 1rem 5rem 1rem; /* Padding bawah lebih besar */
  color: white;
}

.search-header {
  text-align: center;
  max-width: 850px;
  margin: 0 auto;
}

.search-header h1 {
  font-size: 2.2rem;
  margin-bottom: 2rem;
  font-weight: bold;
}

.quote {
  max-width: 700px;
  margin: 3rem auto 0; /* Jarak dari search bar diperlebar */
  font-size: 1.6rem;
  font-weight: 600; /* Ditebalkan sedikit mengikuti desain */
  line-height: 1.4;
}

.card-grid-container {
  padding: 3rem 1rem;
}

.card-grid {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
}
</style>