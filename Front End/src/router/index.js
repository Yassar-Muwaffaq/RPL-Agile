import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SearchView from '../views/SearchView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/agenda', // Asumsi halaman search/agenda
      name: 'agenda',
      component: SearchView
    },
    {
      path: '/new-takjil',
      name: 'new-takjil',
      component: () => import('../views/TambahTakjilView.vue') // Lazy load komponen
    }
  ]
})

export default router