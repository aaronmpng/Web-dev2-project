<template>
  <div>
    <div class="h-20 bg-gray-800"></div>
    <div class="max-w-sm mx-auto pt-20 flex items-center justify-center">
      <p class="absolute top-5 font-semibold text-3xl text-white">Login</p>

      <form action="" class="w-full max-w-md" @submit.prevent="login">
        <div class="mb-6 pt-10">
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
            to="/RegisterPage"
            class="text-gray-500 underline hover:text-blue-700"
          >
            &gt; Register
          </router-link>
        </div>
        
        <div class="text-end">
          <button
            type="submit"
            @click="login()"
            class="bg-green-500 px-6 py-2 text-white font-semibold rounded-lg"
          >
            Login
          </button>

          <div v-if="errorMessage" class="text-red-500 text-sm mb-6 text-left mt-5">
            {{ errorMessage }}
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: "LoginPage",

  data() {
    return {
      username: "",
      password: "",
      errorMessage: null,
    };
  },
  methods: {
    login() {
      this.errorMessage = null;

      if(!this.username.trim() || !this.password.trim()){
        this.errorMessage = "Username or password cannot be empty";
        return;
      }

      this.$store
        .dispatch("login", {
          username: this.username,
          password: this.password,
        })
        .then(() => {
          const userRole = this.$store.state.role;

          if (userRole === "admin") {
            this.$router.push("/");
          } else if (userRole === "user") {
            this.$router.push("/");
          }
        })
        .catch(() => {
          this.errorMessage = "Incorrect email or password. Please try again.";
        });
    },
  },
};
</script>