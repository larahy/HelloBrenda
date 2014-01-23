json.array! @comments do |comment|
  json.text comment.text
  json.commenter comment.user.email
end