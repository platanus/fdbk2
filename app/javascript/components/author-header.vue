<script setup lang="ts">
import { ref } from 'vue';
import type { FeedbackSession } from 'api/feedback-sessions';

interface Props {
  feedbackSession: FeedbackSession
}

const props = defineProps<Props>();

const feedbackSessionData = ref<FeedbackSession>(props.feedbackSession);
</script>

<template>
  <div class="container mt-5 w-3/5 max-w-7xl place-content-start rounded bg-gray-50">
    <div
      v-if="feedbackSessionData"
      class="grid grid-cols-2 gap-2 p-2 sm:grid-cols-2 md:grid-cols-2"
    >
      <div>
        <p class="text-gray-500">
          Realizada por:
        </p>
        <div class="flex items-center gap-3.5 p-1.5">
          <img
            src="https://via.placeholder.com/150"
            alt="Placeholder"
            class="h-5 w-5 rounded-full border-2 border-indigo-400"
          >
          {{ feedbackSessionData.provider.name }}
        </div>
      </div>

      <div>
        <p class="text-gray-500">
          Fecha:
        </p>
        <div class="flex items-center">
          {{ feedbackSessionData.sessionDate }}
        </div>
      </div>
    </div>
  </div>
</template>
