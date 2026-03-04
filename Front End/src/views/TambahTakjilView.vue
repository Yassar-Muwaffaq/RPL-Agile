<script setup>
import { reactive } from "vue";

const form = reactive({
  nama_tempat: "",
  lokasi: "",
  jenis_takjil: "",
  makanan_berat: false,
  waktu_mulai: "",
  image: ""
});

const submitForm = async () => {
  // validasi minimal
  if (!form.nama_tempat || !form.lokasi || !form.jenis_takjil || !form.waktu_mulai) {
    alert("Lengkapi semua data wajib");
    return;
  }

  try {
    // contoh fetch ke backend
    await fetch("http://localhost:5000/takjil-baru", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(form),
    });

    alert("Takjil berhasil ditambahkan");

    // reset form
    Object.keys(form).forEach(key => form[key] = key === "makanan_berat" ? false : "");
  } catch (err) {
    console.error(err);
    alert("Gagal menambahkan data");
  }
};
</script>
<template>
  <div class="page-wrapper">
    <div class="form-card">
      <h2>Tambah Takjil</h2>

      <form @submit.prevent="submitForm">
        <label>
          Nama Tempat *
          <input v-model="form.nama_tempat" type="text" />
        </label>

        <label>
          Alamat / Lokasi *
          <input v-model="form.lokasi" type="text" />
        </label>

        <label>
          Jenis Takjil *
          <input v-model="form.jenis_takjil" type="text" placeholder="Kolak, Es Buah, dll" />
        </label>

        <label>
          Waktu Mulai *
          <input v-model="form.waktu_mulai" type="time" />
        </label>

        <label class="checkbox">
          <input v-model="form.makanan_berat" type="checkbox" />
          Tersedia Makanan Berat
        </label>

        <button type="submit" class="btn-submit">
          Simpan Data
        </button>
      </form>
    </div>
  </div>
</template>
<style scoped>
.page-wrapper {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f3f6f4;
}

.form-card {
  background-color: white;
  padding: 2rem;
  width: 100%;
  max-width: 420px;
  border-radius: 20px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

.form-card h2 {
  color: #1d5d43;
  margin-bottom: 1.5rem;
  text-align: center;
}

form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

label {
  display: flex;
  flex-direction: column;
  font-size: 0.85rem;
  color: #444;
}

input {
  margin-top: 0.3rem;
  padding: 0.6rem;
  border-radius: 10px;
  border: 1px solid #ccc;
}

.checkbox {
  flex-direction: row;
  align-items: center;
  gap: 0.5rem;
}

.btn-submit {
  margin-top: 1rem;
  padding: 0.7rem;
  background-color: #1d5d43;
  color: white;
  border: none;
  border-radius: 15px;
  cursor: pointer;
}
</style>