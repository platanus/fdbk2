import type { AxiosResponse } from 'axios';
import type { Merge } from 'type-fest';
import api from './index';

export interface Comment {
  id: number;
  body: string;
}

export default {
  create(body: string, feedbackSessionId: number) {
    const path = `/app/feedback_sessions/${feedbackSessionId}/comments`;

    return api<unknown, Merge<AxiosResponse, { data: { body: string, feedbackSessionId: number }}>>({
      method: 'post',
      url: path,
      data: {
        body,
        feedbackSessionId,
      },
    });
  },
};
