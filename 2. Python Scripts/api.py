#import requests
#import webhooks

from google import genai

# The client gets the API key from the environment variable `GEMINI_API_KEY`.
client = genai.Client(api_key="AIzaSyDi4g7J-gxoQWuM3hlS9Bhe8VZ1pHJrDB8")

response = client.models.generate_content(
    model="gemini-3-flash-preview", contents="Explain how AI works in a few words"
)
print(response.text)
