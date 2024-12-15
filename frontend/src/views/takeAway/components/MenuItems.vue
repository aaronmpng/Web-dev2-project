<template>
  <div>
    <img
      v-if="menu.image"
      :src="menu.image"
      :alt="menu.name"
      class="w-full h-40 object-cover rounded-t-lg"
    />

    <div class="flex justify-between items-center mt-4 ml-5">
      <h3 class="text-xl font-bold mt-4">{{ menu.name }}</h3>
    </div>
    <p class="text-gray-700 mt-2 text-left ml-5">{{ menu.description }}</p>
    <p class="text-gray-700 font-semibold mt-2 text-left ml-5">
      {{ menu.price }}
    </p>

    <div class="relative flex items-center mt-4">
      <div class="flex-grow flex justify-center mb-3">
        <input
          type="number"
          class="w-16 text-center border-2 border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          min="0"
          v-model.number="amount"
        />
      </div>
      <button
        class="absolute right-0 bg-green-500 px-4 py-1 text-white font-semibold rounded-lg mr-5 mb-5"
        @click="this.$emit('buy', menu, amount)"
      >
        Add
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: "MenuItems",
  props: {
    menu: Object,
  },
};
</script>