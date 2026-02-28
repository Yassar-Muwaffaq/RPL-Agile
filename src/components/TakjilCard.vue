<script setup>
defineProps({
  data: Object,
});
</script>

<template>
  <div class="takjil-card">
    <div class="card-image">
      <img :src="data.image" :alt="data.name" />
    </div>
    <div class="card-details">
      <h3>{{ data.name }}</h3>
      <p class="address"><i>📍</i> {{ data.address }}</p>
      <p class="time"><i>🕒</i> {{ data.time }}</p>
      <p class="menu"><i>🍲</i> {{ data.menu }}</p>

      <div v-if="data.hasHeavyFood" class="heavy-food-badge">
        Tersedia Makanan Berat
      </div>

      <button class="btn-pergi">Pergi Sekarang <i>➜</i></button>
    </div>
  </div>
</template>

<style scoped>
.takjil-card {
  background-color: white;
  border-radius: 20px;
  overflow: hidden;
  color: #333;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s;
  
  /* Tambahan: */
  display: flex;
  flex-direction: column;
  height: 100%;
}

.takjil-card:hover {
  transform: translateY(-5px);
}

.card-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-details {
  padding: 1.5rem;
  
  /* Tambahan: */
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

.card-details h3 {
  color: #1d5d43;
  margin-bottom: 0.5rem;
}

.card-details p {
  font-size: 0.9rem;
  margin-bottom: 0.3rem;
  color: #555;
}

.heavy-food-badge {
  background-color: #1d5d43;
  color: white;
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.8rem;
  
  /* Hapus display: inline-block; kalau ada, ganti dengan align-self */
  /* align-self memberi tahu badge agar tidak mengikuti parent yang stretch */
  align-self: flex-start; 

  /* Beri sedikit margin agar tidak terlalu mepet teks di atas/bawah */
  margin: 1rem 0;
}

.btn-pergi {
  background-color: #1d5d43;
  color: white;
  border: none;
  padding: 0.7rem 1.5rem;
  border-radius: 15px;
  cursor: pointer;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 0.5rem;
  
  /* Tambahan: */
  margin-top: auto; 
}
</style>