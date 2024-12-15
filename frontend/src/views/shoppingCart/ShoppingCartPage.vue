<template>
  <div class="flex flex-col items-center pt-20">
    <h1 class="font-semibold text-3xl w-full max-w-4xl">Shopping cart</h1>

    <div class="pt-10 w-full max-w-4xl mt-10">
      <table class="table-auto border-collapse border-2 border-gray-300 w-full">
        <thead>
          <tr>
            <th class="px-10 py-10 font-semibold pt-5 text-left">Name</th>
            <th class="px-10 py-10 font-semibold pt-5 text-left">Category</th>
            <th class="px-10 py-10 font-semibold pt-5 text-right">Price</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Amount</th>
          </tr>
        </thead>

        <tbody>
          <ShoppingCartItems
            v-for="(item, index) in items"
            :key="index"
            :cartItems="item"
            @remove="removeItem"
          />
        </tbody>
      </table>

      <div class="flex justify-end mt-10 font-semibold">
        <p>Total price: {{ totalPrice }}</p>
      </div>

      <div class="flex justify-end mt-5">
        <button
          @click="buy"
          class="bg-green-500 px-6 py-2 text-white font-semibold rounded-lg"
        >
          Buy
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import ShoppingCartItems from "./components/ShoppingCartItems.vue";

export default {
  name: "ShoppingCartPage",
  components: {
    ShoppingCartItems,
  },

  computed: {
    items() {
      return this.$store.state.cart;
    },

    totalPrice() {
      let total = 0;
      this.items.forEach((item) => {
        total += item.price * item.amount;
      });
      return total.toFixed(2);
    },
  },

  methods: {
    removeItem(id) {
      this.$store.commit("REMOVE_FROM_CART", id);
    },

    buy() {
      const menu = {
        items: this.items.map((item) => ({
          id: item.id, 
          name: item.name,
          description: item.description,
          price: item.price,
          stock: item.stock - item.amount, 
          category: item.category,
          image: item.image,
          amount: item.amount, 
        })),
      };

      this.$store
        .dispatch("buyProducts", menu) 
        .then(() => {
          this.$router.push("/ShoppingCartPage"); 
        })
        .catch(() => {
          alert("Something went wrong. Please try again.");
        });
        this.$store.commit("CLEAR_CART");
        alert("Product bought. Thank you for your purchase!");
    },
  },
};
</script>