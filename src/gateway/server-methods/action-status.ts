/**
 * Action status broadcast method.
 *
 * Allows the agent to emit status indicators to the UI
 * (e.g., "Calling Jordan...", "Talking to Jordan...", "Summarizing call...")
 */

import type { GatewayRequestHandler } from "./types.js";

type ActionStatusParams = {
  id: string;
  text: string;
  state: "active" | "complete" | "fading" | "remove";
};

const handler: GatewayRequestHandler = async ({ params, respond, context }) => {
  console.log("[action.status] handler called with params:", JSON.stringify(params));
  const p = params as ActionStatusParams | undefined;
  if (!p || typeof p.id !== "string" || typeof p.text !== "string" || typeof p.state !== "string") {
    console.log("[action.status] invalid params");
    respond(false, undefined, { code: "INVALID_PARAMS", message: "id, text, and state required" });
    return;
  }

  const validStates = ["active", "complete", "fading", "remove"];
  if (!validStates.includes(p.state)) {
    respond(false, undefined, {
      code: "INVALID_STATE",
      message: `state must be one of: ${validStates.join(", ")}`,
    });
    return;
  }

  console.log("[action.status] broadcasting to clients...");
  context.broadcast("action.status", {
    id: p.id,
    text: p.text,
    state: p.state,
  });
  console.log("[action.status] broadcast complete");

  respond(true, { ok: true });
};

export const actionStatusHandlers = {
  "action.status": handler,
};
