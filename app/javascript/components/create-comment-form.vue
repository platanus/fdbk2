<script setup lang="ts">
import { ref } from 'vue';
import type { FeedbackSession } from 'api/feedback-sessions';
import api from 'api/comments';

interface Props {
  feedbackSession: FeedbackSession;
}

const props = defineProps<Props>();
const bodyRef = ref('');

async function sendPostComment() {
  const response = await api.create(bodyRef.value, props.feedbackSession.id);
  if (response.status === 201) {
    const redirectTo = `/app/feedback_sessions/${props.feedbackSession.id}`;
    window.location.href = redirectTo;
  } else {
    console.error('Error creating comment');
  }
}
</script>

<template>
  <div class="mx-auto mt-5 max-w-7xl py-4">
    <h1 class="gap-2.5 text-3xl font-light text-gray-700">
      Crear comentario
    </h1>

    <div class="mt-4 rounded bg-slate-100 p-4">
      <p class="mb-2 font-sans text-sm font-medium text-gray-700">
        Comentario
      </p>
      <textarea
        v-model="bodyRef"
        class="mb-3 w-full rounded-md border-gray-200 px-2 py-4"
        placeholder="Escribe tu comentario"
      />
      <button
        class="mt-2 flex items-center gap-2 rounded bg-indigo-500 p-2 text-white"
        @click="sendPostComment"
      >
        <inline-svg
          :src="require('images/icons/message-bubble.svg')"
          class="h-4 w-4 fill-indigo-900"
        />
        Añadir comentario
      </button>
    </div>
  </div>
</template>
