json.array! @posts do |post|
	json.id post.id
	json.time post.created_at
	json.user post.user.name
	json.body post.body
	json.userId post.user_id
	json.comments post.comments.count
end	