<script setup lang="ts">
import { ref, watch } from 'vue';
import type { FeedbackSession } from 'api/feedback-sessions';
import type { Comment } from 'api/comments';

interface Props {
  feedbackSession: string,
  comments: string
}

const props = defineProps<Props>();

const feedbackSessionData = ref<FeedbackSession | null>(props.feedbackSession ?
  JSON.parse(props.feedbackSession) : null);
const commentsData = ref<Comment[] | null>(props.comments ?
  JSON.parse(props.comments) : null);

watch(
  () => props.feedbackSession,
  (newVal) => {
    if (newVal) {
      feedbackSessionData.value = JSON.parse(newVal);
    }
  },
);

watch(
  () => props.comments,
  (newVal) => {
    if (newVal) {
      commentsData.value = JSON.parse(newVal);
    }
  },
);

function navigateToFeedbackSession() {
  (window as Window).location.href = '/';
}

</script>

<template>
  <div class="mx-auto mt-5 max-w-7xl">
    <base-title class="mx-auto max-w-7xl">
      Sesiones de Feedback #{{ feedbackSessionData?.id }}
    </base-title>
    <button
      class="rounded-full bg-gray-50 py-2 px-4"
      @click="navigateToFeedbackSession"
    >
      <inline-svg
        :src="require('images/icons/left-arrow.svg')"
        class="h-4 w-4 fill-indigo-900"
      />
    </button>
    <div class="container mx-auto mt-2.5">
      <div class="rounded bg-gray-50">
        <div v-if="feedbackSessionData">
          <div class="grid grid-cols-2 gap-2 sm:grid-cols-2 md:grid-cols-2 ">
            <div class="p-2">
              Realizada por
              <div class="mx-auto grid grid-cols-2 content-start gap-2">
                <div class="gap-2">
                  <div class="flex items-center gap-2 p-2">
                    <img
                      src="https://via.placeholder.com/150"
                      alt="Placeholder"
                      class="h-5 w-5 rounded-full"
                    >
                    {{ feedbackSessionData.provider.name }}
                  </div>
                </div>
              </div>
            </div>
            <div class="p-2">
              Fecha:
              <div class="flex items-center ">
                {{ feedbackSessionData.sessionDate }}
              </div>
            </div>
          </div>
        </div>
      </div>

      <div
        v-if="commentsData"
        class="mt-5"
      >
        <div class="grid grid-cols-2">
          <h1 class="text-2xl text-gray-500">
            Comentarios
          </h1>
        </div>
        <div class="flex justify-end">
          <button class=" flex items-center gap-2 rounded bg-indigo-500 p-2 text-white">
            <inline-svg
              :src="require('images/icons/message-bubble.svg')"
              class="h-4 w-4 fill-indigo-900"
            />
            Añadir comentario
          </button>
        </div>

        <div
          v-for="comment in commentsData"
          :key="comment.id"
          class="mt-5"
        >
          <div
            :key="comment.id"
            class="rounded bg-gray-50 p-5 shadow-md"
          >
            <div class="flex">
              <inline-svg :src="require('images/icons/link.svg')" />

              <h1 class="ml-2 text-xl text-[#334155]">
                Título genérico
              </h1>
            </div>
            <div
              title="Comentario"
              class="mt-2"
            >
              <p class="text-lg text-[#334155]">
                {{ comment.body }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

