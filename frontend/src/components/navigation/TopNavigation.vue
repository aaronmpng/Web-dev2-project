<template>
  <nav class="bg-gray-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
      <router-link to="/">
        <div
          class="text-white text-2xl font-bold text-start px-5 md:px-20 lg:px-40"
        >
          Kazetsu
        </div>
      </router-link>

      <div class="lg:hidden flex items-center">
        <button @click="toggleMenu" class="text-white">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            class="w-6 h-6"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
        </button>
      </div>

      <ul :class="{ hidden: true }" class="lg:flex space-x-4">
        <router-link
          to="/"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': $route.path === '/',
            'bg-gray-800': $route.path !== '/',
          }"
        >
          Home
        </router-link>

        <router-link
          to="/TakeAwayPage"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': [
              '/TakeAwayPage/sushi',
              '/TakeAwayPage/curry',
              '/TakeAwayPage/ramen',
            ].includes($route.path),
            'bg-gray-800': ![
              '/TakeAwayPage/sushi',
              '/TakeAwayPage/curry',
              '/TakeAwayPage/ramen',
            ].includes($route.path),
          }"
        >
          Take-away
        </router-link>

        <router-link
          to="/ShoppingCartPage"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': $route.path === '/ShoppingCartPage',
            'bg-gray-800': $route.path !== '/ShoppingCartPage',
          }"
        >
          Shopping cart
        </router-link>

        <router-link
          v-if="isAdmin"
          to="/CMSPage"
          class="px-4 py-2 text-black bg-yellow-500 transition duration-300 rounded-lg"
        >
          CMS
        </router-link>

        <router-link
          v-if="isAuthenticated"
          to="/loginPage"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
        >
          Logout
        </router-link>

        <router-link
          v-else
          to="/loginPage"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
        >
          Login
        </router-link>
      </ul>
    </div>

    <div v-if="menuOpen" class="lg:hidden bg-gray-800 p-4">
      <ul class="space-y-4">
        <router-link
          to="/"
          class="px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': $route.path === '/',
            'bg-gray-800': $route.path !== '/',
          }"
        >
          Home
        </router-link>

        <router-link
          to="/TakeAwayPage"
          class="block px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': [
              '/TakeAwayPage/sushi',
              '/TakeAwayPage/curry',
              '/TakeAwayPage/ramen',
            ].includes($route.path),
            'bg-gray-800': ![
              '/TakeAwayPage/sushi',
              '/TakeAwayPage/curry',
              '/TakeAwayPage/ramen',
            ].includes($route.path),
          }"
        >
          Take-away
        </router-link>

        <router-link
          to="/ShoppingCartPage"
          class="block px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
          :class="{
            'bg-gray-700 text-yellow-400': $route.path === '/ShoppingCartPage',
            'bg-gray-800': $route.path !== '/ShoppingCartPage',
          }"
        >
          Shopping cart
        </router-link>

        <router-link
          v-if="isAdmin"
          to="/CMSPage"
          class="block px-4 py-2 text-black bg-yellow-500 transition duration-300 rounded-lg"
        >
          CMS
        </router-link>

        <router-link
          to="/LoginPage"
          class="block px-4 py-2 text-white hover:bg-gray-700 transition duration-300 rounded-lg"
        >
          Logout
        </router-link>
      </ul>
    </div>
  </nav>
</template>
  
  <script>
export default {
  name: "TopNavigation",
  data() {
    return {
      menuOpen: false,
    };
  },

  computed: {
    isAdmin() {
      return this.$store.getters.isAdmin;
    },

    isAuthenticated() {
      return this.$store.getters.isAuthenticated;
    },
  },

  methods: {
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
    },
  },
};
</script>
  