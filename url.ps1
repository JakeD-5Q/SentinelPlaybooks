$url = "https://raw.githubusercontent.com/JakeD-5Q/SentinelPlaybooks/main/_Custom%20Playbooks/Enrich-EmailIncidents/template.json"
[uri]::EscapeDataString($url)

# https://portal.azure.com/#create/Microsoft.Template/uri/ + generate url from ^^