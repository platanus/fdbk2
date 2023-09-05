<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';

interface Props {
  feedbackSession: FeedbackSession;
}

const props = defineProps<Props>();
const feedbackSessionURL = window.location.href.replace('/comments/new', '');
</script>

<template>
  <div class="mx-auto mt-5 max-w-7xl">
    <a
      class="mb-3 flex h-8 w-14 place-content-center items-center gap-2 rounded-full bg-gray-50 p-2 text-indigo-500"
      :href="feedbackSessionURL"
    >
      <inline-svg
        :src="require('images/icons/left-arrow.svg')"
        class="h-4 w-4 fill-indigo-500 "
      />
    </a>
    <base-title class="mx-auto max-w-7xl">
      Sesiones de Feedback # {{ props.feedbackSession.id }}
    </base-title>
    <div class="container mx-auto mt-2.5">
      <author-header :feedback-session="props.feedbackSession" />
      <create-comment-form :feedback-session="props.feedbackSession" />
    </div>
  </div>
</template>

