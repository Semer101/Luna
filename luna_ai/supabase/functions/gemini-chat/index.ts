import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

const SYSTEM_PROMPT = `You are Luna AI, a cycle-aware wellness assistant.
You help users manage productivity, wellness, and wellbeing according to their menstrual cycle.
You may generate task suggestions but NEVER create tasks directly — always require user approval.
Use cycle phase when generating recommendations.
When suggesting tasks, respond with a JSON block at the end:
\`\`\`json
{"tasks":[{"title":"...","description":"...","priority":"low|medium|high","suggested_date":"ISO8601","reasoning":"..."}],"journal":{"mood":"happy|calm|neutral|anxious|stressed|sad|energetic|null","energy":1-10,"stress":1-10}}
\`\`\`
Only include tasks when the user mentions actionable items. Only include journal when emotional content is detected.`

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { messages, cyclePhase, wellnessContext } = await req.json()
    const apiKey = Deno.env.get('GEMINI_API_KEY')
    if (!apiKey) throw new Error('GEMINI_API_KEY not configured')

    const contextMessage = `Current cycle phase: ${cyclePhase ?? 'unknown'}. Wellness context: ${JSON.stringify(wellnessContext ?? {})}`
    const contents = [
      { role: 'user', parts: [{ text: SYSTEM_PROMPT }] },
      { role: 'model', parts: [{ text: 'Understood. I am Luna AI, your cycle-aware wellness copilot.' }] },
      { role: 'user', parts: [{ text: contextMessage }] },
      ...messages.map((m: { role: string; content: string }) => ({
        role: m.role === 'assistant' ? 'model' : 'user',
        parts: [{ text: m.content }],
      })),
    ]

    const response = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:streamGenerateContent?alt=sse&key=${apiKey}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ contents }),
      },
    )

    return new Response(response.body, {
      headers: { ...corsHeaders, 'Content-Type': 'text/event-stream' },
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  }
})
