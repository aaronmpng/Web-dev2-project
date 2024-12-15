<template>
  <div>
    <TopNavigation v-if="shouldShowNavigation" />
    <div v-if="shouldShowCMSNavigation" class="flex h-screen">
      <CMSNavigation />

      <div class="flex-1 p-8 flex justify-center mt-20">
        <div class="w-full">
          <router-view />
        </div>
      </div>
    </div>

    <router-view v-else />
  </div>
</template>

<script>
import TopNavigation from './components/navigation/TopNavigation.vue';
import CMSNavigation from '@/components/navigation/CMSNavigation.vue';
import { computed } from 'vue';
import { useRoute } from 'vue-router';

export default {
  name: "App",
  components: {
    TopNavigation,
    CMSNavigation,
  },
  setup() {
    const route = useRoute();

    const shouldShowNavigation = computed(() => !['login', 'register'].includes(route.name));
    const shouldShowCMSNavigation = computed(() => ['menu', 'history'].includes(route.name));

    return { shouldShowNavigation, shouldShowCMSNavigation };
  },
};
</script>
