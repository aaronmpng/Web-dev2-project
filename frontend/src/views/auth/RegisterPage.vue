<template>
  <div>
    <div class="h-20 bg-gray-800"></div>
    <div class="max-w-sm mx-auto pt-10 flex items-center justify-center">
      <p class="absolute top-5 font-semibold text-3xl text-white">Register</p>

      <form action="" class="w-full max-w-md" @submit.prevent="register">
        <div class="mb-6 pt-20">
          <label for="email" class="block mb-2">Email</label>
          <input
            type="email"
            id="email"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            placeholder="Enter your email"
            v-model="email"
            required
          />
        </div>

        <div class="mb-6">
          <label for="username" class="block mb-2">Username</label>
          <input
            type="text"
            id="username"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            placeholder="Enter your username"
            v-model="username"
            required
          />
        </div>

        <div class="mb-6">
          <label for="password" class="block mb-2">Password</label>
          <input
            type="password"
            id="password"
            class="bg-gray-300 text-sm px-4 py-2 w-full rounded-lg border-2 border-gray-400"
            placeholder="Enter your password"
            v-model="password"
            required
          />
        </div>

        <div class="text-start mb-6">
          <router-link
            to="/LoginPage"
            class="text-gray-500 underline hover:text-blue-700"
          >
            &lt; Login
          </router-link>
        </div>

        <div class="text-end">
          <button
            type="submit"
            class="bg-green-500 px-6 py-2 text-white font-semibold rounded-lg"
          >
            Register
          </button>
        </div>

        <div v-if="successMessage" class="text-green-700 text-sm mb-6 text-left mt-5 font-semibold">
            {{ successMessage }}
          </div>
      </form>
    </div>
  </div>
</template>

  <script>
export default {
  name: "RegisterPage",

  data() {
    return {
      email: "",
      username: "",
      password: "",
      successMessage: "",
    }; 
  },
  methods: {
    register() {
      this.successMessage = "";
      this.errorMessage = null;

      this.$store
        .dispatch("register", {
          username: this.username,
          email: this.email,
          password: this.password,
        })
        .then(() => {
          this.successMessage = "Register success.";
          this.$router.push("/");
        })
        .catch(() => {
          this.errorMessage = "Registration failed. Please try again.";
        });
    },
  },
};
</script>