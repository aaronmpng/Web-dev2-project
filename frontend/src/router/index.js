import { createRouter, createWebHistory } from 'vue-router'

import HomePage from '../views/HomePage.vue';
import LoginPage from '../views/auth/LoginPage.vue';
import RegisterPage from '../views/auth/RegisterPage.vue';
import TakeAwayPage from '../views/takeAway/TakeAwayPage.vue';
import ShoppingCartPage from '../views/shoppingCart/ShoppingCartPage.vue';
import CMSPage from '../views/adminCMS/CMSPage.vue';
import HistoryPage from '../views/adminCMS/HistoryPage.vue';
import EditPage from '../views/adminCMS/EditPage.vue';
import AddProductsPage from '../views/adminCMS/AddProductsPage.vue';

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL || '/')
,
    routes: [
      { path: '/', component: HomePage, name: 'home' },
      { path: '/LoginPage', component: LoginPage, name: 'login' },
      { path: '/RegisterPage', component: RegisterPage, name: 'register' },
      { path: '/TakeAwayPage', redirect: '/TakeAwayPage/sushi'},
      { path: '/TakeAwayPage/:category', component: TakeAwayPage, name: 'takeAway', props: true },
      { path: '/ShoppingCartPage', component: ShoppingCartPage, name: 'shoppingCart'},
      { path: '/CMSPage', component: CMSPage, name: 'menu' },
      { path: '/HistoryPage', component: HistoryPage, name: 'history' },
      { path: '/EditPage', component: EditPage, name: 'EditPage', props:true},
      { path: '/AddProductsPage', component: AddProductsPage, name: 'addProduct' }
    ]
  })

export default router