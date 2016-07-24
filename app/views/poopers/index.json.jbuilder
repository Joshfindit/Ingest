json.array!(@poopers) do |pooper|
  json.extract! pooper, :id, :name, :email, :user_id
  json.url pooper_url(pooper, format: :json)
end
