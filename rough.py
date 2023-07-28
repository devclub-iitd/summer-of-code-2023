import requests as r
x = r.get("https://marketplace-1-b3203472.deta.app/search/")
for y in x.json():
    id = (y["_id"]["$oid"])
    r.delete(f"https://marketplace-1-b3203472.deta.app/product/{id}")