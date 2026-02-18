import os
from dotenv import load_dotenv
from google import genai
from google.genai import types

# 1. Load configuration from .env file
# YOU NEED TO HAVE A .env FILE WITH YOUR API KEY IN.
#Example .env file: GEMINI_API_KEY=your_actual_api_key_here
load_dotenv()
API_KEY = os.getenv("GEMINI_API_KEY")

# 2. Initialize Client
client = genai.Client(api_key=API_KEY)

# 3. Define the System Instruction
# This sets the "personality" or "rules" for the AI
SYSTEM_PROMPT = "Create a Mad Lib based on the user's text using placeholders: [PLACEHOLDER_NOUN], [PLACEHOLDER_ADJECTIVE], [PLACEHOLDER_VERB], [PLACEHOLDER_ADVERB], and [PLACEHOLDER_NAME]. Provide ONLY the body of the Mad Lib. Do not include a title, introduction, conclusion, instructions, or any formatting like Markdown headers or bolding. The madlib body should be at least 10 sentences long"

def main():
    user_input = input("What should the madlib be about?: ")

    # 4. Generate Stream with System Instruction in the config
    response = client.models.generate_content_stream(
        model="gemini-3-flash-preview",
        config=types.GenerateContentConfig(
            system_instruction=SYSTEM_PROMPT,
            temperature=0.7,
        ),
        contents=user_input
    )

    print("\n--- Response ---")
    for chunk in response:
        if chunk.text:
            print(chunk.text, end="")
    print("\n----------------")

if __name__ == "__main__":
    main()