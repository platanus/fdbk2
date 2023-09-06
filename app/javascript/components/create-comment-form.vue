<script setup lang="ts">
import { useMutation } from '@tanstack/vue-query';
import type { FeedbackSession } from 'api/feedback-sessions';
import AlertComponent from 'components/alert-component.vue';
import api from 'api/comments';
import { ref } from 'vue';

interface Props {
  feedbackSession: FeedbackSession;
}

const props = defineProps<Props>();
const commentBody = ref('');
const isShowingAlert = ref(false);

function showTemporaryAlert(duration = 5000) {
  isShowingAlert.value = true;
  setTimeout(() => {
    isShowingAlert.value = false;
  }, duration);
}

const { mutate, isLoading, isError, error, isSuccess } = useMutation({
  mutationFn: (body: string) => api.create(body, props.feedbackSession.id),
  onError: () => {
    showTemporaryAlert();
  },
  onSuccess: () => {
    const redirectTo = `/app/feedback_sessions/${props.feedbackSession.id}`;
    window.location.href = redirectTo;
  },
});

function sendPostComment() {
  mutate(commentBody.value);
}
</script>

<template>
  <div>
    <div class="mx-auto mt-5 max-w-7xl py-4">
      <h1 class="gap-2.5 text-3xl font-light text-gray-700">
        Crear comentario
      </h1>
      <div class="mt-4 rounded bg-slate-100 p-4">
        <p class="mb-2 font-sans text-sm font-medium text-gray-700">
          Comentario
        </p>
        <textarea
          v-model="commentBody"
          class="mb-3 w-full rounded-md border-gray-200 px-2 py-4"
          placeholder="Escribe tu comentario"
        />
        <button
          class="mt-2 flex items-center gap-2 rounded bg-indigo-500 p-2 text-white"
          :disabled="isLoading"
          @click="sendPostComment"
        >
          <inline-svg
            :src="require('images/icons/message-bubble.svg')"
            class="h-4 w-4 fill-indigo-900"
          />
          Añadir comentario
        </button>
      </div>
      <alert-component
        v-if="isShowingAlert"
        title="Error al crear el comentario"
        description="Por favor, inténtalo de nuevo con un comentario válido."
      />
    </div>
  </div>
</template>
