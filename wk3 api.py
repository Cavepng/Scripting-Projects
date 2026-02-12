from google import genai
from google.genai import types

client = genai.Client(api_key="AIzaSyDjKlZfEoCtMa8zmqzR0jQuF_tKBILPdOk")
prompt = input("What is your prompt: ")
response = client.models.generate_content_stream(
    model="gemini-3-flash-preview",
    config=types.GenerateContentConfig(
        system_instructions="Answer in a few sentances max"),
    contents=prompt
)
for chunk in response:
    print(chunk.text, end="")