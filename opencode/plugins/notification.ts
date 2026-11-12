import { Plugin } from "@opencode/plugin"

export default Plugin.define({
  id: "notification",

  setup(ctx) {
    const controller = new AbortController()

    void (async () => {
      for await (const event of ctx.event.subscribe({
        signal: controller.signal,
      })) {
        if (event.type !== "session.idle") continue

        await Bun.$`pw-play ~/.config/opencode/plugins/ding.wav`
      }
    })()

    return () => controller.abort()
  },
})

