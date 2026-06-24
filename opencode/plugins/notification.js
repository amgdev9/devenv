export const NotificationPlugin = async ({ project, client, $, directory, worktree }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await $`pw-play ~/.config/opencode/plugins/ding.wav`
      }
    },
  }
}
