<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';
import type { Comment } from 'api/comments';

interface Props {
  feedbackSession: FeedbackSession
  comments: Comment[]
}

const props = defineProps<Props>();

</script>

<template>
  <div class="mx-auto mt-5 max-w-7xl">
    <a
      class="mb-3 flex h-8 w-14 place-content-center items-center gap-2 rounded-full bg-gray-50  text-indigo-500"
      href="/"
    >
      <inline-svg
        :src="require('images/icons/left-arrow.svg')"
        class="h-4 w-4 fill-indigo-500 "
      />
    </a>
    <base-title class="mx-auto max-w-7xl">
      Sesiones de Feedback #{{ props.feedbackSession?.id }}
    </base-title>

    <div class="container mx-auto mt-2.5">
      <author-header :feedback-session="props.feedbackSession" />

      <div
        v-if="props.comments"
        class="mt-5"
      >
        <div class="grid grid-cols-2">
          <h1 class="text-2xl text-gray-500">
            Comentarios
          </h1>
        </div>
        <div class="flex justify-end">
          <a
            class=" flex items-center gap-2 rounded bg-indigo-500 p-2 text-white"
            :href="`/app/feedback_sessions/${props.feedbackSession?.id}/comments/new`"
          >
            <inline-svg
              :src="require('images/icons/message-bubble.svg')"
              class="h-4 w-4 fill-indigo-900"
            />
            Añadir comentario
          </a>
        </div>

        <div
          v-for="comment in props.comments"
          :key="comment.id"
          class="mt-5"
        >
          <div
            :key="comment.id"
            class="rounded bg-gray-50 p-5 shadow-md"
          >
            <div class="flex">
              <inline-svg :src="require('images/icons/link.svg')" />

              <h1 class="ml-2 text-xl text-slate-700">
                Título genérico
              </h1>
            </div>
            <div
              title="Comentario"
              class="mt-2"
            >
              <p class="text-lg text-slate-700">
                {{ comment.body }}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

