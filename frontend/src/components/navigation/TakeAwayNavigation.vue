<template>
  <nav class="p-4 flex space-x-1">
    <router-link
      :to="{ name: 'takeAway', params: { category: 'sushi' } }"
      class="px-4 py-2 text-yellow-400 font-semibold rounded-lg"
      :class="{ 'bg-gray-700': $route.params.category === 'sushi', 'bg-gray-400': $route.params.category !== 'sushi' }"
    >
      Sushi
    </router-link>

    <router-link
      :to="{ name: 'takeAway', params: { category: 'ramen' } }"
      class="px-4 py-2 text-yellow-400 font-semibold rounded-lg"
      :class="{ 'bg-gray-700': $route.params.category === 'ramen', 'bg-gray-400': $route.params.category !== 'ramen' }"
    >
      Ramen
    </router-link>

    <router-link
      :to="{ name: 'takeAway', params: { category: 'curry' } }"
      class="px-4 py-2 text-yellow-400 font-sem rounded-lg"
      :class="{ 'bg-gray-700': $route.params.category === 'curry', 'bg-gray-400': $route.params.category !== 'curry' }"
    >
      Curry
    </router-link>
  </nav>
</template>


<script>
</script>