<template>
  <div class="flex flex-col items-center">
    <div class="pt-10 font-semibold text-3xl w-full max-w-4xl">Take-away</div>

    <div class="w-full max-w-4xl mt-10 flex items-center justify-between">
      <div class="flex justify-start">
        <TakeAwayNavigation />
      </div>

      <div class="flex justify-end">
        <input
          type="text"
          v-model="searchQuery"
          placeholder="Search for items..."
          class="border-2 border-gray-300 px-4 py-2 focus:outline-none focus:ring focus:border-blue-500 rounded-lg"
        />
      </div>
    </div>

    <div class="w-full max-w-4xl mt-8">
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
        <MenuItems
          v-for="(item, index) in paginatedItems"
          :key="index"
          :menu="item"
          @buy="addItem"
          class="border-2 border-gray-300 rounded-lg text-center"
        />
      </div>

      <div
        v-if="shouldShowPagination"
        class="mt-20 flex justify-center space-x-4"
      >
        <button
          @click="prevPage"
          :disabled="currentPage === 1"
          class="px-3 py-1 text-black hover:bg-gray-400 disabled:opacity-50 rounded-lg"
        >
          &lt;&lt; Previous
        </button>

        <span>page {{ currentPage }} of {{ totalPages }}</span>

        <button
          @click="nextPage"
          :disabled="currentPage === totalPages"
          class="px-3 py-1 text-black hover:bg-gray-400 disabled:opacity-50 rounded-lg"
        >
          Next &gt;&gt;
        </button>
      </div>
    </div>

    <div class="h-20"></div>
  </div>
</template>

<script>
import MenuItems from "./components/MenuItems.vue";
import TakeAwayNavigation from "../../components/navigation/TakeAwayNavigation.vue";

export default {
  name: "TakeAwayPage",
  components: {
    TakeAwayNavigation,
    MenuItems,
  },
  data() {
    return {
      sushiArray: [],
      ramenArray: [],
      curryArray: [],
      boughtItems: [],
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

  computed: {
    selectedCategory() {
      return this.$route.params.category || "sushi"; 
    },
    itemsArray() {
      switch (this.selectedCategory) {
        case "ramen":
          return this.ramenArray;
        case "curry":
          return this.curryArray;
        default:
          return this.sushiArray;
      }
    },

    filteredItems() {
      const search = this.searchQuery.trim().toLowerCase();
      return this.itemsArray.filter((item) =>
        item.name.toLowerCase().includes(search)
      );
    },

    totalPages() {
      return Math.ceil(this.itemsArray.length / this.itemsPerpage);
    },
    paginatedItems() {
      const start = (this.currentPage - 1) * this.itemsPerpage;
      const end = start + this.itemsPerpage;
      return this.filteredItems.slice(start, end);
    },

    shouldShowPagination() {
      return this.totalPages > 1;
    },
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

    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
      }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },

    addItem(menu, amount) {
      this.$store.commit("ADD_TO_CART", {menu, amount})
      alert("Product added to cart!");
    }
  },
};
</script>
