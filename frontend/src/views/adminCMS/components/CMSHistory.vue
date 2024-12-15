<template>
    <tr>
      <td class="px-10 py-3 border-b border-gray-300 text-left">{{ history.name }}</td>
      <td class="px-10 py-3 border-b border-gray-300 text-left">{{ history.category }}</td>
      <td class="px-10 py-3 border-b border-gray-300 text-right">{{ history.price }}</td>
      <td class="px-10 py-3 border-b border-gray-300 text-left">{{ history.amount }}</td>

    </tr>
  </template>  
  
<script>
export default {
  name: "ShoppingCartItems",
  props: {
    history: Object,
  },
};
</script>