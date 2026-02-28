<script setup>
import { ref } from 'vue';

const emit = defineEmits(['close-modal', 'apply-filter']);

// State untuk menyimpan pilihan filter
const isHeavyFood = ref(false);
const timeFilter = ref('semua'); // Pilihannya: 'semua', 'sebelum', 'setelah'
const menuFilter = ref('');

// Fungsi saat tombol terapkan diklik
const applyFilter = () => {
  emit('apply-filter', {
    heavyFood: isHeavyFood.value,
    time: timeFilter.value,
    menu: menuFilter.value
  });
  emit('close-modal');
};
</script>

<template>
  <div class="modal-overlay" @click.self="$emit('close-modal')">
    <div class="modal-content">
      <h2>FILTER PENCARIAN</h2>

      <div class="filter-group">
        <label><input type="checkbox" v-model="isHeavyFood" /> Makanan Berat</label>
      </div>

      <div class="filter-group">
        <h3>WAKTU MULAI</h3>
        <label><input type="radio" value="semua" v-model="timeFilter" /> Semua</label>
        <label><input type="radio" value="sebelum" v-model="timeFilter" /> Sebelum 17.00</label>
        <label><input type="radio" value="setelah" v-model="timeFilter" /> Setelah 17.00</label>
      </div>

      <div class="filter-group">
        <h3>JENIS TAKJIL</h3>
        <input type="text" placeholder="Masukkan (contoh: es buah).." v-model="menuFilter" />
      </div>

      <button class="btn-terapkan" @click="applyFilter">
        TERAPKAN
      </button>
    </div>
  </div>
</template>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); /* Overlay gelap transparan */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-content {
  background-color: white;
  padding: 3rem;
  border-radius: 30px;
  width: 400px;
  color: #333;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

.modal-content h2 {
  color: #1d5d43;
  text-align: center;
  margin-bottom: 2rem;
}

.filter-group {
  margin-bottom: 1.5rem;
}

.filter-group h3 {
  font-size: 1rem;
  color: #1d5d43;
  margin-bottom: 0.5rem;
}

.filter-group label {
  display: block;
  margin-bottom: 0.5rem;
}

.btn-terapkan {
  background-color: #1d5d43;
  color: white;
  border: none;
  padding: 0.75rem 2rem;
  border-radius: 10px;
  width: 100%;
  margin-top: 1rem;
  cursor: pointer;
}
</style>