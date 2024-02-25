import requests

CA_FILE = "CA.pem"

print(f"trying request with verify={CA_FILE}")
try:
    r = requests.get("https://localhost:1443/motto.txt", verify=CA_FILE)
    print(f"SUCCESS: {r.status_code} {r.text}")
except Exception as exc:
    print(f"FAILURE: {exc}")
