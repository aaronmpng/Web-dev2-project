<template>
  <div>
    <div class="max-w-sm mx-auto pt-10 flex items-center justify-center">
      <form action="" class="w-full max-w-md" @submit.prevent="addProduct">
        <h1 class="text-2xl font-semibold text-gray-800 text-left">
          Add Product
        </h1>
        <div class="mb-6 pt-20">
          <label for="name" class="block mb-2">Name</label>
          <input
            type="text"
            id="name"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.name"
            required
          />
        </div>

        <div class="mb-6">
          <label for="description" class="block mb-2 text-gray-700"
            >Description</label
          >
          <textarea
            id="description"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.description"
            required
          ></textarea>
        </div>

        <div class="mb-6">
          <label for="price" class="block mb-2">Price</label>
          <input
            type="number"
            id="price"
            min="0"
            step="any"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.price"
            required
          />
        </div>

        <div class="mb-6">
          <label for="category" class="block mb-2">Category</label>
          <select
            id="category"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.category"
            required
          >
            <option value="" disabled>Select category</option>
            <option value="sushi">sushi</option>
            <option value="ramen">ramen</option>
            <option value="curry">curry</option>
          </select>
        </div>

        <div class="mb-6">
          <label for="stock" class="block mb-2">Stock</label>
          <input
            type="number"
            id="stock"
            min="0"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.stock"
            required
          />
        </div>

        <div class="mb-6">
          <label for="image" class="block mb-2 text-gray-700">Image link</label>
          <textarea
            id="image"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            v-model="product.image"
            required
          ></textarea>
        </div>

        <div class="text-start mb-6">
          <router-link
            to="/CMSPage"
            class="text-gray-500 underline hover:text-blue-700"
          >
            &lt; Back
          </router-link>
        </div>

        <div class="text-end">
          <button
            type="submit"
            class="bg-green-500 px-6 py-2 text-white font-semibold rounded-lg"
          >
            Add
          </button>
        </div>
      </form>
    </div>
    <div class="h-20"></div>
  </div>
</template>
  
  <script>
export default {
  name: "EditPage",
  data() {
  return {
    product: {
      name: "",
      description: "",
      price: null,
      stock: null,
      category: "",
      image: "",
    },
  };
},

  methods: {
    addProduct() {
      this.$store
        .dispatch("addProduct", this.product)
        .then(() => {
          this.$router.push("/CMSPage");
        })
        .catch(() => {
          alert("Registration failed. Please try again.");
        });
    },
  },
};
</script>