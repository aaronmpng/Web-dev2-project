<template>
  <div>
    <img
      src="images/sushi-background.jpg"
      alt="Example"
      class="w-full h-80 object-cover"
    />

    <div class="pt-10 px-5 md:px-20 lg:px-40">
      <p class="font-semibold text-2xl">Discover Kazetsu</p>
    </div>

    <div class="pt-2 px-5 md:px-20 lg:px-40">
      <p class="text-lg text-gray-700 mt-4">
        Kazetsu is a traditional Japanese restaurant offering a variety of
        authentic dishes, from sushi to ramen, and everything in between.
        Whether you're craving fresh sashimi or a warm bowl of udon, Kazetsu
        delivers a memorable dining experience. Our commitment to using only the
        freshest ingredients and creating an inviting atmosphere ensures that
        every visit is a culinary adventure. Join us to discover the rich
        flavors of Japan, brought to you with love and care.
      </p>
    </div>

    <div class="pt-20 px-5 md:px-20 lg:px-40">
      <p class="font-semibold text-2xl">Take-away</p>
    </div>

    <div
      class="pt-2 px-5 md:px-20 lg:px-40 flex flex-col md:flex-row items-center"
    >
      <div class="md:w-2/3 h-full flex items-center">
        <p class="text-lg text-gray-700">
          We offer an easy and convenient take-away service, bringing the
          authentic flavors of Japan straight to you. Whether you're craving our
          signature sushi rolls, a warm bowl of ramen, or crispy tempura, you
          can enjoy it all without stepping foot in the restaurant. Our
          take-away menu is designed to offer a wide selection of your favorite
          dishes, all carefully prepared with the finest ingredients. Order
          online, and our skilled chefs will ensure that your meal is freshly
          prepared, packed, and ready for you to enjoy at home. Experience the
          true taste of Japanese culinary excellence, wherever you are!
        </p>
      </div>

      <div class="md:w-1/3 mt-4 md:mt-0 flex items-center justify-center ml-1">
        <img
          src="images/tempura-background.jpg"
          alt="Tempura"
          class="w-96 h-48 object-cover"
        />
      </div>
    </div>

    <div class="text-start pt-2 px-5 md:px-20 lg:px-40">
      <router-link to="/TakeAwayPage">
        <button
          type="submit"
          class="bg-green-500 px-6 py-2 text-white font-semibold rounded-lg"
        >
          Take-away
        </button>
      </router-link>
    </div>

    <div class="h-20"></div>
  </div>
</template>
  
  <script>
</script>
      