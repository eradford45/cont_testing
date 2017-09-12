json.extract! person, :id, :hair_color, :eye_color, :alive, :created_at, :updated_at
json.url person_url(person, format: :json)
