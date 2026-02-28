import { createApp } from 'vue'
import App from './App.vue'
import router from './router' // Tambahkan baris ini

const app = createApp(App)

app.use(router) // Tambahkan baris ini
app.mount('#app')