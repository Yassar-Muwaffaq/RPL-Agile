<script setup>
const emit = defineEmits(["tambah"]);

const tambahData = () => {
  emit("tambah");
};
</script>

<template>
  <router-link to="/new-takjil" class="takjil-card empty">
    <div class="plus-wrapper">
      <div class="plus-icon">+</div>
      <p class="plus-text">Tambah Takjil</p>
    </div>
  </router-link>
</template>

<style scoped>
.takjil-card {
  background-color: #f9faf9;
  border-radius: 20px;
  color: #1d5d43;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
  transition: all 0.2s ease;
  height: 100%;
  cursor: pointer;

  display: flex;
  justify-content: center;
  align-items: center;
}

.takjil-card.empty {
  border: 2px dashed #1d5d43;
}

.takjil-card:hover {
  transform: translateY(-5px);
  background-color: #eef5f1;
}

.plus-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.plus-icon {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background-color: #1d5d43;
  color: white;
  font-size: 3rem;
  font-weight: bold;

  display: flex;
  justify-content: center;
  align-items: center;
}

.plus-text {
  font-size: 0.9rem;
  font-weight: 500;
  font-style: normal;
}
</style>