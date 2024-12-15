<template>
    <div class="flex flex-col items-center mt-10">
      <h1 class="font-semibold text-3xl w-full">Sales</h1>
  
      <div class="mt-10 w-full">
        <table class="table-auto border-collapse border-2 border-gray-300">
          <thead>
            <tr>
              <th class="px-10 py-10 font-semibold pt-5 text-left">Name</th>
              <th class="px-10 py-10 font-semibold pt-5 text-left">Category</th>
              <th class="px-10 py-10 font-semibold pt-5 text-right">Price</th>
              <th class="px-10 py-10 font-semibold pt-5 text-left">Amount</th>
            </tr>
          </thead>
  
            <tbody>
              <CMSHistory
                v-for="(item, index) in items"
                :key="index"
                :history="item"
              />
            </tbody>
        </table>
  
        <div class="flex justify-start mt-10 font-semibold">
          <p>Total income: {{ totalPrice }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
    import CMSHistory from './components/CMSHistory.vue';
  
  export default {
    name: "ShoppingCartPage",
    components: {
        CMSHistory,
    },
  
    data() {
      return {
        items: [
          {
            name: "Salmon Roll",
            category: "sushi",
            price: 9.99,
            amount: 3,
          },
          {
            name: "Miso ramen",
            category: "ramen",
            price: 14.99,
            amount: 3,
          },
          {
            name: "Tonkatsu curry",
            category: "curry",
            price: 14.99,
            amount: 1,
          },
        ],
      };
    },
    computed: {
      totalPrice() {
        let total = 0;
        this.items.forEach((item) => {
          total += item.price * item.amount;
        });
        return total.toFixed(2);
      },
    },
  };
  </script>