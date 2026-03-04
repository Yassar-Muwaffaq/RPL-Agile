<script setup>
defineEmits(['open-filter', 'search']);
</script>

<template>
  <div class="search-bar">
    <div class="input-container">
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="11" cy="11" r="8"></circle>
        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
      </svg>
      
      <input 
        type="text" 
        placeholder="Cari nama jalan,masjid,atau daerah.." 
        @input="$emit('search', $event.target.value)"
      />
    </div>
    
    <button class="filter-btn" @click="$emit('open-filter')">
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"></polygon>
      </svg>
    </button>
  </div>
</template>

<style scoped>
.search-bar {
  display: flex;
  gap: 1rem;
  max-width: 650px; /* Ukuran lebar maksimal diseimbangkan */
  margin: 0 auto;
}

.input-container {
  flex: 1;
  background-color: transparent; /* Latar belakang transparan */
  border: 1.5px solid white; /* Garis putih tegas */
  border-radius: 10px; /* Sudut melengkung halus (bukan bulat penuh) */
  display: flex;
  align-items: center;
  padding: 0.7rem 1.2rem;
}

.icon {
  color: white; /* Warna ikon putih */
  margin-right: 0.8rem;
}

input {
  border: none;
  width: 100%;
  outline: none;
  background-color: transparent;
  color: white; /* Teks yang diketik warna putih */
  font-size: 1rem;
}

/* Mengatur warna teks placeholder agar sama dengan desain */
input::placeholder {
  color: white; 
  opacity: 0.9;
  font-weight: 500;
}

.filter-btn {
  background-color: transparent;
  border: 1.5px solid white;
  padding: 0 1.2rem; /* Lebar tombol filter */
  border-radius: 10px; /* Sudut disamakan dengan input */
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: background-color 0.2s;
}

.filter-btn:hover {
  background-color: rgba(255, 255, 255, 0.15); /* Efek hover tipis */
}

.filter-btn .icon {
  margin-right: 0; /* Menghilangkan margin pada ikon filter karena dia sendirian */
}
</style>