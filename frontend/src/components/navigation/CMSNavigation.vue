<template>
  <nav>
    <div class="mt-36 flex flex-col space-y-2 px-5 md:px-20 lg:px-40">
      <router-link
        to="/CMSPage"
        class="block px-4 py-2 text-center text-white bg-yellow-500 transition duration-300 rounded-lg border-2 border-gray-400"
      >
        Menu
      </router-link>

      <router-link
        to="/AddProductsPage"
        class="block px-4 py-2 text-center text-white bg-yellow-500 transition duration-300 rounded-lg border-2 border-gray-400"
      >
        Add Product
      </router-link>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'CMSNavigation',
};
</script>