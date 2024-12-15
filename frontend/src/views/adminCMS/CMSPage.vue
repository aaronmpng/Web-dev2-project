<template>
  <div class="flex flex-col items-center mt-10">
    <h1 class="font-semibold text-3xl w-full">Sushi</h1>

    <div class="pt-5 w-full">
      <table class="table-auto border-collapse border-2 border-gray-300">
        <thead>
          <tr>
            <th class="px-5 py-10 font-semibold pt-5 text-left">Name</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Stock</th>
            <th class="px-10 py-10 font-semibold pt-5 text-left">Edit</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Delete</th>
          </tr>
        </thead>

        <tbody>
          <CMSMenuItems
            v-for="(item, index) in sushiArray"
            :key="index"
            :menu="item"
            class="text-center"
            @edit="navigateToEditPage"
            @delete="deleteItem"
          />
        </tbody>
      </table>
    </div>

    <h1 class="font-semibold text-3xl w-full mt-20">Ramen</h1>

    <div class="pt-5 w-full">
      <table class="table-auto border-collapse border-2 border-gray-300">
        <thead>
          <tr>
            <th class="px-5 py-10 font-semibold pt-5 text-left">Name</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Stock</th>
            <th class="px-10 py-10 font-semibold pt-5 text-left">Edit</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Delete</th>
          </tr>
        </thead>

        <tbody>
          <CMSMenuItems
            v-for="(item, index) in ramenArray"
            :key="index"
            :menu="item"
            class="text-center"
            @edit="navigateToEditPage"
            @delete="deleteItem"
          />
        </tbody>
      </table>
    </div>

    <h1 class="font-semibold text-3xl w-full mt-10">Curry</h1>

    <div class="pt-5 w-full">
      <table class="table-auto border-collapse border-2 border-gray-300">
        <thead>
          <tr>
            <th class="px-5 py-10 font-semibold pt-5 text-left">Name</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Stock</th>
            <th class="px-10 py-10 font-semibold pt-5 text-left">Edit</th>
            <th class="px-20 py-10 font-semibold pt-5 text-left">Delete</th>
          </tr>
        </thead>

        <tbody>
          <CMSMenuItems
            v-for="(item, index) in curryArray"
            :key="index"
            :menu="item"
            class="text-center"
            @edit="navigateToEditPage"
            @delete="deleteItem"
          />
        </tbody>
      </table>
    </div>
    <div class="h-20"></div>
  </div>
</template>

<script>
import CMSMenuItems from "./components/CMSMenuItems.vue";

export default {
  name: "CMSPage",

  components: {
    CMSMenuItems,
  },
  data() {
    return {
      sushiArray: [],
      ramenArray: [],
      curryArray: [],
      currentPage: 1,
      itemsPerpage: 6,
      searchQuery: "",
    };
  },

  mounted() {
    this.$store
      .dispatch("fetchProducts") 
      .then(() => {
        this.categorizeProducts(); 
      })
      .catch((error) => console.error("Error in mounted:", error));
  },

  methods: {
    categorizeProducts() {
      const products = this.$store.state.products; 
      this.sushiArray = [];
      this.ramenArray = [];
      this.curryArray = [];

      products.forEach((product) => {
        switch (product.category) {
          case "sushi":
            this.sushiArray.push(product);
            break;
          case "ramen":
            this.ramenArray.push(product);
            break;
          case "curry":
            this.curryArray.push(product);
            break;
          default:
            break;
        }
      });
    },

    navigateToEditPage(menu) {
      this.$store.commit("setCurrentMenu", menu); 
      this.$router.push({ name: "EditPage" });
    },

    deleteItem(id) {
      this.$store
        .dispatch("deleteItem", id) 
        .then(() => {
          this.categorizeProducts();
        })
        .catch(() => {
          alert("Failed to delete the item. Please try again.");
        });
    },
  },
};
</script>